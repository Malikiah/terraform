resource "digitalocean_droplet" "master" {
    count = var.master_count
    name = "${count.index + 1}" > 9 ? "${var.region}-master-node-${count.index + 1}" : "${var.region}-master-node-0${count.index + 1}"
    image = var.image
    region = var.region
    size = var.master_size
    ssh_keys = [ 
        data.digitalocean_ssh_key.malikiah.id
    ]
    tags = [
        "k8s",
        "master",
        var.image
    ]
}

resource "digitalocean_droplet" "worker" {
    count = var.worker_count
    name = "${count.index + 1}" > 9 ? "${var.region}-worker-node-${count.index + 1}" : "${var.region}-worker-node-0${count.index + 1 }"
    image = var.image
    region = var.region
    size = var.worker_size
    ssh_keys = [ 
        data.digitalocean_ssh_key.malikiah.id
    ]
    tags = [
        "k8s",
        "worker",
        var.image,
    ]
}

resource "digitalocean_loadbalancer" "public" {
    name = "${var.region}-loadbalancer-01" #"${count.index + 1}" > 9 ? "${var.region}-loadbalancer-${count.index + 1}" : "${var.region}-loadbalancer-0${count.index + 1}"
    region = var.region

    forwarding_rule {
        entry_port = 80
        entry_protocol = "http"

        target_port = 30080
        target_protocol = "http"
    }
    
    forwarding_rule {
        entry_port = 443
        entry_protocol = "https"

        target_port = 30443
        target_protocol = "https"
        tls_passthrough = true
        # certificate_id = digitalocean_certificate.cert.id
    }

    healthcheck {
        port     = 30080
        path     = "/healthz"
        protocol = "http"
    }

    droplet_ids = [
            for droplet in digitalocean_droplet.worker: droplet.id
        ]

    depends_on = [
        digitalocean_droplet.master,
        digitalocean_droplet.worker,
    ]
}

resource "digitalocean_domain" "domains" {
  count = length(local.domains)
  name       = local.domains[count.index]
  ip_address = digitalocean_loadbalancer.public.ip
}
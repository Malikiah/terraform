resource "digitalocean_kubernetes_cluster" "k8s" {
    # count = var.k8s_count
    name = "${var.region}-k8s-cluster" # "${count.index + 1}" > 9 ? "${var.region}-k8s-cluster-${count.index + 1}" : "${var.region}-k8s-cluster-0${count.index + 1}"
    region = var.region
    version = "1.16.6-do.2"
    
    node_pool {
        name       = "worker-pool"
        size       = var.worker_size
        node_count = 2
    }

    tags = [
        "k8s",
        "master",
        var.image
    ]

}

# resource "digitalocean_loadbalancer" "public" {
#     name = "${var.region}-loadbalancer-01" #"${count.index + 1}" > 9 ? "${var.region}-loadbalancer-${count.index + 1}" : "${var.region}-loadbalancer-0${count.index + 1}"
#     region = var.region
    
#     forwarding_rule {
#         entry_port = 443
#         entry_protocol = "https"

#         target_port = 443
#         target_protocol = "https"
#         tls_passthrough = true
#         # certificate_id = digitalocean_certificate.cert.id
#     }

#     droplet_ids = [
#             # for droplet in local.node_ids: droplet
#         ]

#     depends_on = [
#         # local.node_ids,
#     ]
# }

resource "digitalocean_domain" "domains" {
  count = length(local.domains)
  name       = local.domains[count.index]
  ip_address = data.digitalocean_kubernetes_cluster.k8s.ipv4_address
}
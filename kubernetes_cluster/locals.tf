locals {
    master_nodes = [for droplet in digitalocean_droplet.master: format("${droplet.name} ansible_host=${droplet.ipv4_address}")]
    worker_nodes = [for droplet in digitalocean_droplet.worker: format("${droplet.name} ansible_host=${droplet.ipv4_address}")]

    #node_ids = flatten(list([for droplet in module.nfs : droplet.id],[for droplet in digitalocean_droplet.worker: droplet.id]))
    
    domains = list(var.nextcloud_domain)
}


locals {

    # node_ids = flatten(list([for droplet in digitalocean_droplet.worker: droplet.id]))
    # node_ids = flatten(list([for droplet in digitalocean_droplet.nfs: droplet.id],[for droplet in digitalocean_droplet.worker: droplet.id]))
    
    domains = list(var.nextcloud_domain)
}


data "template_file" "inventory" {
    template =  file("./templates/inventory.tpl")

    vars = {
        ssh_user = var.ssh_user,
        ssh_key = var.ssh_key,
        worker_nodes = data.digitalocean_kubernetes_cluster.k8s.ipv4_address
        nfs_nodes = join("\n", module.nfs.nfs_nodes),
        admin_email = var.admin_email,
        nfs_domain = module.nfs.nfs_domain,
        nfs_directories = join(",", var.nfs_directories)
        nextcloud_domain = var.nextcloud_domain
    }

    depends_on = [
        digitalocean_kubernetes_cluster.k8s,
        module.nfs,
    ]
}

resource "null_resource" "cmd" {

    triggers = { 
        template_rendered = data.template_file.inventory.rendered
    }

    provisioner "local-exec" {
        command = "mkdir -p ansible"
    }

    provisioner "local-exec" {
        command = "echo '${data.template_file.inventory.rendered}' > ansible/inventory.cfg"
    }

    provisioner "local-exec" {
        command = "echo '${data.digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config}' > $HOME/.kube/config"
    }

}

data "template_file" "inventory" {
    template =  file("./templates/inventory.tpl")

    vars = {
        deployment_state = var.deployment_state
        ssh_user = var.ssh_user,
        ssh_key = var.ssh_key,
        master_nodes = join("\n", local.master_nodes),
        worker_nodes = join("\n", local.worker_nodes),
        nfs_nodes = join("\n", module.nfs.nfs_nodes),
        admin_email = var.admin_email,
        nfs_domain = module.nfs.nfs_domain,
        nfs_path = module.nfs.nfs_path
        nextcloud_domain = var.nextcloud_domain
        wordpress_domain = var.wordpress_domain
    }

    depends_on = [
        digitalocean_droplet.master,
        digitalocean_droplet.worker,
        module.nfs,
    ]
}

resource "null_resource" "ansible_configuration" {
    triggers = { 
        template_rendered = data.template_file.inventory.rendered
    }

    provisioner "local-exec" {
        command = "rm -rf ansible"
    }

    provisioner "local-exec" {
        command = "mkdir -p ansible"
    }

    provisioner "local-exec" {
        command = "git clone https://github.com/Malikiah/playbooks.git ansible"
    }
    
    provisioner "local-exec" {
        command = "git clone https://github.com/Malikiah/roles.git ansible/roles"
    }

        provisioner "local-exec" {
        command = "echo '${data.template_file.inventory.rendered}' > ansible/inventory.cfg"
    }

}
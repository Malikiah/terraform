[all:vars]
deployment_state = ${deployment_state}
ansible_python_interpreter  = /usr/bin/python3
ansible_user = ${ssh_user}
ansible_ssh_private_key_file = ${ssh_key}
admin_email = ${admin_email}
nfs_domain = ${nfs_domain}
nfs_path = ${nfs_path}
nextcloud_domain = ${nextcloud_domain}
wordpress_domain = ${wordpress_domain}


[master_nodes]
${master_nodes}


[worker_nodes]
${worker_nodes}

[nfs_nodes]
${nfs_nodes}

[nodes]
${master_nodes}
${worker_nodes}
${nfs_nodes}
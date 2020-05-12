deployment_state = "staging"

// Master Variables \\
master_count = 1
master_size = "s-2vcpu-2gb"

// Worker Variables \\
worker_count = 1
worker_size = "s-2vcpu-4gb"

// DigitalOcean Variables \\
image = "fedora-30-x64"
region = "sfo2"

// Linux Variables \\
ssh_user = "root"
ssh_key = "~/.ssh/id_rsa"

admin_email = "root@localhost"

// DNS Variables \\
nextcloud_domain = "cloud.artace.io"
wordpress_domain = "wordpress.artace.io"



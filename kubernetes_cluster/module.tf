module "nfs" {
    source = "github.com/Malikiah/nfs-module"

    // NFS Variables \\
    nfs_count = 1
    nfs_size = "s-2vcpu-4gb"
    nfs_domain = "nfs.artace.io"
    nfs_path = "/data/nfs4"
    

    // DigitalOcean Variables \\
    image = "fedora-30-x64"
    region = "sfo2"

    // Linux Variables \\
    ssh_user = "root"
    ssh_key = "~/.ssh/id_rsa"
    
}
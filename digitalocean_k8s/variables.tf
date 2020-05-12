# // NFS Variables \\
variable "nfs_directories" {
    description = ""
    default = ""
}

// K8s Variables \\
variable "k8s_count" {
    description = ""
    default = 0
}

variable "worker_size" {
    default = "s-2vcpu-4gb"
}

// DigitalOcean Variables \\

variable "image" {
    default = "fedora-31-x64"
}

variable "region" {
    default = "sfo2"
}

// Linux Variables \\
variable "ssh_user" {
  description = ""
  default = "root"
}

variable "ssh_key" {
  description = ""
  default = ""
}

variable "admin_email" {
  description = ""
  default = ""
}


// DNS Variables \\

variable "nextcloud_domain" {
  description = ""
  default = ""
}

// Variables \\

variable "mariadb_root_password" {
  description = ""
  default = ""
}

variable "mariadb_password" {
  description = ""
  default = ""
}

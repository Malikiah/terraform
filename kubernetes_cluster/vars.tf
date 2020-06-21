variable "deployment_state" {
  description = ""
  default = "staging"
}


// Master Variables \\
variable "master_count" {
  description = ""
  default = 0
}

variable "master_size" {
  default = "s-2vcpu-4gb"
}

// Worker Variables \\

variable "worker_count" {
  description = ""
  default = 0
}

variable "worker_size" {
  description = ""
  default = "s-2vcpu-4gb"
}

// DigitalOcean Variables \\

variable "image" {
  description = ""
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

variable "main_domain" {
  description = ""
  default = ""
}


variable "nextcloud_domain" {
  description = ""
  default = ""
}

variable "wordpress_domain" {
  description = ""
  default = ""
}
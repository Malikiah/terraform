data "digitalocean_volume" "nfs-volume-sfo2-01" {
  name   = "nfs-volume-sfo2-01"
  region = var.region
}
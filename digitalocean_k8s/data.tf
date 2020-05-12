data "digitalocean_kubernetes_cluster" "k8s" {
  name = digitalocean_kubernetes_cluster.k8s.name
}
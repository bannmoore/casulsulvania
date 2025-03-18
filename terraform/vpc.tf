# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc
resource "digitalocean_vpc" "cas_vpc" {
  name   = "cas-network"
  region = var.do_region
}

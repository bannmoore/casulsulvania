# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_cluster
resource "digitalocean_database_cluster" "cas_postgres" {
  name                 = "cas-postgres"
  engine               = "pg"
  version              = "17"
  size                 = "db-s-1vcpu-1gb"
  region               = var.do_region
  node_count           = 1
  private_network_uuid = digitalocean_vpc.cas_vpc.id
}

# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_firewall
resource "digitalocean_database_firewall" "cas_postgres_firewall" {
  cluster_id = digitalocean_database_cluster.cas_postgres.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.cas_jump_server.id
  }

  rule {
    type  = "app"
    value = digitalocean_app.cas_app.id
  }
}


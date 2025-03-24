# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project
resource "digitalocean_project" "cas_project" {
  name        = "casulsulvania"
  description = "Casulsulvania"
  environment = "development"
  purpose     = "Web Application"
  resources = [
    digitalocean_app.cas_app.urn,
    digitalocean_database_cluster.cas_postgres.urn,
    digitalocean_droplet.cas_jump_server.urn,
    digitalocean_volume.cas_jump_server_volume.urn,
    digitalocean_domain.casulsulvania_com.urn,
    digitalocean_spaces_bucket.cas.urn
  ]
}

# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project
resource "digitalocean_project" "cas_project" {
  name        = "casulsulvania"
  description = "Casulsulvania"
  environment = "development"
  purpose     = "Web Application"
  resources   = []
}

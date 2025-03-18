# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/ssh_key
resource "digitalocean_ssh_key" "cas_jump_server_ssh_key" {
  name       = "cas-jump-server-ssh-key"
  public_key = file("${var.jump_server_ssh_key_path}.pub")
}

# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet
resource "digitalocean_droplet" "cas_jump_server" {
  name     = "cas-jump-server"
  image    = "ubuntu-24-10-x64"
  region   = var.do_region
  size     = "s-1vcpu-512mb-10gb"
  ssh_keys = [digitalocean_ssh_key.cas_jump_server_ssh_key.fingerprint]
  vpc_uuid = digitalocean_vpc.cas_vpc.id
}

# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume
# This volume will be available on the jump_server at /mnt/cas_jump_server_volume/ 
resource "digitalocean_volume" "cas_jump_server_volume" {
  name                    = var.jump_server_volume_name
  region                  = var.do_region
  size                    = 10
  initial_filesystem_type = "ext4"
  description             = "Jump server for database management"
}

# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume_attachment
resource "digitalocean_volume_attachment" "cas_jump_volume_attachment" {
  droplet_id = digitalocean_droplet.cas_jump_server.id
  volume_id  = digitalocean_volume.cas_jump_server_volume.id
}

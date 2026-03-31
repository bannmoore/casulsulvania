resource "digitalocean_spaces_bucket" "cas" {
  name   = "casulsulvania-storage"
  region = var.do_region
  acl    = "public-read"
}

# resource "digitalocean_spaces_bucket_cors_configuration" "cas_dev" {
#   bucket = digitalocean_spaces_bucket.cas.id
#   region = var.do_region

#   cors_rule {
#     allowed_headers = ["*"]
#     allowed_methods = ["GET", "PUT"]
#     allowed_origins = ["http://localhost:3000"]
#     max_age_seconds = 3000
#   }
# }

resource "digitalocean_spaces_bucket_cors_configuration" "cas" {
  bucket = digitalocean_spaces_bucket.cas.id
  region = var.do_region

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["https://${digitalocean_domain.casulsulvania_com.name}"]
    max_age_seconds = 3000
  }
}

resource "digitalocean_spaces_key" "cas_app" {
  name = "cas-app"
  grant {
    bucket     = digitalocean_spaces_bucket.cas.name
    permission = "readwrite"
  }
}

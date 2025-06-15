# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/domain
resource "digitalocean_domain" "casulsulvania_com" {
  name = "casulsulvania.com"
}

# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/app
resource "digitalocean_app" "cas_app" {
  spec {
    name   = "casulsulvania"
    region = var.do_app_region

    alert {
      rule = "DEPLOYMENT_FAILED"
    }

    domain {
      name = digitalocean_domain.casulsulvania_com.name
      type = "PRIMARY"
      zone = digitalocean_domain.casulsulvania_com.name
    }

    service {
      name               = "app"
      http_port          = 80
      instance_count     = 1
      instance_size_slug = "basic-xxs"

      image {
        registry_type = "DOCR"
        repository    = "casulsulvania"
        tag           = "latest"
        deploy_on_push {
          enabled = true
        }
      }

      env {
        key   = "NODE_ENV"
        value = "production"
      }

      env {
        key   = "BASE_URL"
        value = "https://${digitalocean_domain.casulsulvania_com.name}"
      }

      env {
        key   = "DATABASE_URL"
        value = digitalocean_database_cluster.cas_postgres.uri
        type  = "SECRET"
      }

      env {
        key   = "DATABASE_CERT"
        value = "$${cas-database.CA_CERT}"
        type  = "SECRET"
      }

      env {
        key   = "POSTMARK_APIKEY"
        value = var.postmark_apikey
        type  = "SECRET"
      }

      env {
        key   = "DO_SPACES_SECRET_KEY"
        value = digitalocean_spaces_key.cas_app.secret_key
        type  = "SECRET"
      }

      env {
        key   = "DO_SPACES_ACCESS_ID"
        value = digitalocean_spaces_key.cas_app.access_key
        type  = "SECRET"
      }

      env {
        key   = "DO_SPACES_BUCKET_NAME"
        value = digitalocean_spaces_bucket.cas.name
        type  = "SECRET"
      }
      env {
        key   = "DO_SPACES_ENDPOINT"
        value = digitalocean_spaces_bucket.cas.endpoint
        type  = "SECRET"
      }
    }

    database {
      name         = "cas-database"
      cluster_name = digitalocean_database_cluster.cas_postgres.name
      db_name      = "defaultdb"
      db_user      = "doadmin"
      engine       = "PG"
      production   = true
    }
  }
}

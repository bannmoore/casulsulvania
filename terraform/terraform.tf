terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  cloud {

    organization = "bannmoore"

    workspaces {
      name = "casulsulvania-infra"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

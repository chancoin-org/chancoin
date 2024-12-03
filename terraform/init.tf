terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.44.1"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "2.22.1"
    }

    pass = {
      source = "camptocamp/pass"
    }

  }
}

provider "digitalocean" {
  # Configuration options
}

provider "vultr" {
  # Configuration options
}

provider "pass" {
  store_dir     = "/Users/chazu/.password-store" # defaults to $PASSWORD_STORE_DIR
  refresh_store = false                          # do not call `git pull`
}

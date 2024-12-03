data "digitalocean_domain" "eschaton" {
  name = "eschaton.rsvp"
}

data "vultr_ssh_key" "nikaido" {
  filter {
    name   = "name"
    values = ["nikaido"]
  }
}

resource "vultr_instance" "node1" {
  plan        = "vc2-1c-2gb"
  region      = "atl"
  os_id       = 2465
  ssh_key_ids = [data.vultr_ssh_key.nikaido.id]
  user_data   = file("node-setup.yaml")
}

resource "vultr_instance" "node2" {
  plan        = "vc2-1c-2gb"
  region      = "mel"
  os_id       = 2465
  ssh_key_ids = [data.vultr_ssh_key.nikaido.id]
  user_data   = file("node-setup.yaml")
}

resource "vultr_instance" "node3" {
  plan        = "vc2-1c-2gb"
  region      = "mia"
  os_id       = 2465
  ssh_key_ids = [data.vultr_ssh_key.nikaido.id]
  user_data   = file("node-setup.yaml")
}


resource "digitalocean_record" "node1" {
  domain = data.digitalocean_domain.eschaton.id
  type   = "A"
  name   = "node1"
  value  = vultr_instance.node1.main_ip
}

resource "digitalocean_record" "node2" {
  domain = data.digitalocean_domain.eschaton.id
  type   = "A"
  name   = "node2"
  value  = vultr_instance.node2.main_ip
}

resource "digitalocean_record" "node3" {
  domain = data.digitalocean_domain.eschaton.id
  type   = "A"
  name   = "node3"
  value  = vultr_instance.node3.main_ip
}

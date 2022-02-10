terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.25.2"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.token
}

# Create a Linode
resource "linode_instance" "k8s" {
  label           = var.label
  image           = "linode/centos7"
  region          = var.region
  type            = var.type
  authorized_keys = var.authorized_keys
  root_pass       = var.root_pass
  swap_size       = var.swap_size
}

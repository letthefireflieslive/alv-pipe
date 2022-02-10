output "public_ip" {
  description = "Public IP Address"
  value = linode_instance.k8s.ip_address
}


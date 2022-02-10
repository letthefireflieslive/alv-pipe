variable "token" {
  description = "Personal Access Token"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "root_pass" {
  description = "Root password"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "authorized_keys" {
  description = "SSH public keys"
  type        = list(string)
}

variable "region" {
  description = "The location where the linode is deployed"
  type        = string
  nullable    = false
  default     = "ap-south"
}

variable "type" {
  description = "Linode type/specs"
  type        = string
  nullable    = false
  default     = "g7-highmem-2"
}

variable "label" {
  description = "Machine name in Linode"
  type        = string
  default     = "k8s-cluster"
}

variable "swap_size" {
  description = "Memory swap size in mb"
  type        = number
  default     = 512
}

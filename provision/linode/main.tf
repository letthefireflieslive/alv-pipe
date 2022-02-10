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
resource "linode_instance" "kind" {
  label = "k8s"
  image = "linode/centos7"
  region = "ap-south"
  type = "g7-highmem-2"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0j0TPeNDsdHOFbC7nK9Ucy8phgnahPyjGx0N1eDTvq2Eyg8nzwcbv1Zt2t9pXN3Ln7bhto5jcqvlOqFzy/Z2bOjUzZoqKkb1e+fM6VysDLqV9ieTAbxE8OuDKqN1pcNb3FiCsbWGYf9wJmr0noToPdwNQ1ThPTGSQfjvtpB7+mOxE4R20BkL4Q7csRHWpImAomxlOnApEt411WZheWly2yDbzTmR3r9JS4KYHgS8/nivgJ+Qjq7PGWu0C762diPSHM+uZ4i77Uy0yDXvivvYhVYe8gPK+Ot6dL+e6c2Fjs64uCYPUWo/MkJ+0E4Uln7cl+/6KkAqGPupJMN8fWBa+knR3OJuSU77+efQN3Msn9O0dAk3tyZ5a3E3fdT101M1kt1as/TzoZvnVtUCRaZX16wzBKnAwlUmEpyoJJIy5DPZLpsgNBVMbE26oWQbFMRiFi9ls5/Spcm1qwy78SgJgtfRopIzZsgg6kVgvmJ5alj/3T+81uEjpmv6S1n2ys0s= lnabong@WFGLC-lnabong.local"]
  root_pass = var.root_pass
  swap_size = 512
  private_ip = true
}

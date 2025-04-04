locals {
  canonical_ami_account_id = "099720109477" # Canonical's AWS account ID for Ubuntu AMIs
  ami_data = {
    "amazonlinux" = {
      ami_name  = "al2023-ami-2023*-${var.arch}"
      ami_owner = "amazon"
    },
    "ubuntu22lts" = {
      ami_name  = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-${var.arch}-server-*"
      ami_owner = local.canonical_ami_account_id
    }
    "ubuntu24lts" = {
      ami_name  = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-${var.arch}-server-*"
      ami_owner = local.canonical_ami_account_id
    }
  }
}

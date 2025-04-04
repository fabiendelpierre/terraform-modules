locals {
  managed_policy_arns = var.register_with_session_manager ? flatten([
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", var.iam_role_policy_arns
  ]) : var.iam_role_policy_arns

  ami_data = {
    "amazonlinux" = {
      ami_name   = "al2023-ami-2023*-${var.arch}"
      ami_owner  = "amazon"
    },
    "ubuntu22lts" = {
      ami_name   = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-${var.arch}-server-*"
      ami_owner  = "099720109477" # Canonical's AWS account ID for Ubuntu AMIs
    }
    "ubuntu24lts" = {
      ami_name   = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-${var.arch}-server-*"
      ami_owner  = "099720109477"
    }
  }
}

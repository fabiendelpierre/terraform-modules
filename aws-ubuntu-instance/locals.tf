locals {
  ubuntu_release = {
    "20" = "ubuntu-focal-20.04"
    "22" = "ubuntu-jammy-22.04"
  }
  ami_name = "ubuntu/images/hvm-ssd/${lookup(local.ubuntu_release, var.ubuntu_version)}-${var.arch}-server-*"

  managed_policy_arns = var.register_with_session_manager ? flatten([
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", var.iam_role_policy_arns
  ]) : var.iam_role_policy_arns
}

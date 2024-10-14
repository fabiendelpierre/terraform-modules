locals {
  managed_policy_arns = var.register_with_session_manager ? flatten([
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", var.iam_role_policy_arns
  ]) : var.iam_role_policy_arns
}

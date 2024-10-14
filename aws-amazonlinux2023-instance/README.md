# Inputs

- `arch`: Choose an AMI for AMD64 (x86_64) or ARM64 (aarch64) architecture (default: "arm64")
- `associate_public_ip_address`: Associate a public IP address with the instance (required for instances in a public subnet) (default: false)
- `iam_role_policy_arns`: A list of IAM policy ARNs to attach to the instance role (default: [])
- `instance_type`: The instance type to use (default: "t4g.nano")
- `key_pair_name`: The name of the key pair to use for the instance -- required for SSH access (default: null)
- `resource_name`: Value to use for the instance's Name tag
- `root_block_device_size`: The size of the root block device in GB (default: 8)
- `security_group_ids`: A list of pre-existing security group IDs to attach to the instance (default: [])
- `subnet_id`: The ID of the subnet in which to launch the instance
- `tags`: A map of tags to apply to the instance and associated resources (default: {})
- `user_data_base64`: Value to use for the instance's user data (default: null)
- `register_with_session_manager`: Whether to register the instance with AWS Systems Manager Session Manager (default: false)

# Example usage

```
module "instance" {
  source = "github.com/fabiendelpierre/terraform-modules.git//aws-amazonlinux2023-instance"

  resource_name               = "foo"
  key_pair_name               = "my_key_pair"
  security_group_ids          = ["sg-xxxxxx", "sg-yyyyyy"]
  subnet_id                   = "subnet-xxxxxxxx"
  associate_public_ip_address = true
  iam_role_policy_arns        = [data.aws_iam_policy.something.arn]
  user_data_base64            = base64encode(templatefile("${path.module}/instance_user_data.tpl", {}))

  tags = {
    "bar" = "baz"
  }
}
```

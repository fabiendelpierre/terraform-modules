# Example usage

```
module "instance" {
  source = "github.com/fabiendelpierre/terraform-modules.git//aws-ubuntu-instance"

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

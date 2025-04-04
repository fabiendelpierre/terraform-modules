resource "aws_iam_role" "main" {
  name = "${var.resource_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    {
      Name = "${var.resource_name}-role"
    },
    var.tags
  )
}

resource "aws_iam_role_policy_attachments_exclusive" "main" {
  role_name   = aws_iam_role.main.name
  policy_arns = local.managed_policy_arns
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.resource_name}-instance_profile"
  role = aws_iam_role.main.name
}

resource "aws_instance" "main" {
  ami                         = data.aws_ami.ami.id
  disable_api_termination     = false
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  subnet_id                   = var.subnet_id
  monitoring                  = false
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.security_group_ids
  ebs_optimized               = true
  iam_instance_profile        = aws_iam_instance_profile.main.name
  user_data_base64            = var.user_data_base64

  root_block_device {
    volume_type = "gp3"
    volume_size = var.root_block_device_size
    encrypted   = true
  }

  lifecycle {
    ignore_changes = [ami]
  }

  tags = merge(
    {
      Name = var.resource_name
    },
    var.tags
  )
  volume_tags = merge(
    {
      Name = var.resource_name
    },
    var.tags
  )
}

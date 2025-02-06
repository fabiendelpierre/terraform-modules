resource "aws_security_group" "main" {
  name        = "${data.aws_vpc.main.tags.Name}-ssm-vpc-endpoints"
  description = "Allow HTTPS to SSM endpoints"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block]
  }

  tags = merge({ Name = "${data.aws_vpc.main.tags.Name}-ssm-vpc-endpoints" }, var.tags)
}

resource "aws_vpc_endpoint" "ssm_endpoint" {
  vpc_id             = data.aws_vpc.main.id
  service_name       = "com.amazonaws.${data.aws_region.current.name}.ssm"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.main.id]

  tags = merge({ Name = "${data.aws_vpc.main.tags.Name}-ssm" }, var.tags)
}

resource "aws_vpc_endpoint" "ec2_messages_endpoint" {
  vpc_id             = data.aws_vpc.main.id
  service_name       = "com.amazonaws.${data.aws_region.current.name}.ec2messages"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.main.id]

  tags = merge({ Name = "${data.aws_vpc.main.tags.Name}-ec2messages" }, var.tags)
}

resource "aws_vpc_endpoint" "ssm_messages_endpoint" {
  vpc_id             = data.aws_vpc.main.id
  service_name       = "com.amazonaws.${data.aws_region.current.name}.ssmmessages"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.main.id]

  tags = merge({ Name = "${data.aws_vpc.main.tags.Name}-ssmmessages" }, var.tags)
}

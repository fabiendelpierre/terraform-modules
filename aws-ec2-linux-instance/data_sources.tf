data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [lookup(local.ami_data[var.linux_distribution], "ami_name")]
  }

  filter {
    name   = "architecture"
    values = [var.arch]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [lookup(local.ami_data[var.linux_distribution], "ami_owner")]
}

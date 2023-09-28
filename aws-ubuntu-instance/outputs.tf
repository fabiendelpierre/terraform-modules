output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "private_ip" {
  value = aws_instance.main.private_ip
}

output "public_ip" {
  value = try(aws_instance.main.public_ip, "")
}

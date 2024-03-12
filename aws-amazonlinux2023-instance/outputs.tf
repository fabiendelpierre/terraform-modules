output "ami_id" {
  value = data.aws_ami.amazonlinux2023.id
}

output "id" {
  value = aws_instance.main.id
}

output "private_ip" {
  value = aws_instance.main.private_ip
}

output "public_ip" {
  value = try(aws_instance.main.public_ip, "")
}

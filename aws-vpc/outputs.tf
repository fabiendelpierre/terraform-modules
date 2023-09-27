output "vpc" {
  value = {
    id         = aws_vpc.main.id
    arn        = aws_vpc.main.arn
    cidr_block = aws_vpc.main.cidr_block
  }
}

output "public_subnet1" {
  value = {
    id  = aws_subnet.public1.id
    az  = aws_subnet.public1.availability_zone
    arn = aws_subnet.public1.arn
  }
}

output "public_subnet2" {
  value = {
    id  = aws_subnet.public2.id
    az  = aws_subnet.public2.availability_zone
    arn = aws_subnet.public2.arn
  }
}

output "public_subnet3" {
  value = {
    id  = aws_subnet.public3.id
    az  = aws_subnet.public3.availability_zone
    arn = aws_subnet.public3.arn
  }
}

output "private_subnet1" {
  value = {
    id  = aws_subnet.private1.id
    az  = aws_subnet.private1.availability_zone
    arn = aws_subnet.private1.arn
  }
}

output "private_subnet2" {
  value = {
    id  = aws_subnet.private2.id
    az  = aws_subnet.private2.availability_zone
    arn = aws_subnet.private2.arn
  }
}

output "private_subnet3" {
  value = {
    id  = aws_subnet.private3.id
    az  = aws_subnet.private3.availability_zone
    arn = aws_subnet.private3.arn
  }
}

output "route_table_public_subnets" {
  value = aws_route_table.public_subnets.id
}

output "route_table_private_subnets" {
  value = aws_route_table.private_subnets.id
}

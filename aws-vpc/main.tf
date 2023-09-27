resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = merge(
    {
      Name = "${var.resource_name}-vpc"
    },
    var.tags
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name = "${var.resource_name}-igw"
    },
    var.tags
  )
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 0)
  availability_zone = "${var.region}a"

  tags = merge(
    {
      Name        = "${var.resource_name}-subnet-private1"
      subnet_type = "private"
      az          = "${var.region}a"
    },
    var.tags
  )
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 1)
  availability_zone = "${var.region}b"

  tags = merge(
    {
      Name        = "${var.resource_name}-subnet-private2"
      subnet_type = "private"
      az          = "${var.region}b"
    },
    var.tags
  )
}

resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 2)
  availability_zone = "${var.region}c"

  tags = merge(
    {
      Name        = "${var.resource_name}-subnet-private3"
      subnet_type = "private"
      az          = "${var.region}c"
    },
    var.tags
  )
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 4)
  availability_zone = "${var.region}a"

  tags = merge(
    {
      Name        = "${var.resource_name}-subnet-public1"
      subnet_type = "public"
      az          = "${var.region}a"
    },
    var.tags
  )
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 5)
  availability_zone = "${var.region}b"

  tags = merge(
    {
      Name        = "${var.resource_name}-subnet-public2"
      subnet_type = "public"
      az          = "${var.region}b"
    },
    var.tags
  )
}

resource "aws_subnet" "public3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 6)
  availability_zone = "${var.region}c"

  tags = merge(
    {
      Name        = "${var.resource_name}-subnet-public3"
      subnet_type = "public"
      az          = "${var.region}c"
    },
    var.tags
  )
}

resource "aws_eip" "natgw" {
  domain = "vpc"

  tags = merge(
    {
      Name = "${var.resource_name}-eip-natgw"
    },
    var.tags
  )
}

resource "aws_nat_gateway" "main" {
  depends_on = [aws_internet_gateway.main]

  allocation_id = aws_eip.natgw.id
  subnet_id     = aws_subnet.public1.id

  tags = merge(
    {
      Name = "${var.resource_name}-natgw"
    },
    var.tags
  )
}

resource "aws_route_table" "public_subnets" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name = "${var.resource_name}-rtb-public"
    },
    var.tags
  )
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public_subnets.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_subnets.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_subnets.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.public_subnets.id
}

resource "aws_route_table" "private_subnets" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name = "${var.resource_name}-rtb-private"
    },
    var.tags
  )
}

resource "aws_route" "private_natgw" {
  route_table_id         = aws_route_table.private_subnets.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_subnets.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_subnets.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private_subnets.id
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    {
      Name = "${var.resource_name}-nacl"
    },
    var.tags
  )
}

resource "aws_network_acl_association" "public1" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.public1.id
}

resource "aws_network_acl_association" "public2" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.public2.id
}

resource "aws_network_acl_association" "public3" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.public3.id
}

resource "aws_network_acl_association" "private1" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.private1.id
}

resource "aws_network_acl_association" "private2" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.private2.id
}

resource "aws_network_acl_association" "private3" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.private3.id
}

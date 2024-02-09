# Create a VPC (Virtual Private Cloud)
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${var.project_name}-vpc"
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "${var.project_name}-igw"
  }
}

# Use data source to get all Avalablility Zones in Region
data "aws_availability_zones" "available_zones" {}

# Create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az1"
  }
}

# Create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az2"
  }
}

# Create route table for public subnet and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "Public route table"
  }
}

# Associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# Associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# Create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_app_subnet_az1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private app subnet az1"
  }
}

# Create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_app_subnet_az2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private app subnet az2"
  }
}

# Create Elastic IP for public subnet az1 NAT GW
resource "aws_eip" "eip1" {
  domain   = "vpc"
}
# Create elastic ip for public subnet az2 NAT GW
resource "aws_eip" "eip2" {
  domain   = "vpc"
}

# Create NAT Gateway for public subnet az 1
resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "Public Subnet az1 Nat GW"
  }
}
  # Create NAT Gateway for public subnet az 2
resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "Public Subnet az2 Nat GW"
  }
}

# Create private route table for az1 private subnet and add route for internet via nat gw
resource "aws_route_table" "private_route_table_az1" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw1.id
  }

  tags       = {
    Name     = "Private route table az1"
  }
}

# Associate private app subnet az1 to "private route table az1"
resource "aws_route_table_association" "private_subnet_az1_route_table_association1" {
  subnet_id           = aws_subnet.private_app_subnet_az1.id
  route_table_id      = aws_route_table.private_route_table_az1.id
}


# Create private route table for az2 private subnet and add route for internet via nat gw
resource "aws_route_table" "private_route_table_az2" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw2.id
  }

  tags       = {
    Name     = "Private route table az2"
  }
}

# Associate private app subnet az2 to "private route table az2"
resource "aws_route_table_association" "private_subnet_az2_route_table_association1" {
  subnet_id           = aws_subnet.private_app_subnet_az2.id
  route_table_id      = aws_route_table.private_route_table_az2.id
}
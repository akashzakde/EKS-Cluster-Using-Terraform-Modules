# VPC Id of VPC created
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Subnet Id Of Public Subnet AZ 1 
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

# Subnet Id Of Public Subnet AZ 2
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# Subnet Id Of Private App Subnet AZ 1
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}

# Subnet Id Of Private App Subnet AZ 2
output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}

# Subnet Id Of Private Data Subnet AZ 1
output "private_data_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}

# Subnet Id Of Private Data Subnet AZ 2
output "private_data_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}

# Internet Gateway
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}


output "nat_gw1" {
  value = aws_nat_gateway.nat_gw1
}

output "nat_gw2" {
  value = aws_nat_gateway.nat_gw2
}
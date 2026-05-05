#vpc and cidr blaock
resource "aws_vpc" "vpc" {
  cidr_block = "11.0.0.0/16"

  tags = {
    Name = "ecs-vpc"
  }
}

# Subnet 1
resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "11.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Subnet1"
  }
}

# Subnet 2
resource "aws_subnet" "subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "11.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Subnet2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Route Table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

# Subnet-1 Association
resource "aws_route_table_association" "RTA1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.RT.id
}

# Subnet-2 Association
resource "aws_route_table_association" "RTA2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.RT.id
}

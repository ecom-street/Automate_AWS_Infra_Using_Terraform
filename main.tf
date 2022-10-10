 provider "aws" {
  region = "us-east-1"
  access_key ="#######################"
  secret_key = "##################################"
}

variable "subnet_prefix" {
  description = "cidr block for the subnet"
  
}
#1 Create a VPC
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
    }
}
#2 create a internet Gateway
resource "aws_internet_gateway" "jsangw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "ProdIGW"
  }
}
#3 create a route table
resource "aws_route_table" "Prod-RT" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jsangw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.jsangw.id
  }

  tags = {
    Name = "Prod"
  }
}
#4 create a subnet
resource "aws_subnet" "Subnet1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = var.subnet_prefix[0].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = var.subnet_prefix[0].name
  }
}

resource "aws_subnet" "Subnet2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = var.subnet_prefix[1].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = var.subnet_prefix[1].name
  }
}
#5 associate route table with subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Subnet1.id
  route_table_id = aws_route_table.Prod-RT.id
}
#6 create a  sercurity group
resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web_SG"
  }
}
#7 create network interface with an IP that was created on step 4
resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.Subnet1.id
  private_ips     = ["10.0.200.50"]
  security_groups = [aws_security_group.allow_web.id]

}
#8 Assign an elastic IP to network interface created in step 7
resource "aws_eip" "antil1-eip" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.jsangw]
} 

output "server_public_ip" {
  value = aws_eip.antil1-eip.public_ip
  
}
#9 create a ubuntu server and install/enable apache2 
resource "aws_instance" "web-server" {
  ami               = "ami-08c40ec9ead489470"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "terraform-test"

  network_interface {
    network_interface_id = aws_network_interface.web-server-nic.id
    device_index         = 0
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo Hey Antil this your web server > /var/www/html/index.html'
              EOF
  tags = {
    Name = "Web-server"
  }
}

output "server_private_ip" {
    value = aws_instance.web-server.private_ip

}

output "server_id" {
    value = aws_instance.web-server.id

}

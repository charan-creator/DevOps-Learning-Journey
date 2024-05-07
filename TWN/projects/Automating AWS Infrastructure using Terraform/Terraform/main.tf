terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable avail_zone {}
variable env_prefix {}


# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}


# Create a VPC
resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

# subnet creation
resource "aws_subnet" "myapp-subnet-1" {
    vpc_id = aws_vpc.myapp-vpc.vpc_id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
         Name: "${var.env_prefix}-subnet-1"
    }
}

# route table creation

resource "aws_route_table" "myapp-route-table" {
vpc_id = aws_vpc.myapp-vpc.id

route {

}

}
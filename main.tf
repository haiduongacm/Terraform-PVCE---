provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc_endpoint" "ecr-api" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.ap-southeast-1.ecr.api"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.subnet_ids
  security_group_ids = var.security_group_ids
  tags = {
    Name = "ecr-api"
  }
}

resource "aws_vpc_endpoint" "ecr-dkr" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.ap-southeast-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.subnet_ids
  security_group_ids = var.security_group_ids
  tags = {
    Name = "ecr-dkr"
  }
}

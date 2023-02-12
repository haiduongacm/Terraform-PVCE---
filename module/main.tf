provider "aws" {
  region = "ap-southeast-1"
}

module "vpce" {
  source = "./vpce"
vpc_id = "vpc-008ff47fce4b220b6"
subnet_ids =["subnet-0818c62fce0c6e142"]
security_group_ids = ["sg-082585bbffaea34c0"]
}

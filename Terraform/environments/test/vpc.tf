module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "test-vpc"
  cidr = "10.1.0.0/16"

  azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets   = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
  database_subnets = ["10.1.7.0/24", "10.1.8.0/24", "10.1.9.0/24"]
  elasticache_subnets = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]


  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "test"
  }

  vpc_tags = {
    Name = "test-vpc"
  }

}

  
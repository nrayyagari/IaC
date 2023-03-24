terraform {
  required_version = ">= 1.2.0"
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    
    }
  }
  backend "s3" {
    bucket  = "palindrome-terraform-main-state"
    region  = "us-east-1"
    key     = "terraform/dev/terraform.tfstate"
    encrypt = true 
    profile = "default"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
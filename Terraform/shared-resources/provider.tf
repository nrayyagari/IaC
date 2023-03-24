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
    key     = "terraform/shared-resources/terraform.tfstate"
    encrypt = true 
    dynamodb_table  = "palindrome-terraform-state-lock"
    profile = "default"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
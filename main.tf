terraform {
  backend "s3" {
    bucket = "dev-dmac"  
    key    = "default-infrastructure"
    region = "eu-west-3"
  }  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-3"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "dev-dmac"

  versioning {
    enabled = true
  }
}
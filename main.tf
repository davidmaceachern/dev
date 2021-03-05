provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "dev-dmac"  
    key    = "default-infrastructure"
    region = "eu-west-3"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "dev-dmac"

  versioning {
    enabled = true
  }
}
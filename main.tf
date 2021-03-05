provider "aws" {
  version = "~> 3.0"
  region  = "eu-west-3"
    endpoints {
    sts = "https://sts.eu-west-3.amazonaws.com"
  }
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
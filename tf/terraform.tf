terraform {
  backend "s3" {
    bucket = "sm589-terraform"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    google = {
      source  = "hashicorp/google"
      version = "~>4.47.0"
    }
  }

  required_version = ">= 1.2.0"
}

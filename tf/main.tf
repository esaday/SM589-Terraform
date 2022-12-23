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
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "esad-selami"
  default_tags {
    tags = {
      CreatedBy = "terraform"
      Name      = "SM589-Project"
    }
  }
}

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

provider "google" {

  project = "sm589-project"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

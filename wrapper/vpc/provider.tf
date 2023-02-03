provider "aws" {
  region              = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket       = "app-test-terraform-state-bucket-test-0223"
    key          = "test-app/test/vpc/vpc.tfstate"
    region       = "ap-south-1"
    session_name = "terraform"
  }
}

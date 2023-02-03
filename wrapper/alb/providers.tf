provider "aws" {
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    bucket       = "app-test-terraform-state-bucket-test-0223"
    key          = "test-app/test/alb/alb.tfstate"
    region       = "ap-south-1"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket       = "app-test-terraform-state-bucket-test-0223"
    key          = "test-app/test/vpc/vpc.tfstate"
    region       = "ap-south-1"
    session_name = "terraform"
  }
}

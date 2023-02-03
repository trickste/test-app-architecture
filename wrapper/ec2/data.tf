data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
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

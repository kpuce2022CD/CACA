terraform { // terraform setting
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" { // was
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_instance" "app_server" { // define component (ec2) // resource type, resource name
  ami           = "ami-01746dccc8c1f786a"
  instance_type = "t2.micro"

  tags = {
    Name = "choihyemin-terraform-1"
  }
}

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

resource "aws_security_group" "instance" {
    name = "CLONET_REPOSITORY_SECURITY_GROUP"

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_instance" "app_server" { // define component (ec2) // resource type, resource name
  ami           = "ami-08ef25ce7a9264eb4"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags = {
    Name = "choihyemin-0119-1512"
  }
   
}

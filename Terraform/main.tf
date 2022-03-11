terraform { // terraform setting
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  access_key = ""
  secret_key = ""
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_security_group" "instance" { // security group

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


    ingress {
      from_port = 4000
      to_port = 4000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port = 0
      to_port = 0
	protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }


    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_instance" "app_server" { // define component (ec2) // resource type, resource name

  ami           = "ami-014aafc4857e5952f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags = {
    Name = "CLONET_SERVER"
  }
   
}

resource "aws_eip" "elasticip" { // fixed ip
  instance = aws_instance.app_server.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}

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

    name = "CLONET_SECURITY_GROUP"

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

    ingress {
      from_port = 5312
      to_port = 5312
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }




    ingress {
      from_port = 1111
      to_port = 1111
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8001
      to_port = 8001
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8081
      to_port = 8081
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8005
      to_port = 8005
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8085
      to_port = 8085
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8006
      to_port = 8006
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8086
      to_port = 8086
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8007
      to_port = 8007
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8087
      to_port = 8087
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 9090
      to_port = 9090
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 3000
      to_port = 3000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 9093
      to_port = 9093
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 2181
      to_port = 2181
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 9092
      to_port = 9092
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 2222
      to_port = 2222
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 3333
      to_port = 3333
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 4444
      to_port = 4444
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
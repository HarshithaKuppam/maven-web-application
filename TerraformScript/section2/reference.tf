provider "aws"{

region = "ap-south-1"
access_key = ""
secret_key = ""
}

resource "aws_instance" "AWSEC2Instance" {

    ami = "ami-0f9d9a251c1a44858"
    instance_type = "t2.micro"
    key_name = "terraform"
    tags = {
        Name = "Redhat server by Terraform"
    }
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.AWSEC2Instance.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "security-group-one"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    #cidr_blocks      = [aws_eip.lb.public_ip/32]
 
  }
}


provider "aws" {

  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

data "aws_ami" "app_ami"{

most_recent = true
owners = ["amazon"]  #it look for official ami from amazon...if u keep ["self"] then it will consider our own ami in our aws account

filter{

    name = "name"
    values = ["amzn2-ami-hvm*"]
}
}
resource "aws_instance" "my-ec2" {

    ami = "data.aws_ami.app_ami.id"
    instance_type = "t2.micro"
    
    }

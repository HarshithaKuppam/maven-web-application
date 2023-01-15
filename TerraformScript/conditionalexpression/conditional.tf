provider "aws" {

  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "dev" {

    ami = "ami-0f9d9a251c1a44858"
    instance_type = "t2.micro"
    count = var.is_test == true ? 1 : 0
    #count = var.is_test == true ? 3 : 0   # it launches 3 instances if variable is_test value is true bcz count value becomes 3 and it iterates resorce block for 3 times
}

resource "aws_instance" "prod" {

    ami = "ami-0f9d9a251c1a44858"
    instance_type = "t2.medium"
    count = var.is_test == false ? 1 : 0
}

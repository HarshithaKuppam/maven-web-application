provider "aws"{

region = "eu-west-1"
access_key = ""
secret_key = ""
}

resource "aws_instance" "AWSEC2Instance" {

    ami = "ami-01dfb24743affc0fc"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-1"]
    key_name = "terraform"
    tags = {
        Name = "Redhat server by Terraform"
    }
}

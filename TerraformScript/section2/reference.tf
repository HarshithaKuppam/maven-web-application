provider "aws"{

region = "eu-west-1"
access_key = "AKIAVDDZZW5ROFKZNOI4"
secret_key = "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"
}

resource "aws_instance" "AWSEC2Instance" {

    ami = "ami-01dfb24743affc0fc"
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



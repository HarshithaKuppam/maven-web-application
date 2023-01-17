provider "aws" {

  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "my-ec2" {

    ami = "ami-0cca134ec43cf708f"
    instance_type = "t2.micro"
    key_name = "key-pair name wch isused to launch instance"

    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./<pem file path>")    #make sure this pem file is present in current dir where 
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx",
    ]
  }

}

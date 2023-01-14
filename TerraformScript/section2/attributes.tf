provider "aws" {

  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}


resource "aws_eip" "lb" {
  vpc      = true
}


output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "harshi-attribute-demo-001"
}


output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name

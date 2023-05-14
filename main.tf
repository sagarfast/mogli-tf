provider "aws" {
  
}

resource "aws_s3_bucket" "my-first-buck" {
  bucket = "test-codec-b-3"

  tags = {
    Name        = "codec-b-3"
    Environment = "Devops-batch"
  }
}
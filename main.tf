provider "aws" {
  
}

resource "aws_iam_user" "demo_tf_user" {
  name = "aws_demo_user"

  tags = {
    tag-key = "dev"
  }
}
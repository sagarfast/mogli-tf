provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-insta" {
  ami           = "ami-08333bccc35d71140"
  instance_type = "t2.micro"
  subnet_id = "anytrue"
  associate_public_ip_address = true
  key_name = "ohio-new"
  security_groups = ["defaults"]

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 10
    volume_type = "gp2"
  }

  tags = {
    Name = "tf-demo-instance"
  }
}
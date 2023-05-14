provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-insta" {
  ami           = "ami-08333bccc35d71140"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "sagar.pem"
  security_groups = ["sg-00c07de1ba6fa6eaf"]
  subnet_id = "subnet-00f8785a30c977f96"

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 10
    volume_type = "gp2"
  }

  tags = {
    Name = "tf-demo-instance"
  }
}
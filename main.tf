provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-insta" {
  ami           = "ami-08333bccc35d71140"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "sagar"
  security_groups = ["sg-00c07de1ba6fa6eaf"]
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id = "subnet-00f8785a30c977f96"
    
    user_data =  file("${path.module}/script.sh")
    
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }

  tags = {
    Name = "tf-demo-instance"
  }
}


resource "aws_security_group" "this" {
  name        = "demo-sg"
  vpc_id      = "vpc-088a111ca5a26a107" 

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    Name = "my-demo-tf-sg"
  }
}   
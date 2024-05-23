provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "vm-resources" {
  count                  = 2
  ami                    = "ami-0d77c9d87c7e619f9"
  instance_type          = "t2.micro"
  key_name               = "devops"
  vpc_security_group_ids = ["sg-07e7b348c3fee391e"]
  tags = {
    Name = "WebServer-${count.index + 1}"
  }
}

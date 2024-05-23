provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "vm-resources" {
  ami                    = "ami-0d77c9d87c7e619f9"
  instance_type          = "t2.micro"
  key_name               = "devops"
  vpc_security_group_ids = [ "${aws_security_group.security_group_webserver.id}" ]
  tags = {
    Name = "WebServer"
  }
}

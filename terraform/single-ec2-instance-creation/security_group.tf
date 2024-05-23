resource "aws_security_group" "security_group_webserver" {
  name = "webserver-sg"
  description = "httpd service allows ports"

#inbound rules for ssh
  ingress {
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }


#inbound rules for HTTP
  ingress {
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

#outbound rules for webserver
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

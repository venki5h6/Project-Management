resource "aws_instance" "web_instance" {
  ami                    = "ami-0aa8fc2422063977a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.security_group_webserver.id}"]
  key_name  = aws_key_pair.my_key.key_name 
  tags = {
    Name = "Webserver-Machines"
  }

 connection {
   type = "ssh"  
   host = self.public_ip
   user = "ec2-user"
   private_key = file("~/.ssh/id_rsa")

 }

 provisioner "file" {
  source = "index.html"
  destination = "/home/ec2-user/index.html"
 }

 provisioner "local-exec" {
   command = "echo ${aws_instance.web_instance.public_ip } >> public_ip.txt"
 }


 provisioner "remote-exec" {
   inline = [
     "sudo yum install httpd -y",
     "sudo cp -rf /home/ec2-user/index.html /var/www/html/index.html",
     "sudo systemctl start httpd",
     "sudo systemctl enable httpd",
    ]     
  }

}
 

resource "aws_key_pair" "my_key" {
   key_name = "web-key"
   public_key = file("~/.ssh/id_rsa.pub")
} 


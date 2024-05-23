resource "aws_instance" "vm-resources" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  key_name = "devops"
  vpc_security_group_ids = ["sg-07e7b348c3fee391e"]
  tags = {
    Name = var.Name_value
  }
}

module "ec2-instance" {
  source = "/mnt/modules/ec2-instance"
  ami_value = "ami-0d77c9d87c7e619f9"
  instance_type_value = "t2.micro"
  region_value ="us-east-2"
  Name_value = "WebServer-prod"
}

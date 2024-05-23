resource "aws_eip" "elastic-ip" {
   instance = "${aws_instance.vm-resources.id}"
}


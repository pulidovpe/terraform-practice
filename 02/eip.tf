resource "aws_eip" "instance_eip" {
  instance = "${aws_instance.instacia_web.id}"
  
}

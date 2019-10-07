provider "aws" {
  region = "${var.myregion}"
}

resource "aws_instance" "instacia_web" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.keypair.key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.allow_ssh_anywhere.id}",
    "${aws_security_group.allow_http_anywhere.id}"
  ]
  user_data = "${ file("./scripts/instalar-docker.sh") }"
  tags = {
    Name = "practica3"
    Environment = "Develop"
  }
}
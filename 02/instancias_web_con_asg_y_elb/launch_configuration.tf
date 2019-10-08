provider "aws" {
  region = "${var.myregion}"
}

resource "aws_launch_configuration" "web" {
  name_prefix   = "${var.project_name}- lc_"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.keypair.key_name}"
  security_groups = [
    "${aws_security_group.allow_ssh_anywhere.id}",
    "${aws_security_group.allow_http_anywhere.id}"
  ]
  
  user_data = "${ file("./scripts/instalar-docker.sh") }"

  lifecycle {
    create_before_destroy = true
  }
}
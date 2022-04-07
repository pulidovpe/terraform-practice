resource "aws_launch_configuration" "web" {
  name_prefix   = "${var.TF_VAR_project_name}-lc_"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.TF_VAR_instance_type}"
  key_name      = "${var.TF_VAR_key_name}"
  
  security_groups = [
    "${aws_security_group.allow_ssh_anywhere.id}",
    "${aws_security_group.allow_http_anywhere.id}"
  ]
  
  user_data = "${ file("./files/instalar-docker.sh") }"

  lifecycle {
    create_before_destroy = true
  }
}
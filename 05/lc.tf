resource "aws_launch_configuration" "aventura_ecs" {
  name                 = "aventura_ecs"
  image_id             = "${data.aws_ami.ecs_optimized.id}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs_agent.name}"
  security_groups      = ["${aws_security_group.allow_all.id}"]
  user_data            = "${data.template_file.user_data.rendered}"

  instance_type = "t2.micro"
}
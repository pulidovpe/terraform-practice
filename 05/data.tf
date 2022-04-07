data "aws_ami" "ecs_optimized" {
  filter {
    name   = "name"
    values = ["amzn-ami-2017.09.l-amazon-ecs-optimized"]
  }
}

data "template_file" "user_data" {
  template = "${file("${module.path}"/user_data.yaml)}"

  vars {
    ecs_cluster = "aventura_ecs"
  }
}
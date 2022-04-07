# instance.tf

resource "aws_instance" "ec2_instance" {
  #ami = "${var.ami_id}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id     = var.private_subnet_id

  vpc_security_group_ids = [
    "${aws_security_group.SSH-PORT-SG.id}",
    "${var.security_group_alb_id}",
    "${var.security_group_pg_id}"
  ]

  user_data = "${ file("./scripts/instance_setup.sh") }"

  tags = {
    "Name" = "${var.ec2_instance_name}-${var.environment}"
    "env"  = "${var.environment}"
    "ETL"  = "${var.etl}"
  }
}
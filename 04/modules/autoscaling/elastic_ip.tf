# resource "aws_eip" "instance_eip" {
#   private_ip = "10.0.0.12"
#   subnet_id  = "${aws_subnet.tf_test_subnet.id}"
#   subnets    = "${data.aws_subnet_ids.selected.ids}"
# }
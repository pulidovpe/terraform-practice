resource "aws_key_pair" "ecs" {
   key_name   = "ecs-key-${var.TF_VAR_environment}"
   public_key = "${ file("./files/id_rsa.pub") }"
}

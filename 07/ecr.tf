resource "aws_ecr_repository" "erp_advance" {
   name = "${var.TF_VAR_repository_name}"
}

resource "aws_ecr_repository_policy" "erp_policy" {
   repository = "${aws_ecr_repository.erp_advance.name}"

   policy = <<EOF
   {
      "Version": "2012-10-17",
      "Statement": [
         {
            "Sid": "new policy",
            "Effect": "Allow",
            "Action": [ "ecr:*" ],
            "Resource": "*"
         }
      ]
   }
   EOF
}

output "registry_url" {
   value = "${aws_ecr_repository.erp_advance.repository_url}"
}
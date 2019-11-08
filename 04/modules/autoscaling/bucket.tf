/*resource "aws_s3_bucket" "tf-backend" {
   bucket   = var.TF_VAR_bucket_name
   acl      = var.TF_VAR_acl
   tags = {
      Name        = "${var.TF_VAR_project_name}-${var.TF_VAR_bucket_name}"
      Environment = var.TF_VAR_environment
   }

   server_side_encryption_configuration {
      rule {
         apply_server_side_encryption_by_default {
            kms_master_key_id = "${aws_kms_key.mykey.arn}"
            sse_algorithm     = "aws:kms"
         }
      }
   }
}*/
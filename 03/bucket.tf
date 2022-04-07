resource "aws_s3_bucket" "tf-backend" {
   bucket   = "${var.bucket_name}"
   acl      = "${var.acl}"
   tags     = "${var.project_name}-${var.environment}"

   server_side_encryption_configuration {
      rule {
         apply_server_side_encryption_by_default {
            kms_master_key_id = "${aws_kms_key.mykey.arn}"
            sse_algorithm     = "aws:kms"
         }
      }
   }
}
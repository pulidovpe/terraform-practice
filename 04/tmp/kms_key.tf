resource "aws_kms_key" "mykey" {
   description             = "Key state file"
   deletion_window_in_days = 10
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.env}-test-bucket"
  tags = {
    Name        = "My ${var.env} bucket"
    Environment = "${var.env}"
  }
}

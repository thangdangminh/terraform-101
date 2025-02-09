locals {
  html_path = "${path.module}/html"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.s3_bucket.arn,
          "${aws_s3_bucket.s3_bucket.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_object" "object_www" {
  depends_on   = [aws_s3_bucket.s3_bucket]
  for_each     = fileset(local.html_path, "*.html")
  bucket       = var.bucket_name
  key          = basename(each.value)
  source       = "${local.html_path}/${each.value}"
  etag         = filemd5("${local.html_path}/${each.value}")
  content_type = "text/html"
  acl          = "public-read"
}

# Optional
resource "aws_s3_object" "object_assets" {
  depends_on = [aws_s3_bucket.s3_bucket]
  for_each   = fileset(local.html_path, "assets/*")
  bucket     = var.bucket_name
  key        = each.value
  source     = "${local.html_path}/${each.value}"
  etag       = filemd5("${local.html_path}/${each.value}")
  acl        = "public-read"
}

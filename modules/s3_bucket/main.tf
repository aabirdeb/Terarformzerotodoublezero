resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3owner" {
  bucket = aws_s3_bucket.s3bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.s3owner]

  bucket = aws_s3_bucket.s3bucket.id
  acl    = "private"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
}


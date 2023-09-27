resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name = var.bucket_name
    },
    var.tags
  )
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

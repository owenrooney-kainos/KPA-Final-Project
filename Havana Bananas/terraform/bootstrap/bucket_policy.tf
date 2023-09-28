resource "aws_s3_bucket_versioning" "havana_banana_bucket_versions" {
  bucket = aws_s3_bucket.havana_banana_remote_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.havana_banana_remote_state.id

  rule {
    apply_server_side_encryption_by_default {
      
      sse_algorithm     = "AES256"
    }
  }
}
resource "aws_s3_bucket_public_access_block" "bucket_public_block" {
  bucket = aws_s3_bucket.havana_banana_remote_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "bucket_json_policy" {
  bucket = aws_s3_bucket.havana_banana_remote_state.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowAccountUsersAccess",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:root"
        },
        Action = ["s3:GetObject", "s3:PutObject"],
        Resource = [
          "${aws_s3_bucket.havana_banana_remote_state.arn}/*"
        ]
      }
    ]
  })
}


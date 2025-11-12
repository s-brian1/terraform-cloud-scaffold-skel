resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
}

output "bucket_id" {
  value = aws_s3_bucket.this.id
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}
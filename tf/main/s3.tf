resource "aws_s3_bucket" "extra_bucket" {
  bucket = "sm589-mutation-test-bucket"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.extra_bucket.id
  acl    = "private"
}
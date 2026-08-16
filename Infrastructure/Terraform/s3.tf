resource "aws_s3_bucket" "s3_bucket" {
  bucket = "cryptolake"

  tags = {
    Environment = "Dev"
  }
}
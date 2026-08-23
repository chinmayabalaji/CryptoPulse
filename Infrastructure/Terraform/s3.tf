resource "aws_s3_bucket" "s3_bucket" {
  bucket = "dev-cryptolake"

  tags = {
    Environment = "Dev"
  }
}
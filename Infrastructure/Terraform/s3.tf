resource "aws_s3_bucket" "s3_bucket" {
  bucket = "cryptopulse"

  tags = {
    Environment = "Dev"
  }
}
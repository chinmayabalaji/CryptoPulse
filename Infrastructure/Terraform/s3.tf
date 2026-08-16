resource "aws_s3_bucket" "s3_bucket" {
  bucket = "CryptoPulse"

  tags = {
    Environment = "Dev"
  }
}
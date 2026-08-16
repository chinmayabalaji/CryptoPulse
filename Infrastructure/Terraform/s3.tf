resource "aws_s3_bicket" "s3_bucket" {
  bucket = "CryptoPulse"

  tags = {
    Environment = "Dev"
  }
}
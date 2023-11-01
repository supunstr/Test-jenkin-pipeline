provider "aws" {

}
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketsupun101"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

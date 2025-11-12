terraform {
  backend "s3" {
    bucket         = "your-dev-bucket-name"
    key            = "terraform/state/dev.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
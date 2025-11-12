terraform {
  backend "s3" {
    bucket         = "your-prod-bucket-name"
    key            = "terraform/prod/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-table"
  }
}
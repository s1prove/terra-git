terraform {
  backend "s3" {
    bucket = "terra-s3-backend"
    key = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
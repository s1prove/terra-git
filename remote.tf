data "terraform_remote_state" "eip"{
    backend = "s3"

    config = {
      bucket = "terra-s3-backend"
      key = "network/terraform.tfstate"
      region = "us-east-1"
    }
}
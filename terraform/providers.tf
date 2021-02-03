provider "aws" {
  region = var.region
  version = "3.25.0"
  assume_role {
    role_arn = var.source_provider_assume_role_arn
  }
}

terraform {
  backend "s3" {
    bucket = "mavencollective-net-tf"
    key    = "recipes-app/dynamodb"
    region = "us-east-1"
  }
}

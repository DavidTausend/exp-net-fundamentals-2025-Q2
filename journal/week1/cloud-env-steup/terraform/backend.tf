terraform {
  backend "s3" {
    bucket         = "network-bootcamp-tfstate-david-tausend"
    key            = "vpc/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
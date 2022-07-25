terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "terraform-tfstate-testdevops"
        encrypt = "true"
        key = "terraform.tfstate"
    }
}
terraform {
    backend "s3" {
      encrypt        = true
      region         = "us-east-1"
      key            = "rad01_es/terraform.tfstate"
      bucket         = "terraform-states-057737248023"
      dynamodb_table = "terraform-locks-057737248023"
    }
}


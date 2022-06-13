terraform {
  required_version = ">= 1.2.2"
}

provider "aws" {
      #access_key = "${var.aws_access_key}"
    #secret_key = "${var.aws_secret_key}"
    
  region = "us-east-2"

  # Allow any 2.x version of the AWS provider
  # version = "~> 2.0"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "great-name-terraform-state-2222"
  # Enable versioning so we can see the full revision history of our
  # state files
  #versioning {
    #enabled = true
  #}
  #server_side_encryption_configuration {
    #rule {
      #apply_server_side_encryption_by_default {
       # sse_algorithm = "AES256"
      #}
    #}
  #}
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "great-name-locks-2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
    }
}

resource "aws_s3_bucket" "terraform_state" {
   bucket = "Terraform-Jenkins-Ansible-S3"
   acl = "private"
   lifecycle {
      create_
   versioning {
      enabled = true
   }
   tags = {
     Name = "Bucket1"
     Environment = "Test"
   }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
terraform {
  backend "s3" {
    encrypt = true    
    bucket = "Terraform-Jenkins-Ansible-S3"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}


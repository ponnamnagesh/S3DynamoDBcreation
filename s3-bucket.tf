resource "aws_s3_bucket" "onebucket" {
   bucket = "Terraform-Jenkins-Ansible-S3"
   acl = "private"
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
    bucket = "hella-buckets"
    dynamodb_table = "Terraform-Jenkins-Ansible-S3"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}


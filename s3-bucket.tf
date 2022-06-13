#resource "aws_s3_bucket" "terraform_state" {
 #  bucket = "terraform-jenkins-ansible-s3"
  # acl = "private"
   #tags = {
    # Name = "Bucket1"
     #Environment = "Test"
   #}
#}

# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  #name = "terraform-state-lock-dynamo"
  #hash_key = "LockID"
  #read_capacity = 20
  #write_capacity = 20
 
  #attribute {
   # name = "LockID"
   # type = "S"
  #}
#}

      #terraform {
  #backend "s3" {
    #encrypt = true    
    #bucket = "Terraform-Jenkins-Ansible-S3"
    #dynamodb_table = "terraform-state-lock-dynamo"
    #key    = "terraform.tfstate"
    #region = "us-east-2"
  #}
#}

#terraform {
 # backend "s3" {
  #  # Replace this with your bucket name!
   # bucket         = "great-name-terraform-state-2"
    #key            = "global/s3/terraform.tfstate"
    #region         = "us-east-2"
    # Replace this with your DynamoDB table name!
    #dynamodb_table = "great-name-locks-2"
    #encrypt        = true
  #}
#}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "great-name-terraform-state-2222"
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
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


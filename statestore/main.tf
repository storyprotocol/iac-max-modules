locals {
  bucket_name         = "${var.project}-${var.env}-tfstate-${var.region}"
  dynamodb_table_name = "${var.project}-${var.env}-tflock-${var.region}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "table" {
  name           = local.dynamodb_table_name
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

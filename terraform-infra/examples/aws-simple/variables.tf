variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of EC2 instances to launch"
  type        = number
  default     = 1
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
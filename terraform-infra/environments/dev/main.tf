resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.environment}-vpc"
  }
}

module "compute" {
  source = "../../modules/aws/compute"
  instance_count = var.instance_count
  instance_type = var.instance_type
  vpc_id = aws_vpc.main.id
}

module "storage" {
  source = "../../modules/aws/storage"
  bucket_name = var.bucket_name
  acl = var.bucket_acl
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "instance_ids" {
  value = module.compute.instance_ids
}

output "bucket_name" {
  value = module.storage.bucket_name
}
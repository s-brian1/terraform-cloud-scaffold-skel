provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/aws/vpc"
  cidr_block = var.vpc_cidr
}

module "compute" {
  source = "./modules/aws/compute"
  instance_type = var.instance_type
  ami = var.ami_id
  vpc_id = module.vpc.vpc_id
}

module "storage" {
  source = "./modules/aws/storage"
  bucket_name = var.bucket_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "bucket_name" {
  value = module.storage.bucket_name
}
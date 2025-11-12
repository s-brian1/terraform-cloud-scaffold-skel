resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = var.tags
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr_block" {
  value = aws_vpc.this.cidr_block
}

output "vpc_dns_support" {
  value = aws_vpc.this.enable_dns_support
}

output "vpc_dns_hostnames" {
  value = aws_vpc.this.enable_dns_hostnames
}
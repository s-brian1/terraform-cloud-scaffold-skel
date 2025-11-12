variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "region" {
  description = "The region where the VPC will be created"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "enable_flow_logs" {
  description = "Enable flow logs for the VPC"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
  default     = {}
}
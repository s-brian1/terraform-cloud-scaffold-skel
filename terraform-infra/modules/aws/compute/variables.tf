variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instances in"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instances"
  type        = list(string)
}
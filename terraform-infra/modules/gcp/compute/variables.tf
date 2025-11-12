variable "instance_name" {
  description = "The name of the GCP Compute Engine instance"
  type        = string
}

variable "machine_type" {
  description = "The type of machine to create"
  type        = string
  default     = "n1-standard-1"
}

variable "zone" {
  description = "The zone to deploy the instance in"
  type        = string
}

variable "image_family" {
  description = "The image family to use for the instance"
  type        = string
  default     = "debian-10"
}

variable "image_project" {
  description = "The project that the image belongs to"
  type        = string
  default     = "debian-cloud"
}

variable "network" {
  description = "The name of the network to attach the instance to"
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach the instance to"
  type        = string
}
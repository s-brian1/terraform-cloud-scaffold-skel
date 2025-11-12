variable "storage_account_name" {
  description = "The name of the Azure Storage Account."
  type        = string
}

variable "location" {
  description = "The Azure region where the Storage Account will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Storage Account will be created."
  type        = string
}

variable "sku" {
  description = "The SKU of the Storage Account."
  type        = string
  default     = "Standard_LRS"
}

variable "kind" {
  description = "The kind of the Storage Account."
  type        = string
  default     = "StorageV2"
}
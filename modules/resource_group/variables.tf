variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group"
  type        = string
}

variable "tags" {
  description = "Specify Tags for the resource group"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}


variable "tags" {
  description = "Specify Tags for the resource group"
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "Specify Virtual Network Name"
  type        = string
}

variable "subnets" {
  description = "For each subnet, create an object that contain fields"
  default     = {}
}

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

variable "vnet_name" {
  description = "Specify Virtual Network Name"
  type        = string
}
variable "vnet_address_space" {
  description = "Specify Virtual Network Address Spaces. This can be more than one. "
  type        = list(string)
  default     = []
}

variable "dns_servers" {
  description = "Specify Virtual Network DNS servers. This can be more than one. "
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "For each subnet, create an object that contain fields"
  default     = {}
}


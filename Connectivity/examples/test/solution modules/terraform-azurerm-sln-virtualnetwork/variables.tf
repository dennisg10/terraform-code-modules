
variable "customer_prefix" {
  type    = string
  default = "cnts"
}
variable "environment_prefix" {
  type    = string
  default = "plc"
}
variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group"
  type        = string
  default     = "westeurope"
}

variable "network_id" {
  description = "Specify the network ID for the Azure Landing Zone. Defaults to '10.4.'"
  type        = string
  default     = "10.4"
}

variable "subnet_mask" {
  description = "Specify Subnet mask to use for VNET"
  default     = "/21"
}


variable "vnet_name" {
  description = "Specify Virtual Network Name"
  type        = string
}
variable "vnet_address_space" {
  description = "Specify Virtual Network Address Spaces. This can be more than one. "
  type        = list(string)
  default     = ["10.4.0.0/16"]
}
variable "dns_servers" {
  description = "Specify Virtual Network DNS servers. This can be more than one. "
  type        = list(string)
  default     = []
}

variable "tags" {
default = {}
}

variable "subnets" {
  default = {}
}

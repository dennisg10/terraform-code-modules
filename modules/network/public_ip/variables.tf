variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group"
  type        = string
}

variable "name" {
  description = " Specifies the name of the Public IP. Changing this forces a new Public IP to be created."
  type        = string
}

variable "public_ip_prefix_id" {
  description = "(Optional) If specified then public IP address allocated will be provided from the public IP prefix resource."
  default     = null
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
}

variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
}

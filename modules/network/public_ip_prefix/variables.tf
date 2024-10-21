variable "name" {
  description = "(Required) Specifies the name of the Firewall."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the resource."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "sku" {
  description = "(Optional) The SKU of the Public IP Prefix. Defaults to Standard"
  default     = "Standard"
  type        = string
}

variable "prefix_length" {
  description = " Specifies the number of bits of the prefix. The value can be set between 0 (4,294,967,296 addresses) and 31 (2 addresses). Defaults to 28(16 addresses)."
  type        = number
  default     = 28
}

variable "zones" {
  description = "(Optional) Specifies a list of Availability Zones in which this Public IP Prefix should be located. Allowed values are ['1','2','3']"
  type        = list(number)
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}


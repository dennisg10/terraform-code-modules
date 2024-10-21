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

variable "sku_name" {
  description = "(Required) SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet, Defaults to 'AZFW_VNet'. For Azure Virtual HUB select 'AZFW_Hub'."
  default     = "AZFW_VNet"
  type        = string
}

variable "sku_tier" {
  description = "(Required) SKU tier of the Firewall. Possible values are Premium, Standard and Basic. Defaults to Standard"
  default     = "Standard"
  type        = string
}
variable "firewall_policy_id" {
  description = "(Optional) The ID of the Firewall Policy applied to this Firewall."
  default     = null
  type        = string
}

variable "private_ip_ranges" {
  description = "(Optional) A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918."
  default     = null
  type        = list(string)
}

variable "ip_configuration" {
  description = "List of IP configurations."
  type = list(object({
    name                 = string
    subnet_id            = optional(string)
    public_ip_address_id = optional(string)
  }))
}


variable "management_ip_configuration" {
  description = "List of Management IP configurations."
  type = list(object({
    name                 = string
    subnet_id            = optional(string)
    public_ip_address_id = optional(string)
  }))
  default = []
}
variable "dns_servers" {
  description = "(Optional) A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution."
  type        = list(string)
  default     = []
}

/*
variable "dns_proxy_enabled" {
  description = "(Optional) Whether DNS proxy is enabled. It will forward DNS requests to the DNS servers when set to true. Defaults to 'false'. will be set to true if dns_servers provided with a not empty list."
  type        = bool
  default     = false
}
*/
variable "threat_intel_mode" {
  description = "(Optional) The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert and Deny. Defaults to Alert"
  type        = string
  default     = "Alert"
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Azure Firewall should be located. Allowed values are ['1','2','3']"
  type        = list(number)
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

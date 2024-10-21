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
variable "private_ip_ranges" {
  description = "(Optional) A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918. Defaults to 'IANAPrivateRanges'"
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16", "100.64.0.0/10"]
  type        = list(string)
}

variable "threat_intelligence_mode" {
  description = "(Optional) The operation mode for Threat Intelligence. Possible values are Alert, Deny and Off. Defaults to Deny"
  default     = "Deny"
  type        = string
}

variable "dns" {
  description = "List of DNS configurations for the Azure Firewall Policy."
  type = list(object({
    proxy_enabled = bool
    servers       = optional(list(string), [])
  }))
  default = []
}

variable "base_policy_id" {
  description = "(Optional) The ID of the base Firewall Policy."
  default     = null
  type        = string
}
variable "sku" {
  description = "(Required) SKU tier of the Firewall. Possible values are Premium, Standard and Basic. Defaults to Standard"
  default     = "Standard"
  type        = string
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

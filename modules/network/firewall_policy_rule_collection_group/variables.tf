variable "name" {
  description = "The name which should be used for this Firewall Policy Rule Collection Group."
  type        = string
}

variable "firewall_policy_id" {
  description = "(Required) The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist."
  type        = string
}

variable "priority" {
  description = " (Required) The priority of the Firewall Policy Rule Collection Group. The range is 100-65000."
  type        = number
}

variable "network_rule_collections" {
  description = "List of network rule collections."
  type = list(object({
    name     = string
    priority = number
    action   = string
    rules = list(object({
      name                  = string
      description           = optional(string)
      protocols             = list(string)
      source_ip_groups      = optional(list(string))
      destination_ip_groups = optional(list(string))
      source_addresses      = optional(list(string))
      destination_addresses = optional(list(string))
      destination_ports     = list(string)
      destination_fqdns     = optional(list(string))
    }))
  }))
  default = []
}

variable "application_rule_collections" {
  description = "List of application rule collections."
  type = list(object({
    name     = string
    priority = number
    action   = string
    rules = list(object({
      name                   = string
      description            = optional(string)
      source_addresses       = optional(list(string))
      destination_addresses  = optional(list(string))
      destination_urls       = optional(list(string))
      destination_fqdns      = optional(list(string))
      destination_fqdn_tags = optional(list(string))
      terminate_tls          = optional(bool, false)
      web_categories         = optional(list(string))
      protocols = optional(list(object({
        type = string
        port = string
      })))
      http_headers = optional(list(object({
        name  = string
        value = string
      })))
    }))
  }))
  default = []
}

variable "nat_rule_collections" {
  description = "List of NAT rule collections."
  type = list(object({
    name     = string
    priority = number
    rules = list(object({
      name                = string
      description         = optional(string)
      protocols           = optional(list(string))
      source_addresses    = optional(list(string))
      source_ip_groups    = optional(list(string))
      destination_address = optional(string)
      destination_ports   = optional(list(string))
      translated_address  = optional(string)
      translated_fqdn     = optional(string)
      translated_port     = optional(string)
    }))
  }))
  default = []
}


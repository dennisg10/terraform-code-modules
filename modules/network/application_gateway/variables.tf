variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "firewall_policy_id" {
  type        = string
  description = "The ID of the Web Application Firewall Policy."
  default     = null

}

variable "sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2"
  type        = string
}

variable "sku_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
  type        = string
}

variable "sku_capacitiy" {
  description = "The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale_configuration is set."
  type        = number
}

variable "public_ip_configuration_name" {
  description = "The name of the Frontend IP Configuration"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of a Public IP Address which the Application Gateway should use. The allocation method for the Public IP Address depends on the sku of this Application Gateway. "
  type        = string
  default     = null
}

variable "private_ip_configuration_name" {
  description = "The name of the Frontend IP Configuration"
  type        = string
  default     = null
}


variable "private_ip_address" {
  description = " The Private IP Address to use for the Application Gateway."
  type        = string
  default     = null
}

variable "application_gateway_name" {
  description = "The name of the Application Gateway."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which the Application Gateway will be created."
  type        = string
}
variable "websites" {
  description = "List of websites configurations for the Application Gateway"
  type = list(object({
    name = string
    backend_pool = object({
      name    = string
      ip_list = list(string)
    })
    backend_http_settings = list(object({
      name                  = string
      protocol              = string
      probe_name            = optional(string)
      port                  = number
      request_timeout       = number
      cookie_based_affinity = string
      path                  = string
      host_name             = string
    }))
    listeners = list(object({
      name                      = string
      frontend_ip_configuration = string
      frontend_port             = string
      protocol                  = string
      host_name                 = string
      ssl_certificate_name      = string
      require_sni               = string
      firewall_policy_id        = string
    }))
    routing_rules = list(object({
      name                        = string
      rule_type                   = string
      priority                    = number
      listener_name               = string
      backend_address_pool_name   = string
      backend_http_settings       = string
      redirect_configuration_name = string
    }))
    redirect_configuration = list(object({
      name                 = string
      redirect_type        = string
      target_listener_name = string
      include_path         = bool
      include_query_string = bool

    }))
    probes = list(object({
      name                                      = string
      pick_host_name_from_backend_http_settings = string
      protocol                                  = string
      path                                      = string
      interval                                  = number
      timeout                                   = number
      unhealthy_threshold                       = number
      probe_matching_conditions = optional(list(object({
        status_code = list(string)
        body        = string
      })), [])
    }))
  }))
}

variable "trusted_root_certificates" {
  description = "List of trusted root certificates"
  type = list(object({
    name                = string
    data                = string
    key_vault_secret_id = string
  }))
  default = []
}

variable "ssl_certificates" {
  description = "List of ssl certificates"
  type = list(object({
    name                = string
    data                = string
    key_vault_secret_id = string
  }))
  default = []
}

variable "managed_identity" {
  description = "The identity of the Application Gateway to be used, if configured. Possible values are  'UserAssigned'. If value set to 'UserAssigned then the 'managed_identity_ids' variable must be configured with the IDs of the UserAssigned identites which is a list of strings.  "
  type        = string
  default     = null
}

variable "managed_identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Application gateway"
  type        = list(string)
  default     = null
}

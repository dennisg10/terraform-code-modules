
variable "location" {
  description = "The location where the WAF policy will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the WAF policy will be created"
  type        = string
}

variable "tags" {
  description = "Tags to associate with the WAF policy"
  type        = map(string)
}


variable "waf_policies" {
  description = "Map of WAF policies to create, keyed by name"
  type = map(object({
    name = string
    policy_settings = object({
      mode                             = string
      file_upload_limit_in_mb          = number
      request_body_check               = bool
      max_request_body_size_in_kb      = number
      request_body_inspect_limit_in_kb = number
    })
    managed_rule_set = object({
      type    = string
      version = string
    })
    rules = list(object({
      rule_group_name = string
      rule_id         = string
      rule_enabled    = bool
      rule_action     = string
    }))
    custom_rules = list(object({
      name      = string
      enabled   = bool
      priority  = number
      rule_type = string
      action    = string
      match_conditions = list(object({
        match_variables = list(object({
          variable_name = string
          selector      = string
        }))
        operator           = string
        negation_condition = bool
        transforms         = list(string)
        match_values       = list(string)
      }))
    }))
  }))
}

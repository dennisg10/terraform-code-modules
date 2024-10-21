resource "azurerm_web_application_firewall_policy" "waf_policy" {
  for_each            = var.waf_policies
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  policy_settings {
    mode                             = each.value.policy_settings.mode
    file_upload_limit_in_mb          = each.value.policy_settings.file_upload_limit_in_mb
    request_body_check               = each.value.policy_settings.request_body_check
    max_request_body_size_in_kb      = each.value.policy_settings.max_request_body_size_in_kb
    request_body_inspect_limit_in_kb = each.value.policy_settings.request_body_inspect_limit_in_kb
  }

  managed_rules {
    managed_rule_set {
      type    = each.value.managed_rule_set.type
      version = each.value.managed_rule_set.version

      dynamic "rule_group_override" {
        for_each = each.value.rules
        content {
          rule_group_name = rule_group_override.value.rule_group_name
          rule {
            id      = rule_group_override.value.rule_id
            enabled = rule_group_override.value.rule_enabled
            action  = rule_group_override.value.rule_action
          }
        }
      }
    }
  }

  dynamic "custom_rules" {
    for_each = each.value.custom_rules
    content {
      name      = custom_rules.value.name
      enabled   = custom_rules.value.enabled
      priority  = custom_rules.value.priority
      rule_type = custom_rules.value.rule_type
      action    = custom_rules.value.action

      dynamic "match_conditions" {
        for_each = custom_rules.value.match_conditions
        content {
          operator           = match_conditions.value.operator
          negation_condition = match_conditions.value.negation_condition
          transforms         = match_conditions.value.transforms

          dynamic "match_variables" {
            for_each = match_conditions.value.match_variables
            content {
              variable_name = match_variables.value.variable_name
              selector      = match_variables.value.selector
            }
          }

          match_values = match_conditions.value.match_values
        }
      }
    }
  }
}

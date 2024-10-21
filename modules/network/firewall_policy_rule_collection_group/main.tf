resource "azurerm_firewall_policy_rule_collection_group" "rule_collection" {
  name               = var.name
  firewall_policy_id = var.firewall_policy_id
  priority           = var.priority

  dynamic "network_rule_collection" {
    for_each = var.network_rule_collections
    content {
      name     = network_rule_collection.value.name
      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action

      dynamic "rule" {
        for_each = network_rule_collection.value.rules
        content {
          name                  = rule.value.name
          description           = lookup(rule.value, "description", null)
          protocols             = lookup(rule.value, "protocols", [])
          source_ip_groups      = lookup(rule.value, "source_ip_groups", [])
          destination_ip_groups = lookup(rule.value, "destination_ip_groups", [])
          source_addresses      = lookup(rule.value, "source_addresses", [])
          destination_addresses = lookup(rule.value, "destination_addresses", [])
          destination_ports     = lookup(rule.value, "destination_ports", [])
          destination_fqdns     = lookup(rule.value, "destination_fqdns", [])
        }
      }
    }
  }

  dynamic "application_rule_collection" {
    for_each = var.application_rule_collections
    content {
      name     = application_rule_collection.value.name
      priority = application_rule_collection.value.priority
      action   = application_rule_collection.value.action

      dynamic "rule" {
        for_each = application_rule_collection.value.rules
        content {
          name        = rule.value.name
          description = lookup(rule.value, "description", null)
          dynamic "protocols" {
            for_each = lookup(rule.value, "protocols", [])
            content {
              type = protocols.value.type
              port = protocols.value.port
            }
          }
          dynamic "http_headers" {
            for_each = lookup(rule.value, "http_headers", []) != null ? lookup(rule.value, "http_headers", []) : []
            content {
              name  = http_headers.value.name
              value = http_headers.value.value
            }
          }
          source_addresses      = lookup(rule.value, "source_addresses", [])
          destination_addresses = lookup(rule.value, "destination_addresses", [])
          destination_urls      = lookup(rule.value, "destination_urls", [])
          destination_fqdns     = lookup(rule.value, "destination_fqdns", [])
          destination_fqdn_tags = lookup(rule.value, "destination_fqdn_tags", [])
          terminate_tls         = lookup(rule.value, "terminate_tls", false)
          web_categories        = lookup(rule.value, "web_categories", [])
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = var.nat_rule_collections
    content {
      name     = nat_rule_collection.value.name
      priority = nat_rule_collection.value.priority
      action   = "Dnat"

      dynamic "rule" {
        for_each = nat_rule_collection.value.rules
        content {
          name                = rule.value.name
          description         = lookup(rule.value, "description", null)
          protocols           = rule.value.protocols
          source_addresses    = lookup(rule.value, "source_addresses", ["*"])
          source_ip_groups    = lookup(rule.value, "source_ip_groups", [])
          destination_address = lookup(rule.value, "destination_address", null)
          destination_ports   = lookup(rule.value, "destination_ports", [])
          translated_address  = lookup(rule.value, "translated_address", null)
          translated_fqdn     = lookup(rule.value, "translated_fqdn", null)
          translated_port     = rule.value.translated_port
        }
      }
    }
  }
}

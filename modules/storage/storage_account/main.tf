resource "azurerm_storage_account" "storage_account" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  name                = lower(replace(var.name, "-", ""))

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  min_tls_version          = var.min_tls_version

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [1] : []
    content {
      default_action             = lookup(var.network_rules, "default_action", "Allow")
      ip_rules                   = lookup(var.network_rules, "ip_rules", null)
      virtual_network_subnet_ids = lookup(var.network_rules, "virtual_network_subnet_ids", null)

    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

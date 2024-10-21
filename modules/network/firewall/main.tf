resource "azurerm_firewall" "firewall" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  firewall_policy_id  = var.firewall_policy_id


  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      name                 = ip_configuration.value.name
      subnet_id            = lookup(ip_configuration.value, "subnet_id", null)
      public_ip_address_id = lookup(ip_configuration.value, "public_ip_address_id", null)
    }
  }


  dynamic "management_ip_configuration" {
    for_each = length(var.management_ip_configuration) > 0 ? var.management_ip_configuration : []
    content {
      name                 = management_ip_configuration.value.name
      subnet_id            = lookup(management_ip_configuration.value, "subnet_id", null)
      public_ip_address_id = lookup(management_ip_configuration.value, "public_ip_address_id", null)
    }
  }


  dns_servers       = length(var.dns_servers) == 0 ? null : var.dns_servers
  dns_proxy_enabled = var.dns_servers != null ? length(var.dns_servers) > 0 : false
  private_ip_ranges = var.private_ip_ranges
  threat_intel_mode = var.threat_intel_mode
  zones             = var.zones
  tags              = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}

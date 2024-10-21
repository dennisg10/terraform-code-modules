resource "azurerm_firewall_policy" "firewall_policy" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  private_ip_ranges        = var.private_ip_ranges
  sku                      = var.sku
  threat_intelligence_mode = var.threat_intelligence_mode
  base_policy_id           = var.base_policy_id


  dynamic "dns" {
    for_each = length(var.dns) > 0 ? var.dns : []
    content {
      proxy_enabled = dns.value.proxy_enabled
      servers       = dns.value.servers
    }
  }
  lifecycle {
    ignore_changes = [tags]
  }
}

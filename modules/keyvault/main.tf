data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "keyvault" {
  name                          = var.keyvault_name
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.sku_name
  enabled_for_deployment        = var.enabled_for_deployment
  enabled_for_disk_encryption   = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization     = var.enable_rbac_authorization
  public_network_access_enabled = var.public_network_access_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [1] : []
    content {
      bypass                     = lookup(var.network_acls, "bypass", "AzureServices")
      default_action             = lookup(var.network_acls, "default_action", "Allow")
      ip_rules                   = lookup(var.network_acls, "ip_rules", null)
      virtual_network_subnet_ids = lookup(var.network_acls, "virtual_network_subnet_ids", null)

    }
  }

    lifecycle {
    ignore_changes = [
      tags
    ]
  }

}

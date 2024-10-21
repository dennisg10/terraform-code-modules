resource "azurerm_virtual_machine_extension" "domain_join" {
  name                       = "domain_join"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows_virtual_machine.id
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "Name": "${var.domain_to_join}",
        "OUPath": "${var.ou_path != null ? var.ou_path : ""}",
        "User": "${var.domain_user}",
        "Restart": "${var.restart_enabled}",
        "Options": "3"
    }
SETTINGS

  protected_settings_from_key_vault {
    secret_url      = var.secret_url
    source_vault_id = var.vault_id
  }
}
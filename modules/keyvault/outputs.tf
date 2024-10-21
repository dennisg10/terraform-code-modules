
output "name" {
  description = "The Name of the Key Vault."
  value = azurerm_key_vault.keyvault.name
}
output "id" {
  description = "The ID of the Key Vault."
  value = azurerm_key_vault.keyvault.id
}

output "kvault_uri" {
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
  value = azurerm_key_vault.keyvault.vault_uri
}
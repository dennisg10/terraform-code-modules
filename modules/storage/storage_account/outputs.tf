output "name" {
  description = "The name of the Storage Account "
  value = azurerm_storage_account.storage_account.name
}

output "id" {
  description = "The ID of the Storage Account."
  value = azurerm_storage_account.storage_account.id
}
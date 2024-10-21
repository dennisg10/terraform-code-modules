output "id" {
  value       = azurerm_public_ip.public_ip.id
  description = "The ID of the Azure Public IP resource."
}

output "ip_address" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "The IP address associated with the Azure Public IP resource."
}

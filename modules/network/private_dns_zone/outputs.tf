output "id" {
  value       = [for private_dns_zone in azurerm_private_dns_zone.private_dns_zone : private_dns_zone.id]
  description = "A list of IDs for the Azure Private DNS Zones."
}

output "pdz_obj" {
  value       = azurerm_private_dns_zone.private_dns_zone
  description = "The entire Azure Private DNS Zone object."
}

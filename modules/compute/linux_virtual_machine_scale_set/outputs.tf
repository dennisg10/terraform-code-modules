output "vm_obj" {
  description = "The entire object of the Azure Linux Virtual Machine Scale Set resource."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set
}

output "vm_id" {
  description = "The ID of the Azure Linux Virtual Machine Scale Set resource."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.id
}


output "vm_obj" {
  description = "The entire object of the Azure Windows Virtual Machine Scale Set resource."
  value       = azurerm_windows_virtual_machine_scale_set.windows_virtual_machine_scale_set
}

output "vm_id" {
  description = "The ID of the Azure Windows Virtual Machine Scale Set resource."
  value       = azurerm_windows_virtual_machine_scale_set.windows_virtual_machine_scale_set.id
}

output "id" {
  description = "The Log Analytics Linked Service ID."
  value = azurerm_log_analytics_linked_service.linked_service.id
}

output "name" {
  description = "The generated name of the Linked Service. The format for this attribute is always <workspace name>/<linked service type>(e.g. workspace1/Automation or workspace1/Cluster)"
  value = azurerm_log_analytics_linked_service.linked_service.name
}

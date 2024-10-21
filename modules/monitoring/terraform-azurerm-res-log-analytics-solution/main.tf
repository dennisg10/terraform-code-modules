

resource "azurerm_log_analytics_solution" "solution" {
  solution_name         = var.solution_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  workspace_resource_id = var.workspace_resource_id
  workspace_name        = var.workspace_name

  plan {
    publisher = var.publisher
    product   = var.product
  }

  tags = var.tags
}

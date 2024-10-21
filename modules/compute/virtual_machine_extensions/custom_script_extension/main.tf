resource "azurerm_virtual_machine_extension" "custom_script_extension" {
  name                 = "CustomScriptExtension"
  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings             = <<SETTINGS
  {
    "managedIdentity" : ${jsonencode(local.managedIdentity)},
    "fileUris" : ${jsonencode(var.fileUris)}

    
  }
SETTINGS


  protected_settings = <<SETTINGS
{


      "commandToExecute" : "${var.commandToExecute}"

}
SETTINGS


  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

locals {
  managedIdentity = var.managedIdentity != null ? { objectId = var.managedIdentity } : {}


}

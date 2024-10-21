## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_machine_extension.custom_script_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_commandToExecute"></a> [commandToExecute](#input\_commandToExecute) | Specify the command to run for Custom Script Extension deployment. | `string` | n/a | yes |
| <a name="input_fileUris"></a> [fileUris](#input\_fileUris) | Requires a list of strings which contain the URLs of the files stored in the storage account. Default value is a empty list '[]' . | `list(string)` | `[]` | no |
| <a name="input_managedIdentity"></a> [managedIdentity](#input\_managedIdentity) | The ID of the Managed Identity which has the correct permissions to retrieve files. Default value is 'null' which uses the managed identity configured on the VM. If multiple MI's are configured, the object ID of the MI to use for CSE needs to be specified. | `string` | n/a | yes |
| <a name="input_virtual_machine_id"></a> [virtual\_machine\_id](#input\_virtual\_machine\_id) | The ID of the Virtual Machine to configure the extension on. | `string` | n/a | yes |

## Outputs

No outputs.

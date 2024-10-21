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
| [azurerm_linux_virtual_machine.linux_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_admin_ssh_key"></a> [admin\_ssh\_key](#input\_admin\_ssh\_key) | The admin\_ssh\_key must contain the 'public key' argument, which needs to be atleast 2048-bit and in ssh-rsa format and the 'username' is automatically set as the same value as var.admin\_username | `map(string)` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_boot_diagnostics_enabled"></a> [boot\_diagnostics\_enabled](#input\_boot\_diagnostics\_enabled) | Enables Boot diagnostics. Pissble values are 'true' or 'false'. If set to true, the 'storage\_account\_uri' variable must be set with either 'null' value or the correct value | `any` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | Specify OS disk caching type. Allowed values are 'None', 'ReadOnly', 'ReadWrite' | `string` | n/a | yes |
| <a name="input_data_disk"></a> [data\_disk](#input\_data\_disk) | Data disk object | `map` | `{}` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | Specify the OS disk size. Default is set to 127 | `number` | `127` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | Should Accelerated Networking be enabled. Allowed values are bool 'true' or 'false'. Default is set to 'false' | `bool` | `false` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies that the image or disk that is being used was licensed on-premises. Allowed values are 'RHEL\_BYOS', 'RHEL\_BASE', 'RHEL\_EUS', 'RHEL\_SAPAPPS', 'RHEL\_SAPHA', 'RHEL\_BASESAPAPPS', 'RHEL\_BASESAPHA', 'SLES\_BYOS', 'SLES\_SAP', 'SLES\_HPC' | `string` | `null` | no |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Windows Virtual Machine. | `list(string)` | `null` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | The identity of the virtual machine, if configured. Possible values are 'SystemAssigned', 'UserAssigned', 'SystemAssigned, UserAssigned'. If value set to 'UserAssigned' or 'SystemAssigend, UserAssigned', then the 'managed\_identity\_ids' variable must be configured with the IDs of the UserAssigned identites which is a list of strings. | `string` | n/a | yes |
| <a name="input_marketplace_image"></a> [marketplace\_image](#input\_marketplace\_image) | When a marketplace image is deployed, the marketplace\_image variable must be set in a object which have the following arguments: 'name', 'product', 'publisher'. Default value for the marketplace\_image is set to 'null'. As this is not required. | `map(string)` | `null` | no |
| <a name="input_patch_mode"></a> [patch\_mode](#input\_patch\_mode) | Specifies the mode of VM Guest Patching to IaaS virtual machine or virtual machines associated to virtual machine scale set with OrchestrationMode as Flexible. Allowed values are 'ImageDefault', 'AutomaticByPlatform'. Default is set to 'ImageDefault' | `string` | `"ImageDefault"` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Specify the private IP address if IP address allocation is set to 'Static' | `string` | n/a | yes |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Specify the size of the virtual machine | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specify the location of the resource group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the resource group name | `string` | n/a | yes |
| <a name="input_secure_boot_enabled"></a> [secure\_boot\_enabled](#input\_secure\_boot\_enabled) | Specifies whether secure boot should be enabled on the virtual machine. Default value is 'false' | `bool` | `false` | no |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | Specify the source image reference used for the virtual machine, the following arguments must be set in the object: 'publisher', 'offer', 'sku', 'version' | `map(string)` | n/a | yes |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Specify OS disk type Allowed Vaules are 'Standard\_LRS', 'Premium\_LRS' etc. | `string` | `"Standard_LRS"` | no |
| <a name="input_storage_account_uri"></a> [storage\_account\_uri](#input\_storage\_account\_uri) | Boot Diagnostics is a debugging feature which allows you to view Console Output and Screenshot to diagnose VM status. 'Default value is 'null' which uses a managed storage account for the Uri | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specify the name of the virtual machine | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specify Tags for the resource group | `map(string)` | `{}` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Specify the name of the virtual machine | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Specify the size of the virtual machine | `string` | n/a | yes |
| <a name="input_vtpm_enabled"></a> [vtpm\_enabled](#input\_vtpm\_enabled) | Specifies whether vTPM should be enabled on the virtual machine. Default is set to 'false' | `bool` | `false` | no |
| <a name="input_write_accelerator_enabled"></a> [write\_accelerator\_enabled](#input\_write\_accelerator\_enabled) | Whether OS disk write accelerator is enabled or not. Defaults sets to true | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nic_obj"></a> [nic\_obj](#output\_nic\_obj) | The entire object of the Azure Network Interface resource. |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | The ID of the Azure Linux Virtual Machine resource. |
| <a name="output_vm_obj"></a> [vm\_obj](#output\_vm\_obj) | The entire object of the Azure Linux Virtual Machine resource. |

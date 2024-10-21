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
| [azurerm_network_security_group.network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nsgs"></a> [nsgs](#input\_nsgs) | For each nsgs, create an object that contain fields | `map` | `{}` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specify the location of the resource group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specify Tags for the resource group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | The resource IDs of the Network Security Groups (NSGs). |
| <a name="output_nsg_map"></a> [nsg\_map](#output\_nsg\_map) | A map of NSG names to their respective resource IDs. |
| <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name) | The names of the Network Security Groups (NSGs). |
| <a name="output_nsg_obj"></a> [nsg\_obj](#output\_nsg\_obj) | The entire Azure Network Security Group (NSG) objects. |

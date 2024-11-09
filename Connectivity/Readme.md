## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_security_groups"></a> [network\_security\_groups](#module\_network\_security\_groups) | ../modules/network/network_security_group | n/a |
| <a name="module_route_table"></a> [route\_table](#module\_route\_table) | ../modules/network/route_table | n/a |
| <a name="module_special_route_table"></a> [special\_route\_table](#module\_special\_route\_table) | ../modules/network/route_table | n/a |
| <a name="module_special_subnets"></a> [special\_subnets](#module\_special\_subnets) | ../modules/network/subnet | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ../modules/network/subnet | n/a |
| <a name="module_vnet01"></a> [vnet01](#module\_vnet01) | ../modules/network/virtual_network | n/a |
| <a name="module_vnet01_rg"></a> [vnet01\_rg](#module\_vnet01\_rg) | ../modules/resource_group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet_network_security_group_association.nsg_vnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.special_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specify default resource group location. Allowed values are : westeurope,northeurope | `string` | `"westeurope"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | For each subnet, create an object that contain fields | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br>  "Company": "GlasIT",<br>  "DeploymentMethod": "Terraform",<br>  "Environment": "Production",<br>  "Service": "Connectivity"<br>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Specify Virtual Network Address Spaces. This can be more than one. | `list(string)` | <pre>[<br>  "172.16.0.0/20"<br>]</pre> | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Specify Virtual Network Name | `string` | `"BOV-PLC-VNET01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | Name of the subnets |
| <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name) | Name of the subnets |
| <a name="output_nsg_obj"></a> [nsg\_obj](#output\_nsg\_obj) | Returns the complete set of NSG objects created in the virtual network |
| <a name="output_rt_id"></a> [rt\_id](#output\_rt\_id) | Name of the subnets |
| <a name="output_rt_name"></a> [rt\_name](#output\_rt\_name) | Name of the subnets |
| <a name="output_rt_obj"></a> [rt\_obj](#output\_rt\_obj) | Returns the complete set of NSG objects created in the virtual network |
| <a name="output_special_rt_obj"></a> [special\_rt\_obj](#output\_special\_rt\_obj) | Returns the complete set of NSG objects created in the virtual network |
| <a name="output_special_subnet_obj"></a> [special\_subnet\_obj](#output\_special\_subnet\_obj) | n/a |
| <a name="output_subnets_obj"></a> [subnets\_obj](#output\_subnets\_obj) | n/a |
| <a name="output_virtual_network_address_space"></a> [virtual\_network\_address\_space](#output\_virtual\_network\_address\_space) | List of address spaces that are used the virtual network. |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | The id of the virtual network |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | The name of the virtual network |

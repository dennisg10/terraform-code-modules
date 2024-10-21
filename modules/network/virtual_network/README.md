## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.94.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Specify Virtual Network DNS servers. This can be more than one. | `list(string)` | `[]` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specify the location of the resource group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the resource group name | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | For each subnet, create an object that contain fields | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specify Tags for the resource group | `map(string)` | `{}` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Specify Virtual Network Address Spaces. This can be more than one. | `list(string)` | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Specify Virtual Network Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_address_prefix"></a> [subnet\_address\_prefix](#output\_subnet\_address\_prefix) | The address prefixes of the subnets. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The resource IDs of the subnets. |
| <a name="output_subnet_ids_map"></a> [subnet\_ids\_map](#output\_subnet\_ids\_map) | The entire Azure subnet objects, including all attributes. |
| <a name="output_subnet_map"></a> [subnet\_map](#output\_subnet\_map) | A map of subnet names to their respective resource IDs. |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The names of the subnets. |
| <a name="output_virtual_network_address_space"></a> [virtual\_network\_address\_space](#output\_virtual\_network\_address\_space) | The address space of the virtual network (VNET). |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | The resource ID of the virtual network (VNET). |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | The name of the virtual network (VNET). |

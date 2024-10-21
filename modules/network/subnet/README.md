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
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the resource group name | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | For each subnet, create an object that contain fields | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specify Tags for the resource group | `map(string)` | `{}` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Specify Virtual Network Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_address_prefix"></a> [subnet\_address\_prefix](#output\_subnet\_address\_prefix) | The address prefixes of the subnets. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The resource IDs of the subnets. |
| <a name="output_subnet_ids_map"></a> [subnet\_ids\_map](#output\_subnet\_ids\_map) | A map of the subnet objects, including their IDs. |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The names of the subnets. |
| <a name="output_subnet_obj"></a> [subnet\_obj](#output\_subnet\_obj) | The entire Azure subnet objects. |

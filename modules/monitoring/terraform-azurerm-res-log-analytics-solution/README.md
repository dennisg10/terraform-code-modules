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
| [azurerm_log_analytics_solution.solution](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | (Required) The product name of the solution. For example OMSGallery/Containers | `string` | n/a | yes |
| <a name="input_promotion_code"></a> [promotion\_code](#input\_promotion\_code) | (Optional) A promotion code to be used with the solution. | `string` | `null` | no |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | (Required) The publisher of the solution. For example Microsoft. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which the Log Analytics solution is created. The solution and its related workspace can only exist in the same resource group. | `string` | n/a | yes |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | (Required) Specifies the name of the solution to be deployed | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | (Required) The full name of the Log Analytics workspace with which the solution will be linked. | `string` | n/a | yes |
| <a name="input_workspace_resource_id"></a> [workspace\_resource\_id](#input\_workspace\_resource\_id) | (Required) The full resource ID of the Log Analytics workspace with which the solution will be linked. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_primary_shared_key"></a> [primary\_shared\_key](#output\_primary\_shared\_key) | n/a |
| <a name="output_secondary_shared_key"></a> [secondary\_shared\_key](#output\_secondary\_shared\_key) | n/a |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |

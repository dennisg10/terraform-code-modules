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
| [azurerm_log_analytics_linked_service.linked_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_linked_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_read_access_id"></a> [read\_access\_id](#input\_read\_access\_id) | (Optional) The ID of the readable Resource that will be linked to the workspace. This should be used for linking to an Automation Account resource. | `any` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the resource group name. | `string` | n/a | yes |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | (Required) The ID of the Log Analytics Workspace that will contain the Log Analytics Linked Service resource. | `string` | n/a | yes |
| <a name="input_write_access_id"></a> [write\_access\_id](#input\_write\_access\_id) | (Optional) The ID of the writable Resource that will be linked to the workspace. This should be used for linking to a Log Analytics Cluster resource. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Log Analytics Linked Service ID. |
| <a name="output_name"></a> [name](#output\_name) | The generated name of the Linked Service. The format for this attribute is always <workspace name>/<linked service type>(e.g. workspace1/Automation or workspace1/Cluster) |

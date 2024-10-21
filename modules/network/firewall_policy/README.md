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
| [azurerm_firewall_policy.firewall_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_policy_id"></a> [base\_policy\_id](#input\_base\_policy\_id) | (Optional) The ID of the base Firewall Policy. | `string` | `null` | no |
| <a name="input_dns"></a> [dns](#input\_dns) | List of DNS configurations for the Azure Firewall Policy. | <pre>list(object({<br>    proxy_enabled = bool<br>    servers       = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Firewall. | `string` | n/a | yes |
| <a name="input_private_ip_ranges"></a> [private\_ip\_ranges](#input\_private\_ip\_ranges) | (Optional) A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918. Defaults to 'IANAPrivateRanges' | `list(string)` | <pre>[<br>  "10.0.0.0/8",<br>  "172.16.0.0/12",<br>  "192.168.0.0/16",<br>  "100.64.0.0/10"<br>]</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the resource. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | (Required) SKU tier of the Firewall. Possible values are Premium, Standard and Basic. Defaults to Standard | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_threat_intelligence_mode"></a> [threat\_intelligence\_mode](#input\_threat\_intelligence\_mode) | (Optional) The operation mode for Threat Intelligence. Possible values are Alert, Deny and Off. Defaults to Deny | `string` | `"Deny"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_child_policies"></a> [child\_policies](#output\_child\_policies) | A list of reference to child Firewall Policies of this Firewall Policy. |
| <a name="output_firewalls"></a> [firewalls](#output\_firewalls) | A list of references to Azure Firewalls that this Firewall Policy is associated with. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Firewall Policy. |
| <a name="output_rule_collection_groups"></a> [rule\_collection\_groups](#output\_rule\_collection\_groups) | A list of references to Firewall Policy Rule Collection Groups that belongs to this Firewall Policy. |

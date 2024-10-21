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
| [azurerm_firewall.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution. | `list(string)` | `[]` | no |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | (Optional) The ID of the Firewall Policy applied to this Firewall. | `string` | `null` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | List of IP configurations. | <pre>list(object({<br>    name                 = string<br>    subnet_id            = optional(string)<br>    public_ip_address_id = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_management_ip_configuration"></a> [management\_ip\_configuration](#input\_management\_ip\_configuration) | List of Management IP configurations. | <pre>list(object({<br>    name                 = string<br>    subnet_id            = optional(string)<br>    public_ip_address_id = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Firewall. | `string` | n/a | yes |
| <a name="input_private_ip_ranges"></a> [private\_ip\_ranges](#input\_private\_ip\_ranges) | (Optional) A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918. | `list(string)` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the resource. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) SKU name of the Firewall. Possible values are AZFW\_Hub and AZFW\_VNet, Defaults to 'AZFW\_VNet'. For Azure Virtual HUB select 'AZFW\_Hub'. | `string` | `"AZFW_VNet"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (Required) SKU tier of the Firewall. Possible values are Premium, Standard and Basic. Defaults to Standard | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_threat_intel_mode"></a> [threat\_intel\_mode](#input\_threat\_intel\_mode) | (Optional) The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert and Deny. Defaults to Alert | `string` | `"Alert"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Azure Firewall should be located. Allowed values are ['1','2','3'] | `list(number)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Azure Firewall |

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
| [azurerm_firewall_policy_rule_collection_group.rule_collection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_rule_collections"></a> [application\_rule\_collections](#input\_application\_rule\_collections) | List of application rule collections. | <pre>list(object({<br>    name     = string<br>    priority = number<br>    action   = string<br>    rules = list(object({<br>      name                   = string<br>      description            = optional(string)<br>      source_addresses       = optional(list(string))<br>      destination_addresses  = optional(list(string))<br>      destination_urls       = optional(list(string))<br>      destination_fqdns      = optional(list(string))<br>      destination_fqdn_tags = optional(list(string))<br>      terminate_tls          = optional(bool, false)<br>      web_categories         = optional(list(string))<br>      protocols = optional(list(object({<br>        type = string<br>        port = string<br>      })))<br>      http_headers = optional(list(object({<br>        name  = string<br>        value = string<br>      })))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | (Required) The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this Firewall Policy Rule Collection Group. | `string` | n/a | yes |
| <a name="input_nat_rule_collections"></a> [nat\_rule\_collections](#input\_nat\_rule\_collections) | List of NAT rule collections. | <pre>list(object({<br>    name     = string<br>    priority = number<br>    rules = list(object({<br>      name                = string<br>      description         = optional(string)<br>      protocols           = optional(list(string))<br>      source_addresses    = optional(list(string))<br>      source_ip_groups    = optional(list(string))<br>      destination_address = optional(string)<br>      destination_ports   = optional(list(string))<br>      translated_address  = optional(string)<br>      translated_fqdn     = optional(string)<br>      translated_port     = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_network_rule_collections"></a> [network\_rule\_collections](#input\_network\_rule\_collections) | List of network rule collections. | <pre>list(object({<br>    name     = string<br>    priority = number<br>    action   = string<br>    rules = list(object({<br>      name                  = string<br>      description           = optional(string)<br>      protocols             = list(string)<br>      source_ip_groups      = optional(list(string))<br>      destination_ip_groups = optional(list(string))<br>      source_addresses      = optional(list(string))<br>      destination_addresses = optional(list(string))<br>      destination_ports     = list(string)<br>      destination_fqdns     = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | (Required) The priority of the Firewall Policy Rule Collection Group. The range is 100-65000. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Firewall Policy Rule Collection Group. |

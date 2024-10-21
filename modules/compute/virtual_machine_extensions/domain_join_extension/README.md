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
| [azurerm_virtual_machine_extension.domain_join](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_to_join"></a> [domain\_to\_join](#input\_domain\_to\_join) | Specify which AD domain to join | `string` | `null` | no |
| <a name="input_domain_user"></a> [domain\_user](#input\_domain\_user) | Specify which user will be used to join to the AD domain | `string` | `""` | no |
| <a name="input_domain_user_password"></a> [domain\_user\_password](#input\_domain\_user\_password) | Specify the password for the domain\_user | `string` | `""` | no |
| <a name="input_ou_path"></a> [ou\_path](#input\_ou\_path) | Specify which OU path the machine must be added when joining to the AD domain | `string` | `""` | no |
| <a name="input_restart_enabled"></a> [restart\_enabled](#input\_restart\_enabled) | Specify whether automatic restart is enabled when completing AD domain join | `string` | `"false"` | no |
| <a name="input_secret_url"></a> [secret\_url](#input\_secret\_url) | The URL to the Key Vault Secret which stores the protected settings. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specify Tags for the resource group | `map(string)` | `{}` | no |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | The ID of the source Key Vault. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nic_obj"></a> [nic\_obj](#output\_nic\_obj) | The vNIC object |
| <a name="output_vm_obj"></a> [vm\_obj](#output\_vm\_obj) | The Virtual Machine object |

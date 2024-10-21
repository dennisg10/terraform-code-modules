##########################################
########### Key vault variables ###########
##########################################

variable "resource_group_name" {
  description = "Specify the resource group name."
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group."
  type        = string
}


variable "keyvault_name" {
  description = "Specify the name of the key vault."
  type        = string
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are 'standard' and 'premium'."
  type        = string
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
}
variable "enable_rbac_authorization" {
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
  type        = bool
}
variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault. Defaults to 'true'."
  type        = bool
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between '7' and '90' (the default) days"
  type        = number
}

variable "purge_protection_enabled" {
  description = "s Purge Protection enabled for this Key Vault"
  type        = bool
}

variable "network_acls" {
description = "The network acl settings for the key vault. Following arguments are supported. 'bypass' (required), 'default_action' (required), 'ip_rules', virtual_network_ids'"  
}
variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group"
  type        = string
}

variable "name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed."
  type        = string
}

variable "account_tier" {
  description = "Defines the access tier for 'BlobStorage', 'FileStorage' and 'StorageV2' accounts. Valid options are 'Hot' and 'Cool'"
  type        = string
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are 'LRS', 'GRS', 'RAGRS', 'ZRS', 'GZRS' and 'RAGZRS'."
  type        = string
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are 'BlobStorage', 'BlockBlobStorage', 'FileStorage', 'Storage' and 'StorageV2'."
  type        = string
}

variable "min_tls_version" {
  description = " The minimum supported TLS version for the storage account. Possible values are 'TLS1_0', 'TLS1_1', and TLS1_2. Defaults to 'TLS1_2'."
  type        = string
  default = "TLS1_2"
}

variable "network_rules" {
description = "The network acl settings for the key vault. Following arguments are supported. 'bypass' (required), 'default_action' (required), 'ip_rules', virtual_network_ids'"  
}
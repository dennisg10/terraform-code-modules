##########################################
#### Domain Join Extension variables #####
##########################################

variable "domain_to_join" {
  description = "Specify which AD domain to join"
  type        = string
  default     = null
}

variable "ou_path" {
  description = "Specify which OU path the machine must be added when joining to the AD domain"
  type        = string
  default     = ""
}

variable "domain_user" {
  description = "Specify which user will be used to join to the AD domain"
  type        = string
  default     = ""
}

variable "restart_enabled" {
  description = "Specify whether automatic restart is enabled when completing AD domain join"
  type        = string
  default     = "false"
}

variable "domain_user_password" {
  description = "Specify the password for the domain_user"
  type        = string
  default     = ""
}

variable "secret_url" {
  description = "The URL to the Key Vault Secret which stores the protected settings. "
  type        = string
  default     = ""

}

variable "vault_id" {
  description = "The ID of the source Key Vault. "
  type        = string
  default     = ""

}



variable "tags" {
  description = "Specify Tags for the resource group"
  type        = map(string)
  default     = {}
}


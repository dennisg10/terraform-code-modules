##########################################
### Custom Script Extension variables ####
##########################################

variable "virtual_machine_id" {
  description = "The ID of the Virtual Machine to configure the extension on."
  type        = string
}

variable "fileUris" {
  type        = list(string)
  description = "Requires a list of strings which contain the URLs of the files stored in the storage account. Default value is a empty list '[]' ."
  default     = []
}

variable "commandToExecute" {
  description = "Specify the command to run for Custom Script Extension deployment."
  type        = string
}

variable "managedIdentity" {
  description = "The ID of the Managed Identity which has the correct permissions to retrieve files. Default value is 'null' which uses the managed identity configured on the VM. If multiple MI's are configured, the object ID of the MI to use for CSE needs to be specified."
  type        = string
}



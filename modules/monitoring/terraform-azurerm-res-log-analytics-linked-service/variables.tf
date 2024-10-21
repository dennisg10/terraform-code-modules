variable "resource_group_name" {
  description = "Specify the resource group name."
  type        = string
}

variable "workspace_id" {
  description = "(Required) The ID of the Log Analytics Workspace that will contain the Log Analytics Linked Service resource."
  type        = string
}

variable "read_access_id" {
  description = "(Optional) The ID of the readable Resource that will be linked to the workspace. This should be used for linking to an Automation Account resource."
  default     = null
}

variable "write_access_id" {
  description = " (Optional) The ID of the writable Resource that will be linked to the workspace. This should be used for linking to a Log Analytics Cluster resource."
  default     = null
}

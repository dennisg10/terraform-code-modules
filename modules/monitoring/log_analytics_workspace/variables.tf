##########################################
########### Key vault variables ###########
##########################################

variable "resource_group_name" {
  description = "Specify the resource group name."
  type        = string
}

variable "location" {
  description = "Specify the location of the resource group."
  type        = string
}


variable "name" {
  description = "Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol."
  type        = string
}

variable "sku" {
  description = "Specifies the SKU of the Log Analytics Workspace. Possible values are 'Free', 'PerNode', 'Premium', 'Standard', 'Standalone', 'Unlimited', 'CapacityReservation', and 'PerGB2018'. Defaults to PerGB2018"
  type        = string
  default     = "PerGB2018"
  validation {
    error_message = "SKU type is not allowed. Please use valid SKU"
    condition     = contains(["Free", "PerGB2018"], var.sku)
  }
}

variable "retention_in_days" {
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = number
  default     = 90
}

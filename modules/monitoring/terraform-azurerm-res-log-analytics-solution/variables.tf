
variable "solution_name" {
  description = " (Required) Specifies the name of the solution to be deployed"
  type        = string
}


variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the Log Analytics solution is created. The solution and its related workspace can only exist in the same resource group."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "workspace_resource_id" {
  description = "(Required) The full resource ID of the Log Analytics workspace with which the solution will be linked."
  type        = string
}


variable "workspace_name" {
  description = "(Required) The full name of the Log Analytics workspace with which the solution will be linked."
  type        = string
}


variable "publisher" {
  description = "(Required) The publisher of the solution. For example Microsoft."
  type        = string
}



variable "product" {
  description = "(Required) The product name of the solution. For example OMSGallery/Containers"
  type        = string
}

variable "promotion_code" {
  description = "(Optional) A promotion code to be used with the solution. "
  type        = string
  default     = null
}

variable "tags" {
  default = {}
}

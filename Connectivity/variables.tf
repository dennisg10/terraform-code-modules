variable "subnets" {
  description = "For each subnet, create an object that contain fields"
  default     = {}
}

variable "vnet_name" {
  description = "Specify Virtual Network Name"
  type        = string
  default     = "BOV-PLC-VNET01"
}
variable "vnet_address_space" {
  description = "Specify Virtual Network Address Spaces. This can be more than one. "
  type        = list(string)
  default     = ["172.16.0.0/20"]
}


variable "resource_group_location" {
  description = "Specify default resource group location. Allowed values are : westeurope,northeurope "
  type        = string
  default     = "westeurope"
}

variable "tags" {
  type = map(string)
  default = {
    "DeploymentMethod" = "Terraform"
    "Company"          = "GlasIT"
    "Environment"      = "Production"
    "Service"          = "Connectivity"
  }

}

variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group"
  type        = string
}

variable "vm_name" {
  description = "Specify the name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Specify the size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
}

variable "admin_password" {
description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
}
#########################
##### vNIC variables ####
#########################

variable "subnet_id" {
  description = "Specify the name of the virtual machine"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "Specify the size of the virtual machine"
  type        = string
}


variable "private_ip_address" {
  description = "Specify the private IP address if IP address allocation is set to 'Static'"
  type        = string
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled. Allowed values are bool 'true' or 'false'. Default is set to 'false'"
  type        = bool
  default     = false
}

variable "license_type" {
  description = "Specifies that the image or disk that is being used was licensed on-premises. Allowed values are 'Windows_Client' or 'Windows_Server'. Default value is 'Windows_Server'"
  type        = string
}

#########################
### OS disk variables ###
#########################
variable "caching" {
  description = "Specify OS disk caching type. Allowed values are 'None', 'ReadOnly', 'ReadWrite'"
  type        = string
}
variable "storage_account_type" {
  description = "Specify OS disk type Allowed Vaules are 'Standard_LRS', 'Premium_LRS' etc."
  type        = string
  default     = "Standard_LRS"
}
variable "disk_size_gb" {
  description = "Specify the OS disk size. Default is set to 127"
  type        = number
  default     = 127
}
variable "write_accelerator_enabled" {
  description = "Whether OS disk write accelerator is enabled or not. Defaults sets to true"
  type        = bool
  default     = true
}

variable "source_image_reference" {
  description = "Specify the source image reference used for the virtual machine, the following arguments must be set in the object: 'publisher', 'offer', 'sku', 'version'"
  type        = map(string)
}


variable "marketplace_image" {
  description = "When a marketplace image is deployed, the marketplace_image variable must be set in a object which have the following arguments: 'name', 'product', 'publisher'. Default value for the marketplace_image is set to 'null'. As this is not required. "
  type        = map(string)
  default     = null
}

###################################
##### Data disk variables #########
###################################
variable "data_disk" {
  description = "Data disk object"
  default     = {}
}
###################################
### Patching mode variables ####
###################################

variable "patch_mode" {
  description = "	Specifies the mode of VM Guest Patching to IaaS virtual machine or virtual machines associated to virtual machine scale set with OrchestrationMode as Flexible. Allowed values are 'Manual', 'AutomaticByOS', 'AutomaticByPlatform'. Default is set to 'Manual'"
  type        = string
  default     = "Manual"
}

variable "enable_automatic_updates" {
  description = "Indicates whether Automatic Updates is enabled for the Windows virtual machine. Default value is 'false'"
  type        = bool
  default     = false
}
variable "hotpatching_enabled" {
  description = "Enables customers to patch their Azure VMs without requiring a reboot. For enableHotpatching, the 'provisionVMAgent' must be set to true and 'patchMode' must be set to 'AutomaticByPlatform'. Default is set to 'false'"
  type        = bool
  default     = false
}

###################################
##### Trusted Launch variables ####
###################################

variable "secure_boot_enabled" {
  description = "Specifies whether secure boot should be enabled on the virtual machine. Default value is 'false'"
  type        = bool
  default     = false
}
variable "vtpm_enabled" {
  description = "Specifies whether vTPM should be enabled on the virtual machine. Default is set to 'false'"
  type        = bool
  default     = false
}

###################################
### Managed Identity variables ####
###################################

variable "managed_identity_type" {
  description = "The identity of the virtual machine, if configured. Possible values are 'SystemAssigned', 'UserAssigned', 'SystemAssigned, UserAssigned'. If value set to 'UserAssigned' or 'SystemAssigend, UserAssigned', then the 'managed_identity_ids' variable must be configured with the IDs of the UserAssigned identites which is a list of strings.  "
  type        = string
}

variable "managed_identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Windows Virtual Machine."
  type        = list(string)
  default     = null
}


###################################
### Boot diagnostics variables ####
###################################

variable "boot_diagnostics_enabled" {
  description = "Enables Boot diagnostics. If set to true, the 'storage_account_uri' variable must be set with either 'null' value or the correct value"
}

variable "storage_account_uri" {
  description = "Boot Diagnostics is a debugging feature which allows you to view Console Output and Screenshot to diagnose VM status. 'Default value is 'null' which uses a managed storage account for the Uri"
  type        = string
  default     = null
}


variable "tags" {
  description = "Specify Tags for the resource group"
  type        = map(string)
  default     = {}
}


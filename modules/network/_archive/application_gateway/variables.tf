variable "resource_group_name" {
  description = "Specify the resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Specify the location of the resource group"
  type        = string
}

variable "name" {
  description = "The name of the Application Gateway. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_id" {
  description = "Specify the name of the virtual machine"
  type        = string
}

variable "sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2"
  type        = string
}

variable "sku_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
  type        = string
}

variable "sku_capacitiy" {
  description = "The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale_configuration is set."
  type        = number
}


##########################################
####### Frontend IP Public Configuration ########
##########################################
variable "frontend_public_ip_configuration_name" {
  description = "The name of the Frontend IP Configuration"
  type        = string
}

variable "frontend_public_ip_address" {
  description = "The ID of a Public IP Address which the Application Gateway should use. The allocation method for the Public IP Address depends on the sku of this Application Gateway. "
  type        = string
  default     = null
}

##################################################
####### Frontend IP Private Configuration ########
##################################################

variable "frontend_private_ip_configuration_name" {
  description = "The name of the Frontend IP Configuration"
  type        = string
}


variable "frontend_private_ip_address" {
  description = " The Private IP Address to use for the Application Gateway."
  type        = string
  default     = null
}
variable "frontend_private_ip_address_allocation" {
  description = "The Allocation Method for the Private IP Address. Possible values are 'Dynamic' and 'Static'"
  type        = string
}



##########################################
############# Frontend Port ##############
##########################################

variable "frontend_http_port_name" {
  description = "The name of the Frontend Port."
  type        = string
}

variable "frontend_http_port" {
  description = "The port used for this Frontend Port."
  type        = number
}


variable "frontend_https_port_name" {
  description = "The name of the Frontend Port."
  type        = string
}

variable "frontend_https_port" {
  description = "The port used for this Frontend Port."
  type        = number
}


##########################################
############# HTTP listener ##############
##########################################


variable "http_listener_name" {
  description = "The Name of the HTTP Listener.."
  type        = string
}

variable "http_listener_frontend_ip_configuration_name" {
  description = "The Name of the Frontend IP Configuration used for this HTTP Listener."
  type        = string
}

variable "http_listener_frontend_port_name" {
  description = "The Name of the Frontend Port use for this HTTP Listener."
  type        = string
}

variable "http_listener_protocol" {
  description = "The Protocol to use for this HTTP Listener. Possible values are 'Http' and 'Https'"
  type        = string
}



##########################################
######### Backend HTTP Settings ###########
##########################################
variable "backend_http_settings_name" {
  description = "Name of the HTTP Listener which should be used for this Routing Rule."
  type        = string
}


variable "backend_http_settings_port" {
  description = "The port which should be used for this Backend HTTP Settings Collection."
  type        = number
}

variable "backend_http_settings_protocol" {
  description = "The Protocol which should be used. Possible values are Http and Https."
  type        = string
}
variable "backend_http_settings_path" {
  description = " The Path which should be used as a prefix for all HTTP requests."
  type        = string
  default     = "/"
}
variable "backend_http_settings_cookie_based_affinity" {
  description = "Is Cookie-Based Affinity enabled? Possible values are Enabled and Disabled."
  type        = string
}

variable "backend_http_settings_request_timeout" {
  description = "The request timeout in seconds, which must be between 1 and 86400 seconds"
  type        = number
}




##########################################
######### Backend Address Pool ###########
##########################################

variable "backend_address_pool_name" {
  description = "The name of the Backend Address Pool."
  type        = string
}

##########################################
######### Request Routing Rule ###########
##########################################


variable "request_routing_rule_name" {
  description = "The Name of this Request Routing Rule."
  type        = string
}

variable "request_routing_rule_priority" {
  description = "The Name of this Request Routing Rule."
  type        = number
}

variable "request_routing_rule_rule_type" {
  description = "The Type of Routing that should be used for this Rule. Possible values are 'Basic' and 'PathBasedRouting'"
  type        = string
}

variable "request_routing_http_listener_name" {
  description = "Name of the HTTP Listener which should be used for this Routing Rule."
  type        = string
}


variable "request_routing_rule_backend_address_pool_name" {
  description = "The Name of the Backend Address Pool which should be used for this Routing Rule. Cannot be set if redirect_configuration_name is set."
  type        = string
}

variable "request_routing_rule_backend_http_settings_name" {
  description = "The Name of the Backend HTTP Settings Collection which should be used for this Routing Rule. Cannot be set if redirect_configuration_name is set."
  type        = string
}

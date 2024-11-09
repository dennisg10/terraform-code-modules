output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = module.vnet01.virtual_network_name
}

output "virtual_network_id" {
  description = "The id of the virtual network"
  value       = module.vnet01.virtual_network_id
}

output "virtual_network_address_space" {
  description = "List of address spaces that are used the virtual network."
  value       = module.vnet01.virtual_network_address_space
}


output "subnets_obj" {
  value = module.subnets.subnet_obj
}
output "special_subnet_obj" {
  value = module.special_subnets.subnet_obj
}


#######################################
#######################################
############## NSG  Outputs ###########
#######################################
#######################################


output "nsg_name" {
  value       = module.network_security_groups.nsg_name
  description = "Name of the subnets"
}
output "nsg_id" {
  value       = module.network_security_groups.nsg_id
  description = "Name of the subnets"
}

output "nsg_obj" {
  value       = module.network_security_groups.nsg_obj
  description = "Returns the complete set of NSG objects created in the virtual network"
}


#######################################
#######################################
########### Route Table Outputs #######
#######################################
#######################################

output "rt_name" {
  value       = module.route_table.rt_name
  description = "Name of the subnets"
}
output "rt_id" {
  value       = module.route_table.rt_id
  description = "Name of the subnets"
}

output "rt_obj" {
  value       = module.route_table.rt_obj
  description = "Returns the complete set of NSG objects created in the virtual network"
}
output "special_rt_obj" {
  value       = module.special_route_table.rt_obj
  description = "Returns the complete set of NSG objects created in the virtual network"
}


#######################################
#######################################
#############   Outputs #############
#######################################
#######################################
/*
output "waf_policy_obj" {
  value = module.waf_policies.waf_obj
}

output "waf_policy_id" {
  value       = module.waf_policies.id
  description = "Returns the complete set of NSG objects created in the virtual network"
}
*/


#######################################
#######################################
############# Data  Outputs ###########
#######################################
#######################################

#output "pli_vnet01" {
#  value = data.azurerm_virtual_network.pli_vnet01
#}


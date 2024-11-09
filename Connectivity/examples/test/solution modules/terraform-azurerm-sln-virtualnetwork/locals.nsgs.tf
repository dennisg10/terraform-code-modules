locals {
  nsgs = {
    BackEndSubnets = {
      nsg_name       = "${var.customer_prefix}-${var.environment_prefix}-${var.vnet_name}_NSG_BackEndSubnets"
      security_rules = []
    }
    FrontEndSubnets = {
      nsg_name       = "${var.customer_prefix}-${var.environment_prefix}-${var.vnet_name}_NSG_FrontEndSubnets"
      security_rules = []
    }
  }
  PrivateEndPointSubnets = {
    nsg_name       = "${var.customer_prefix}-${var.environment_prefix}-${var.vnet_name}_NSG_PrivateEndpointSubnets"
    security_rules = []
  }
  ManagementSubnets = {
    nsg_name       = "${var.customer_prefix}-${var.environment_prefix}-${var.vnet_name}_NSG_ManagementSubnets"
    security_rules = []
  }

  ApplicationGatewaySubnets = {
    nsg_name       = "${var.customer_prefix}-${var.environment_prefix}-${var.vnet_name}_NSG_ApplicationGatewaySubnets"
    security_rules = []
  }
}

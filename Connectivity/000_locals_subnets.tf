locals {
  special_subnets = {
    AzureFirewallSubnets = {
      subnet_name                       = "AzureFirewallSubnet"
      subnet_address_prefix             = ["172.16.0.0/26"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Disabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }
    /*
    AzureFirewallManagementSubnets = {
      subnet_name                       = "AzureFirewallManagementSubnet"
      subnet_address_prefix             = ["172.16.0.64/26"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Disabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }
    */
    GatewaySubnets = {
      subnet_name                       = "GatewaySubnet"
      subnet_address_prefix             = ["172.16.0.128/25"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Disabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }
    /*
    AzureBastionSubnets = {
      subnet_name                       = "AzureBastionSubnet"
      subnet_address_prefix             = ["172.16.1.0/26"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Disabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }

    RouteServerSubnets = {
      is_enabled                        = false
      subnet_name                       = "RouteServerSubnet"
      subnet_address_prefix             = ["172.16.1.64/27"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Disabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }
    */
    ApplicationGatewaySubnets = {
      subnet_name                       = "ApplicationGatewaySubnet"
      subnet_address_prefix             = ["172.16.2.0/26"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Enabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }
  }
  subnets = {
    BackEndSubnets = {
      subnet_name                       = "BackEndSubnet"
      subnet_address_prefix             = ["172.16.3.0/24"]
      service_endpoints                 = ["Microsoft.Storage", "Microsoft.KeyVault"]
      private_endpoint_network_policies = "Disabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }

    FrontEndSubnets = {
      subnet_name                       = "FrontEndSubnet"
      subnet_address_prefix             = ["172.16.4.0/24"]
      service_endpoints                 = ["Microsoft.Storage", "Microsoft.KeyVault"]
      private_endpoint_network_policies = "Enabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }

    DatabaseServicesSubnet1 = {
      subnet_name                       = "DatabaseServicesSubnet"
      subnet_address_prefix             = ["172.16.5.0/24"]
      service_endpoints                 = null
      private_endpoint_network_policies = "Disabled"
      service_delegation                = true
      service_delegation_name           = "Microsoft.Sql/managedInstances"
      service_delegation_actions        = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
    PrivateEndPointSubnets = {
      subnet_name                       = "PrivateEndpointSubnet"
      subnet_address_prefix             = ["172.16.6.0/24"]
      service_endpoints                 = ["Microsoft.Storage", "Microsoft.KeyVault"]
      private_endpoint_network_policies = "Enabled"
      service_delegation                = false
      service_delegation_name           = null
      service_delegation_actions        = null
    }
  }
}

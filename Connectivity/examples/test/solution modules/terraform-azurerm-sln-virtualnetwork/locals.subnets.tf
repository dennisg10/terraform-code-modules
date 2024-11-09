locals {
  special_subnets = {
    AzureFirewallSubnets = {
      subnet_name                               = "AzureFirewallSubnet"
      subnet_address_prefix                     = ["${var.network_id}.0.0/26"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }
    AzureFirewallManagementSubnets = {
      subnet_name                               = "AzureFirewallManagementSubnet"
      subnet_address_prefix                     = ["${var.network_id}.0.64/26"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }
    AzureBastionSubnets = {
      subnet_name                               = "AzureBastionSubnet"
      subnet_address_prefix                     = ["${var.network_id}.1.0/26"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }

    RouteServerSubnets = {
      subnet_name                               = "RouteServerSubnet"
      subnet_address_prefix                     = ["${var.network_id}.1.64/27"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }

    GatewaySubnets = {
      subnet_name                               = "GatewaySubnet"
      subnet_address_prefix                     = ["${var.network_id}.0.128/25"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }
    ApplicationGatewaySubnets = {
      subnet_name                               = "ApplicationGatewaySubnet1"
      subnet_address_prefix                     = ["${var.network_id}.2.0/26"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = true
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }
    DNSResolverInboundEndpointSubnets = {
      subnet_name                               = "DNS-Resolver-InboundEndpointSubnet1"
      subnet_address_prefix                     = ["${var.network_id}.7.0/28"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = true
      service_delegation                        = true
      service_delegation_name                   = "Microsoft.Network/dnsResolvers"
      service_delegation_actions                = null
    }
    DNSResolverEndpointEndpointSubnets = {
      subnet_name                               = "DNS-Resolver-OutboundEndpointSubnet1"
      subnet_address_prefix                     = ["${var.network_id}.7.16/28"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = true
      service_delegation                        = true
      service_delegation_name                   = "Microsoft.Network/dnsResolvers"
      service_delegation_actions                = null
    }


  }
  subnets = {
    BackEndSubnets = {
      subnet_name                               = "BackEndSubnet1"
      subnet_address_prefix                     = ["${var.network_id}.4.0/24"]
      service_endpoints                         = ["Microsoft.Storage", "Microsoft.KeyVault"]
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }
    #/*
    PrivateEndPointSubnets = {
      subnet_name                               = "PrivateEndpointSubnet1"
      subnet_address_prefix                     = ["${var.network_id}.2.128/25"]
      service_endpoints                         = ["Microsoft.Storage", "Microsoft.KeyVault"]
      private_endpoint_network_policies_enabled = true
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }

    FrontEndSubnets = {
      subnet_name                               = "FrontEndSubnet1"
      subnet_address_prefix                     = ["${var.network_id}.3.128/25"]
      service_endpoints                         = ["Microsoft.Storage", "Microsoft.KeyVault"]
      private_endpoint_network_policies_enabled = true
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }

    ManagementSubnets = {
      subnet_name                               = "ManagementSubnet1"
      subnet_address_prefix                     = ["${var.network_id}.5.0/25"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = false
      service_delegation                        = false
      service_delegation_name                   = null
      service_delegation_actions                = null
    }
  }
}

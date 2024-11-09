locals {
  nsgs = {
    BackEndSubnets = {
      nsg_name       = "BOV-PLC-VNET01_NSG_BackEndSubnets"
      security_rules = []
    }
    FrontEndSubnets = {
      nsg_name       = "BOV-PLC-VNET01_NSG_FrontEndSubnets"
      security_rules = []
    }
    ApplicationGatewaySubnets = {
      nsg_name = "BOV-PLC-VNET01_NSG_ApplicationGatewaySubnets"
      security_rules = [
        {
          name                       = "Allow_inbound_AzureLoadBalancers"
          description                = ""
          priority                   = "4094"
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_address_prefix      = "AzureLoadBalancer"
          source_address_prefixes    = []
          source_port_range          = "*"
          source_port_ranges         = []
          destination_address_prefix = "*"
          destination_address_prefixes : []
          destination_port_range  = "*"
          destination_port_ranges = []
        },
        {
          name                       = "Allow_inbound_GatewayManager"
          description                = ""
          priority                   = "4095"
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_address_prefix      = "GatewayManager"
          source_address_prefixes    = []
          source_port_range          = "*"
          source_port_ranges         = []
          destination_address_prefix = "*"
          destination_address_prefixes : []
          destination_port_range = ""
          destination_port_ranges = [
            "65200-65535"
          ]
        },
        {
          name                       = "DenyAnyInbound_overrule"
          description                = ""
          priority                   = "4096"
          direction                  = "Inbound"
          access                     = "Deny"
          protocol                   = "*"
          source_address_prefix      = "*"
          source_address_prefixes    = []
          source_port_range          = "*"
          source_port_ranges         = []
          destination_address_prefix = "*"
          destination_address_prefixes : []
          destination_port_range  = "*"
          destination_port_ranges = []
        }
      ]
    }
  }
}

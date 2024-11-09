locals {
  route_tables = {
    general_rt = {
      rt_name         = "BOV-PLC-VNET01-RT"
      bgp_propagation = false
      route = [
        {
          name                   = "to_firewall"
          address_prefix         = "0.0.0.0/0"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "172.16.0.4"
        },
        {
          name                   = "to_Identity"
          address_prefix         = "172.16.16.0/20"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "172.16.0.4"
        }
      ]
    }
  }

  special_route_tables = {

    GatewaySubnets = {
      rt_name         = "BOV-PLC-VNET01-RT-GatewaySubnets"
      bgp_propagation = true
      route = [
        {
          name                   = "to_connectivity"
          address_prefix         = "172.16.0.0/20"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "172.16.0.4"
        }
      ]
    }
    ApplicationGatewaySubnets = {
      rt_name         = "BOV-PLC-VNET01-RT-ApplicationGatewaySubnets"
      bgp_propagation = false
      route = [
        {
          name           = "to_internet"
          address_prefix = "0.0.0.0/0"
          next_hop_type  = "Internet"
        },
        {
          name                   = "azure-range"
          address_prefix         = "172.16.0.0/16"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "172.16.0.4"
        }
      ]
    }
  }
}

locals {
  network_rule_allow_dns = {
    name     = "Allow_DNS"
    priority = 101
    action   = "Allow"
    rules = [
      {
        name                  = "DNS_from_ANY_to_DNSPrivateResolver"
        description           = "Allow DNS to Private DNS Resolver"
        protocols             = ["TCP", "UDP"]
        source_addresses      = ["*"]
        destination_addresses = ["10.4.7.4"]
        destination_ports     = ["53"]
      },
      {
        name                  = "DNS_from_ANY_to_DNSServers"
        description           = "Allow DNS to Private DNS Resolver"
        protocols             = ["TCP", "UDP"]
        source_addresses      = ["*"]
        destination_addresses = ["10.4.20.5", "10.4.20.6"]
        destination_ports     = ["53"]
      },
      {
        name                  = "DNS_from_DNSPrivateResolver_to_ANY"
        description           = "Allow Private DNS Resolver to ALZ"
        protocols             = ["TCP", "UDP"]
        source_addresses      = ["10.4.7.4"]
        destination_addresses = ["*"]
        destination_ports     = ["53"]
      },
      {
        name                  = "DNS_from_DNSServers_to_ANY"
        description           = "Allow DNS from DNS Servers to Any"
        protocols             = ["TCP", "UDP"]
        source_addresses      = ["10.4.20.5", "10.4.20.6"]
        destination_addresses = ["*"]
        destination_ports     = ["53"]
      },
      {
        name                  = "DNS_between_DNSServers"
        description           = "Allow DNS between DNS Servers"
        protocols             = ["TCP", "UDP"]
        source_addresses      = ["10.4.20.5", "10.4.20.6"]
        destination_addresses = ["10.4.20.5", "10.4.20.6"]
        destination_ports     = ["53"]
      }
    ]
  }
}

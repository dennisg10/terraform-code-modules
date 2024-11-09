locals {
  network_rule_allow_icmp = {
    name     = "Allow_ICMP"
    priority = 100
    action   = "Allow"
    rules = [
      {
        name                  = "ICMP_from_ALZ_to_ALZ"
        description           = "Allow ICMP in Azure Landing Zone"
        protocols             = ["ICMP"]
        source_addresses      = ["10.4.0.0/16"]
        destination_addresses = ["10.4.0.0/16"]
        destination_ports     = ["*"]
      }
    ]
  }
}

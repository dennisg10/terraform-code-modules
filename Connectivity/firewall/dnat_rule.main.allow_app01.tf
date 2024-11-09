locals {
  dnat_rule_allow_app01 = {
      name     = "ExampleNatCollection"
      priority = 600
      rules = [
        {
          name                  = "ExampleNatRule"
          description           = "Example NAT Rule"
          protocols             = ["TCP"]
          source_addresses      = ["31.20.8.201"]
          destination_address   = module.afw-pip01.ip_address
          destination_ports     = ["80"]
          translated_address    = "12.0.0.1"
          translated_port       = "8080"
        }
      ]
  }
}

locals {
  network_rule_allow_ntp = {
    name     = "Allow_NTP"
    priority = 103
    action   = "Allow"
    rules = [
      {
        name                  = "NTP_to_DCs"
        description           = "Allow NTP to Domain Controllers"
        protocols             = ["UDP"]
        source_addresses      = ["10.4.0.0/16"]
        destination_addresses = ["10.4.20.5", "10.4.20.6"]
        destination_ports     = ["123"]

      },
      {
        name                  = "NTP_from_ALZ_to_time.windows.com"
        description           = "Allow NTP time.windows.com"
        protocols             = ["UDP"]
        source_addresses      = ["10.4.0.0/16"]
        destination_addresses = ["20.101.57.9"]
        destination_ports     = ["123"]
      }
    ]
  }
}

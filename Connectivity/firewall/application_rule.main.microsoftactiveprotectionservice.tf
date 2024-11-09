locals {
  application_rule_allow_microsoftactiveprotectionservice = {
    name        = "Allow_MicrosoftActiveProtectionService"
    description = "Allow access to Microsoft Active Protection Services"
    priority    = 4015
    action      = "Allow"
    rules = [
      {
        name        = "VN01"
        protocols = [
          {
            type = "Http"
            port = "80"
          },
          {
            type = "Https"
            port = "443"
          }
        ]
        source_addresses      = ["10.4.0.0/16"]
        destination_fqdn_tags = ["MicrosoftActiveProtectionService"]
        terminate_tls         = false
      }
    ]
  }
}

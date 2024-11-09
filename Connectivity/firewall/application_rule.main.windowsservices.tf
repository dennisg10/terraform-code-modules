locals {
  application_rule_allow_windowsservices = {
    name        = "Allow_WindowsServices"
    description = "Allow access to Windows Services"
    priority    = 4010
    action      = "Allow"
    rules = [
      {
        name = "Windows Update"
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
        destination_fqdn_tags = ["WindowsUpdate"]
        terminate_tls         = false
      },
      {
        name = "Windows Diagnostics"

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
        destination_fqdn_tags = ["WindowsDiagnostics"]
        terminate_tls         = false
      }
    ]
  }
}

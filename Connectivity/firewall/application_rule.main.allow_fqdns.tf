locals {
  application_rule_allow_fqdns = {
    name        = "Allow_FQDNs"
    description = "Allow access to FQDNs"
    priority    = 5005
    action      = "Allow"
    rules = [
      {
        name = "Conclusion DevTest"
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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = ["*.cedevtest.com",
          "cedevtest.com",
          "*.cedevtest.nl",
        "cedevtest.nl"]
        terminate_tls = false
      },
      {
        name = "Microsoft"
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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = [
          "*.microsoft.com",
          "*.aka.ms",
          "*.windows.net",
        "microsoft.com"]
        terminate_tls = false
      },
      {
        name = "Microsoft Azure"

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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = [
          "*.azure.com",
          "*.windowsazure.com",
          "*.onmicrosoft.com",
          "*.cloudapp.azure.com",
          "azure.com",
        "windowsazure.com"]
        terminate_tls = false
      },
      {
        name = "Microsoft Office"

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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = [
          "*.office.com",
          "*.office365.com",
          "*.outlook.com",
          "*.microsoftonline.com",
          "office.com",
          "office365.com",
          "outlook.com",
        "microsoftonline.com"]
        terminate_tls = false
      },
      {
        name = "Microsoft Bing"

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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = [
          "*.bing.com",
          "*.bing.nl",
          "bing.com",
        "bing.nl"]
        terminate_tls = false
      },
      {
        name = "Google"

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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = [
          "*.google.com",
          "*.google.nl",
          "google.com",
        "google.nl"]
        terminate_tls = false
      },
      {
        name = "YouTube"

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
        source_addresses = ["10.4.0.0/16"]
        destination_fqdns = [
          "*.youtube.com",
        "youtube.com"]
        terminate_tls = false
      }
    ]
  }
}

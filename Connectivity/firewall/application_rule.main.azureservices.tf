locals {
  application_rule_allow_azureservices = {
    name        = "Allow_AzureServices"
    description = "Allow access to Azure Services"
    priority    = 4020
    action      = "Allow"
    rules = [
      {
        name        = "Azure Backup"
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
        destination_fqdn_tags = ["AzureBackup"]
        terminate_tls         = false
      }
    ]
  }
}

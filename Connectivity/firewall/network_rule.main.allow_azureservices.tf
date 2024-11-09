locals {
  network_rule_allow_azureservices = {
    name     = "allow_azure"
    priority = 105
    action   = "Allow"
    rules = [
      {
        name             = "to several Azure services"
        description      = "Allows connectivity to Azure KMS servers"
        protocols        = ["TCP", "UDP"]
        source_addresses = ["10.4.0.0/16"]
        destination_addresses = [
          "AzureSiteRecovery",
          "AzureActiveDirectory",
          "AzureAdvancedThreatProtection",
          "AzureBackup",
          "AzureCloud",
          "AzureMonitor",
          "EventHub",
          "Storage"
        ]
        destination_ports = ["*"]
      }
    ]
  }
}

locals {
  network_rule_allow_azurekms = {
    name     = "Allow_AzureKMS"
    priority = 104
    action   = "Allow"
    rules = [
      {
        name             = "From_azure-range_to_AzureKMS"
        description      = "Allows connectivity to Azure KMS servers"
        protocols        = ["TCP"]
        source_addresses = ["10.4.0.0/16"]
        destination_addresses = [
          "23.102.135.246",
          "20.118.99.224",
          "40.83.235.53"
        ]
        destination_ports = ["1688"]
      }
    ]
  }
}

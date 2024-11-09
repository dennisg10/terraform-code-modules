module "fw-policy" {
  source                   = "../../../../modules/network/firewall_policy"
  name                     = "fw-policy"
  resource_group_name      = module.vnet01_rg.name
  location                 = module.vnet01_rg.location
  threat_intelligence_mode = "Deny"

  dns = [
    {
      proxy_enabled = false
      dns_servers   = ["8.8.8.8", "8.8.4.4"]
    }
  ]

}

locals {
  network_rule_collections = [
    local.network_rule_allow_dns,
    local.network_rule_allow_azurekms,
    local.network_rule_allow_icmp,
    local.network_rule_allow_ntp,
  ]
  dnat_rule_collection = [
    local.dnat_rule_allow_app01
  ]

  application_rule_collection = [
    local.application_rule_allow_azureservices,
    local.application_rule_allow_fqdns,
    local.application_rule_allow_microsoftactiveprotectionservice,
    local.application_rule_allow_windowsservices
  ]
}

module "network_rule_collection" {
  source             = "../../../../modules/network/firewall_policy_rule_collection_group"
  name               = "DefaultNetworkRuleCollection"
  priority           = 200
  firewall_policy_id = module.fw-policy.id

  network_rule_collections     = local.network_rule_collections
}

module "application_rule_collection" {
  source                       = "../../../../modules/network/firewall_policy_rule_collection_group"
  name                         = "DefaultApplicationRuleCollection"
  priority                     = 300
  firewall_policy_id           = module.fw-policy.id
  application_rule_collections = local.application_rule_collection
}
module "dnat_rule_collection" {
  source               = "../../../../modules/network/firewall_policy_rule_collection_group"
  name                 = "DefaultDNATRuleCollection"
  priority             = 400
  firewall_policy_id   = module.fw-policy.id
  nat_rule_collections = local.dnat_rule_collection
}

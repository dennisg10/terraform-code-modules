module "waf_policies" {
  source              = "../../../../modules/network/web_application_firewall_policy"
  resource_group_name = module.ag02_rg.name
  location            = module.ag02_rg.location
  tags                = var.tags
  waf_policies        = { for policy in local.waf_policies : policy.name => policy }
}

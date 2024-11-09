module "ag02_rg" {
  source                  = "../../../../modules/resource_group"
  resource_group_name     = "CCC-PLC-AG"
  resource_group_location = "westeurope"
}


module "ag02_pip" {
  source                  = "../../../../modules/network/public_ip"
  resource_group_name     = module.ag02_rg.name
  resource_group_location = module.ag02_rg.location
  name                    = "CCC-PLC-AG02_PIP"
  allocation_method       = "Static"
  sku                     = "Standard"
}

module "application_gateway" {
  source                   = "../../../../modules/network/application_gateway"
  application_gateway_name = "CC-AG01P"
  resource_group_name      = module.ag02_rg.name
  location                 = module.ag02_rg.location

  sku_name           = local.application_gateway_config.sku_name
  sku_tier           = local.application_gateway_config.sku_tier
  sku_capacitiy      = local.application_gateway_config.sku_capacitiy
  firewall_policy_id = local.application_gateway_config.firewall_policy_id



  subnet_id = module.special_subnets.subnet_obj["ApplicationGatewaySubnets"].id

  //Frontend Public IP Configuration
  public_ip_configuration_name = local.application_gateway_config.frontend_config.public.name
  public_ip_address_id         = module.ag02_pip.id
  //Frontend Private IP Configuration

  private_ip_configuration_name = local.application_gateway_config.frontend_config.private.name
  private_ip_address            = local.application_gateway_config.frontend_config.private.ip_address

  websites                  = local.websites
  trusted_root_certificates = local.trusted_root_certificates
  ssl_certificates          = local.ssl_certificates

  managed_identity     = "UserAssigned"
  managed_identity_ids = [module.ag02_uami.id]
}

module "ag02_uami" {
  source                  = "../../../../modules/user_assigned_managed_identity"
  resource_group_name     = module.ag02_rg.name
  resource_group_location = module.ag02_rg.location
  name                    = "CCC-PLC-AG01-UAMI-ApplicationGateway"
}


data "azurerm_key_vault" "ag02_kv" {
  name = "CC-PLC-KV01-Test"
  resource_group_name = "CCC-PLC-KeyVaults"
}

resource "azurerm_role_assignment" "uami_ag_kv" {
  scope = data.azurerm_key_vault.ag02_kv.id
  principal_id = module.ag02_uami.principal_id
  role_definition_name = "Key Vault Administrator"
}
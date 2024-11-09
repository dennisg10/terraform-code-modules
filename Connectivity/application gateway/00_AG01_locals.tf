locals {
  application_gateway_config = {
    sku_name           = "WAF_v2"
    sku_tier           = "WAF_v2"
    sku_capacitiy      = 2
    firewall_policy_id = module.waf_policies.waf_obj["global-policy"].id


    frontend_config = {
      public = {
        name       = "FrontendIP_Public"
        ip_address = module.ag02_pip.id
      }

      private = {
        name       = "FrontEndIP_Private"
        allocation = "Static"
        ip_address = "10.4.2.6"
      }
    }

    frontend_port_config = {
      http = {
        name = "Http_80"
        port = 80
      }

      https = {
        name = "Https_443"
        port = 443
      }
    }
  }
}

data "azurerm_key_vault" "cc-plc-kv01-test" {
  name                = "CC-PLC-KV01-Test"
  resource_group_name = "CCC-PLC-KeyVaults"
}

data "azurerm_key_vault_certificate" "ster-axxicom-nl" {
  name         = "ster-axxicom-nl"
  key_vault_id = data.azurerm_key_vault.cc-plc-kv01-test.id
}

locals {
  trusted_root_certificates = [
    {
      name                = "USERTrust-RSA-Certification-Authority"
      data                = "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"
      key_vault_secret_id = null
    }

  ]

  ssl_certificates = [
    {
      name                = "ster-axxicom-nl"
      data                = null
      key_vault_secret_id = "https://cc-plc-kv01-test.vault.azure.net/secrets/ster-axxicom-nl/59ae0a0b12fb4e85b7daa59149dee52e"
    }

  ]
  websites = [
    {
      name = "sta.axxicom.nl"

      listeners = [
        {
          name                      = "sta.axxicom.nl_public_HTTP"
          frontend_ip_configuration = "FrontendIP_Public"
          frontend_port             = "Http_80"
          protocol                  = "Http"
          host_name                 = "sta.axxicom.nl"
          ssl_certificate_name      = ""
          require_sni               = ""
          firewall_policy_id        = module.waf_policies.waf_obj["sta-acc.nl"].id
        },
        {
          name                      = "sta.axxicom.nl_public_HTTPS"
          frontend_ip_configuration = "FrontendIP_Public"
          frontend_port             = "Http_443"
          protocol                  = "Https"
          host_name                 = "sta.axxicom.nl"
          ssl_certificate_name      = "ster-axxicom-nl"
          require_sni               = ""
          firewall_policy_id        = module.waf_policies.waf_obj["sta-acc.nl"].id
        },
      ]
      backend_pool = {
        name    = "sta.axxicom.nl"
        ip_list = ["10.0.1.4", "10.0.1.5"]
      }
      backend_http_settings = [
        {
          name                  = "HTTP_80_default"
          protocol              = "Http"
          port                  = 80
          request_timeout       = 30
          cookie_based_affinity = "Disabled"
          path                  = "/"
          host_name             = null
        },
        {
          name                  = "HTTPS_443_sta.axxicom.nl"
          protocol              = "Https"
          probe_name            = "HTTPS_443_sta.axxicom.nl"
          port                  = 443
          request_timeout       = 240
          cookie_based_affinity = "Disabled"
          path                  = "/"
          host_name             = "sta.axxicom.nl"
        }
      ]

      routing_rules = [
        {
          name                        = "sta.axxicom.nl_public"       // Must be unique
          listener_name               = "sta.axxicom.nl_public_HTTPS" // Must be the same as listeners.name
          priority                    = 10
          rule_type                   = "Basic"
          backend_address_pool_name   = "sta.axxicom.nl"
          backend_http_settings       = "HTTPS_443_sta.axxicom.nl" // Must be the same as backend_http_settings.name
          redirect_configuration_name = null
        },
        {
          name                        = "sta.axxicom.nl_public_R"    // Must be unique
          listener_name               = "sta.axxicom.nl_public_HTTP" // Must be the same as listeners.name
          priority                    = 20
          rule_type                   = "Basic"
          backend_address_pool_name   = null
          backend_http_settings       = null // Must be the same as backend_http_settings.name
          redirect_configuration_name = "sta.axxicom.nl_public_Request"

        }
      ]
      redirect_configuration = [
        {
          name                 = "sta.axxicom.nl_public_Request" // Must be unique
          redirect_type        = "Permanent"                     // Must be the same as listeners.name
          target_listener_name = "sta.axxicom.nl_public_HTTPS"
          include_path         = true
          include_query_string = true
        }
      ]
      probes = [
        {
          name                                      = "HTTPS_443_sta.axxicom.nl"
          protocol                                  = "Https"
          pick_host_name_from_backend_http_settings = true
          path                                      = "/"
          interval                                  = 30
          timeout                                   = 30
          unhealthy_threshold                       = 3
        },
        {
          name                                      = "HTTPS_443_staweb.axxicom.nl"
          protocol                                  = "Https"
          pick_host_name_from_backend_http_settings = true
          path                                      = "/"
          interval                                  = 30
          timeout                                   = 30
          unhealthy_threshold                       = 3
          probe_matching_conditions = [
            {
              status_code = ["200-399"]
              body        = ""
            }
          ]
        }
      ]

    }
  ]
}

resource "azurerm_application_gateway" "application_gateway" {
  name                = var.application_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  firewall_policy_id  = var.firewall_policy_id

  dynamic "identity" {
    for_each = var.managed_identity != null ? [1] : []
    content {
      type         = var.managed_identity     // == null ? null : "UserAssigned"
      identity_ids = var.managed_identity_ids // == "UserAssigned" ? var.managed_identity_ids : null
    }
  }

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacitiy
  }
  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = var.public_ip_configuration_name
    public_ip_address_id = var.public_ip_address_id

  }
  frontend_ip_configuration {
    name                          = var.private_ip_configuration_name
    private_ip_address            = var.private_ip_address
    private_ip_address_allocation = var.private_ip_address == null ? "Dynamic" : "Static"
    subnet_id                     = var.subnet_id
  }

  dynamic "backend_address_pool" {
    for_each = { for website in var.websites : website.backend_pool.name => website.backend_pool }
    content {
      name         = backend_address_pool.key
      ip_addresses = backend_address_pool.value.ip_list
    }
  }


  dynamic "frontend_port" {
    for_each = flatten([
      for website in var.websites : [
        for listener in website.listeners : {
          name = listener.frontend_port
        }
      ]
    ])
    content {
      name = frontend_port.value.name
      port = frontend_port.value.name == "Http_80" ? 80 : 443
    }
  }

  dynamic "http_listener" {
    for_each = flatten([
      for website in var.websites : [
        for listener in website.listeners : {
          name                           = listener.name
          frontend_ip_configuration_name = listener.frontend_ip_configuration
          frontend_port_name             = listener.frontend_port
          protocol                       = listener.protocol
          host_name                      = listener.host_name
          ssl_certificate_name           = listener.ssl_certificate_name
          require_sni                    = listener.require_sni        // default value voor maken
          firewall_policy_id             = listener.firewall_policy_id // default value voor maken
        }
      ]
    ])
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
      host_name                      = http_listener.value.host_name
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
      firewall_policy_id             = http_listener.value.firewall_policy_id
    }
  }

  dynamic "backend_http_settings" {
    for_each = flatten([
      for website in var.websites : website.backend_http_settings
    ])
    content {
      name                  = backend_http_settings.value.name
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      port                  = backend_http_settings.value.port
      protocol              = backend_http_settings.value.protocol
      probe_name            = backend_http_settings.value.probe_name
      request_timeout       = backend_http_settings.value.request_timeout
      path                  = backend_http_settings.value.path
      host_name             = backend_http_settings.value.host_name

    }
  }

  dynamic "request_routing_rule" {
    for_each = flatten([
      for website in var.websites : [
        for rule in website.routing_rules : {
          name                        = rule.name
          priority                    = rule.priority
          rule_type                   = rule.rule_type
          listener_name               = rule.listener_name
          backend_http_settings       = rule.backend_http_settings
          backend_address_pool_name   = rule.backend_address_pool_name
          redirect_configuration_name = rule.redirect_configuration_name
        }
      ]
    ])
    content {
      name                        = request_routing_rule.value.name
      rule_type                   = request_routing_rule.value.rule_type
      priority                    = request_routing_rule.value.priority
      http_listener_name          = request_routing_rule.value.listener_name
      backend_address_pool_name   = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name  = request_routing_rule.value.backend_http_settings
      redirect_configuration_name = request_routing_rule.value.redirect_configuration_name //Create default value
    }
  }

  dynamic "redirect_configuration" {
    for_each = flatten([
      for website in var.websites : [
        for rule in website.redirect_configuration : {
          name                 = rule.name
          redirect_type        = rule.redirect_type
          target_listener_name = rule.target_listener_name
          include_path         = rule.include_path
          include_query_string = rule.include_query_string
        }
      ]
    ])
    content {
      name                 = redirect_configuration.value.name
      redirect_type        = redirect_configuration.value.redirect_type
      target_listener_name = redirect_configuration.value.target_listener_name
      include_path         = redirect_configuration.value.include_path         //Create default value
      include_query_string = redirect_configuration.value.include_query_string //Create default value
    }
  }


  dynamic "probe" {
    for_each = flatten([
      for website in var.websites : [
        for probe in website.probes : {
          name                                      = probe.name
          pick_host_name_from_backend_http_settings = probe.pick_host_name_from_backend_http_settings
          protocol                                  = probe.protocol
          path                                      = probe.path
          interval                                  = probe.interval
          timeout                                   = probe.timeout
          unhealthy_threshold                       = probe.unhealthy_threshold
          probe_matching_conditions                 = probe.probe_matching_conditions
        }
      ]
    ])
    content {
      name                                      = probe.value.name
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
      protocol                                  = probe.value.protocol
      path                                      = probe.value.path
      interval                                  = probe.value.interval
      timeout                                   = probe.value.timeout
      unhealthy_threshold                       = probe.value.unhealthy_threshold

      dynamic "match" {
        for_each = length(probe.value.probe_matching_conditions) > 0 ? probe.value.probe_matching_conditions : []
        content {
          status_code = match.value.status_code
          body        = match.value.body
        }
      }
    }
  }

  dynamic "trusted_root_certificate" {
    for_each = [for cert in var.trusted_root_certificates : cert if cert.name != null]
    content {
      name                = trusted_root_certificate.value.name
      data                = trusted_root_certificate.value.data
      key_vault_secret_id = trusted_root_certificate.value.key_vault_secret_id
    }
  }

  dynamic "ssl_certificate" {
    for_each = [for cert in var.ssl_certificates : cert if cert.name != null]
    content {
      name                = ssl_certificate.value.name
      data                = ssl_certificate.value.data
      key_vault_secret_id = ssl_certificate.value.key_vault_secret_id
    }
  }

}



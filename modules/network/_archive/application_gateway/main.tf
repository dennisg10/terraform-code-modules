


resource "azurerm_application_gateway" "application_gateway" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

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
    name                 = var.frontend_public_ip_configuration_name
    public_ip_address_id = var.frontend_public_ip_address

  }

  frontend_ip_configuration {
    name                          = var.frontend_private_ip_configuration_name
    private_ip_address            = var.frontend_private_ip_address
    private_ip_address_allocation = var.frontend_private_ip_address_allocation
    subnet_id                     = var.subnet_id
  }

  //Application Gateway Frontend Ports
  frontend_port {
    name = var.frontend_http_port_name
    port = var.frontend_http_port
  }

  frontend_port {
    name = var.frontend_https_port_name
    port = var.frontend_https_port
  }


  //HTTP listeners
  http_listener {
    // FrontEnd IP and port association
    frontend_ip_configuration_name = var.http_listener_frontend_ip_configuration_name
    frontend_port_name             = var.http_listener_frontend_port_name

    //Listener configuration
    name     = var.http_listener_name
    protocol = var.http_listener_protocol

  }

  //Backend Address pools
  backend_address_pool {
    name = var.backend_address_pool_name
  }


  //Configuration of the Backend Settings
  backend_http_settings {
    name                  = var.backend_http_settings_name
    port                  = var.backend_http_settings_port
    protocol              = var.backend_http_settings_protocol
    path                  = var.backend_http_settings_path
    cookie_based_affinity = var.backend_http_settings_cookie_based_affinity
    request_timeout       = var.backend_http_settings_request_timeout
  }

  ////Request Routing rule must be configured als last
  request_routing_rule {
    // Request routing rule propereties
    name      = var.request_routing_rule_name
    priority  = var.request_routing_rule_priority
    rule_type = var.request_routing_rule_rule_type
    //Associated Listener for Request routing rule 
    http_listener_name = var.request_routing_http_listener_name
    //Backend Target of Request routing rule
    backend_address_pool_name  = var.request_routing_rule_backend_address_pool_name
    backend_http_settings_name = var.request_routing_rule_backend_http_settings_name
  }
}

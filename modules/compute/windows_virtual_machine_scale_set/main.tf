resource "azurerm_windows_virtual_machine_scale_set" "windows_virtual_machine_scale_set" {
  resource_group_name  = var.resource_group_name
  location             = var.resource_group_location
  name                 = var.vm_name
  computer_name_prefix = var.computer_name_prefix
  sku                  = var.vm_sku
  instances            = var.instances
  admin_username       = var.admin_username
  admin_password       = var.admin_password



  network_interface {
    name    = "${var.vm_name}_vNIC"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
  os_disk {
    caching                   = var.caching
    storage_account_type      = var.storage_account_type
    disk_size_gb              = var.disk_size_gb
    write_accelerator_enabled = var.write_accelerator_enabled
  }




  dynamic "data_disk" {
    for_each = var.data_disk
    content {
      lun                  = index(var.data_disk, data_disk.value)
      caching              = data_disk.value.caching
      storage_account_type = data_disk.value.storage_account_type
      create_option        = data_disk.value.create_option
      disk_size_gb         = data_disk.value.disk_size_gb
    }
  }


  source_image_reference {

    publisher = lookup(var.source_image_reference, "publisher")
    offer     = lookup(var.source_image_reference, "offer")
    sku       = lookup(var.source_image_reference, "sku")
    version   = lookup(var.source_image_reference, "version")
  }



  dynamic "plan" {
    for_each = var.marketplace_image != null ? [1] : []
    content {
      name      = lookup(var.marketplace_image, "name", null)
      product   = lookup(var.marketplace_image, "product", null)
      publisher = lookup(var.marketplace_image, "publisher", null)
    }
  }


  ## Patching mode
  enable_automatic_updates = var.enable_automatic_updates

  ## License type
  license_type = var.license_type


  ##Security Settings
  secure_boot_enabled = var.secure_boot_enabled
  vtpm_enabled        = var.vtpm_enabled


  ### Managed Identity

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }
  ##Boot Diagnostics
  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics_enabled != false ? [1] : []
    content {
      storage_account_uri = var.boot_diagnostics_enabled == true ? var.storage_account_uri : null
    }
  }

  lifecycle {
    ignore_changes = [
      tags,
      os_disk
    ]
  }
}


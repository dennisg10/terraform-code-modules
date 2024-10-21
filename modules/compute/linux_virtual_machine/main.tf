resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  name                            = var.vm_name
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = var.admin_password == null ? true : false
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  os_disk {
    name                      = "${var.vm_name}_osDisk"
    caching                   = var.caching
    storage_account_type      = var.storage_account_type
    disk_size_gb              = var.disk_size_gb
    write_accelerator_enabled = var.write_accelerator_enabled
  }

  source_image_reference {

    publisher = lookup(var.source_image_reference, "publisher")
    offer     = lookup(var.source_image_reference, "offer")
    sku       = lookup(var.source_image_reference, "sku")
    version   = lookup(var.source_image_reference, "version")
  }

  dynamic "admin_ssh_key" {
    for_each = var.admin_password != null ? [] : [1]

    content {
      username   = var.admin_username
      public_key = lookup(var.admin_ssh_key, "public_key", null)
    }

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
  patch_mode = var.patch_mode


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


resource "azurerm_network_interface" "network_interface" {

  name                          = "${var.vm_name}_vNIC"
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  enable_accelerated_networking = var.enable_accelerated_networking



  ip_configuration {
    name      = "internal"
    subnet_id = var.subnet_id

    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

}


resource "azurerm_managed_disk" "data_disk" {
  for_each             = var.data_disk
  name                 = "${var.vm_name}_dataDisk_0${index(keys(var.data_disk), each.key) + 1}"
  resource_group_name  = var.resource_group_name
  location             = var.resource_group_location
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [azurerm_linux_virtual_machine.linux_virtual_machine]
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk" {
  for_each           = var.data_disk
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.linux_virtual_machine.id
  lun                = index(keys(var.data_disk), each.key)
  caching            = each.value.caching
  depends_on         = [azurerm_managed_disk.data_disk]

}


output "vm_id" {
  value = azurerm_virtual_machine.example.id
}

output "vm_public_ip" {
  value = azurerm_public_ip.example.ip_address
}

output "vm_admin_username" {
  value = azurerm_virtual_machine.example.admin_username
}
output "public_ip_address" {
  description = "Public IP address of the virtual machine"
  value       = azurerm_public_ip.main.ip_address
}

output "ssh_connection_string" {
  description = "SSH connection string for the virtual machine"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}

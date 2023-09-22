output "vnet_id" {
  description = "ID of the created Azure Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = azurerm_subnet.subnet.*.id
}

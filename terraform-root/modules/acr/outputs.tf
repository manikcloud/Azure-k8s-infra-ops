output "acr_login_server" {
  description = "The Login Server for the container registry."
  value       = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  description = "The ID of the container registry."
  value       = azurerm_container_registry.acr.id
}

output "acr_admin_username" {
  description = "The Admin Username associated with the container registry."
  value       = azurerm_container_registry.acr.admin_username
}

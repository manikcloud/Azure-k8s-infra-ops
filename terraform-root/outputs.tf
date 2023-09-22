output "acr_app_login_server" {
  value = module.acr_app.acr_login_server
}

output "acr_app_admin_username" {
  value = module.acr_app.acr_admin_username
}

output "acr_ops_login_server" {
  value = module.acr_ops.acr_login_server
}

output "acr_ops_admin_username" {
  value = module.acr_ops.acr_admin_username
}

output "vnet_ops_id" {
  description = "ID of the ops VNet"
  value       = module.vnet_ops.vnet_id
}

# output "vnet_ops_subnet_ids" {
#   description = "IDs of the subnets in the ops VNet"
#   value       = module.vnet_ops.subnet_ids
# }

output "vnet_app_id" {
  description = "ID of the app VNet"
  value       = module.vnet_app.vnet_id
}

# output "vnet_app_subnet_ids" {
#   description = "IDs of the subnets in the app VNet"
#   value       = module.vnet_app.subnet_ids
# }


output "aks_ops_kube_config" {
  description = "The Kubernetes config for connecting to the AKS OPS cluster"
  value       = module.aks_ops.aks_kube_config
  sensitive   = true
}

output "aks_app_kube_config" {
  description = "The Kubernetes config for connecting to the AKS apps cluster"
  value       = module.aks_app.aks_kube_config
  sensitive   = true
}

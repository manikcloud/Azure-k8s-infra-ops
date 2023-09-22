output "vnet_ops_id" {
  description = "ID of the ops VNet"
  value       = module.vnet-ops.vnet_id
}

output "vnet_ops_subnet_ids" {
  description = "IDs of the subnets in the ops VNet"
  value       = module.vnet-ops.subnet_ids
}

output "vnet_app_id" {
  description = "ID of the app VNet"
  value       = module.vnet-app.vnet_id
}

output "vnet_app_subnet_ids" {
  description = "IDs of the subnets in the app VNet"
  value       = module.vnet-app.subnet_ids
}


output "aks_ops_kube_config" {
  description = "The Kubernetes config for connecting to the AKS OPS cluster"
  value       = module.aks-ops.aks_kube_config
  sensitive   = true
}

output "aks_apps_kube_config" {
  description = "The Kubernetes config for connecting to the AKS apps cluster"
  value       = module.aks-app.aks_kube_config
  sensitive   = true
}

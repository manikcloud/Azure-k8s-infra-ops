output "aks_kube_config" {
  description = "The Kubernetes config for connecting to the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

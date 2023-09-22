variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "aks_name" {
  description = "Name for the Azure Kubernetes Service"
  type        = string
}

# variable "kubernetes_version" {
#   description = "Version of Kubernetes to deploy"
#   type        = string
#   default     = ""  # This can change depending on when you deploy, always check the latest stable version
# }

variable "node_pool_name" {
  description = "Name for the AKS node pool"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 1
}
variable "vnet_subnet_id" {
  description = "The subnet ID in which the AKS cluster should be deployed"
  type        = string
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "parent_id" {
  default = ""
}
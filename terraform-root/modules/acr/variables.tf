variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "East US"
}

variable "acr_name" {
  description = "Name for the Azure Container Registry"
  type        = string
  # default     = "manik-aks-acr"
}

variable "acr_sku" {
  description = "SKU for the Azure Container Registry"
  type        = string
  default     = "Basic"
}

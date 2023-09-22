variable "location" {
  default = "West US"
  type    = string
}
variable "aks_ops_name" {
  default     = "manik-ops-aks-cluster"
  description = "Cluster name"
  type        = string
}

variable "acr_ops_name" {
  default =   "aksacrops"
  type = string
  description = "ACR name"
}

variable "acr_app_name" {
  default =   "aksacrapp"
  type = string
  description = "ACR name"
}
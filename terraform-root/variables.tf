variable "location" {
  default = "West US"
  type    = string
}

variable "aks_name_ops" {
  default     = "aks_ops"
  description = "aks cluster ops"
  type        = string
}
variable "aks_name_app" {
  default     = "aks_app"
  description = "aks cluster app"
  type        = string
}

variable "acr_ops_name" {
  default     = "aksacrops"
  type        = string
  description = "acr name ops"
}

variable "acr_app_name" {
  default     = "aksacrapp"
  type        = string
  description = "acr name app"
}
variable "vnet_ops" {
  default     = "vnet_ops"
  type        = string
  description = " app vnet name"
}
variable "vnet_app" {
  default     = "vnet_app"
  type        = string
  description = " app vnet name"
}
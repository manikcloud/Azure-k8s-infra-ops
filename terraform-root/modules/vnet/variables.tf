variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "vnet_name" {
  description = "Name for the Azure Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["172.0.0.0/16"]
}

variable "subnets" {
  description = "Configuration for each subnet within the VNet"
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [
    {
      name           = "web"
      address_prefix = "172.0.1.0/24"
    },
    {
      name           = "app"
      address_prefix = "172.0.10.0/24"
    },
    {
      name           = "db"
      address_prefix = "172.0.3.0/24"
    }
  ]
}

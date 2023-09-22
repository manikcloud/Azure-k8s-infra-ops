resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = var.aks_name
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = random_pet.azurerm_kubernetes_cluster_name.id
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = "Standard_D2_v2"
    vnet_subnet_id = var.vnet_subnet_id
   
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

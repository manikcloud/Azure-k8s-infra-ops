# Generate random resource group name
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = "cluster"
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.rg.location
  name                = random_pet.azurerm_kubernetes_cluster_name.id
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.node_count

  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }
  # network_profile {
  #   network_plugin    = "kubenet"
  #   load_balancer_sku = "standard"
  # }

  network_profile {
    network_plugin     = "kubenet"
    load_balancer_sku  = "standard"
    dns_service_ip     = "10.2.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    service_cidr       = "10.2.0.0/24"
    # subnet_id  = azurerm_subnet.manik_public_subnet.id

  }

  depends_on = [
    azurerm_virtual_network.manik_vnet,
    azurerm_subnet.manik_public_subnet,
    azurerm_subnet.manik_private_subnet
  ]
}
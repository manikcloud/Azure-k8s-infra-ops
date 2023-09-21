# Generate random resource group name
resource "random_pet" "rg_name" {
  prefix = "manik-rg"
}

resource "azurerm_resource_group" "rg" {
  location = "West US"
  name     = random_pet.rg_name.id
}

module "acr1" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "West US"
  acr_name            = "manikaksacr1"
  acr_sku             = "Basic"
}

module "acr2" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "West US"
  acr_name            = "manikaksacr2"
  acr_sku             = "Basic"
}

module "vnet-ops" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "West US"
  vnet_name           = "manik-ops-vnet"
}

module "vnet-app" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "West US"
  vnet_name           = "manik-app-vnet"
}

module "aks-ops" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "West US"
  aks_name            = "manik-ops-aks-cluster"
  parent_id           = azurerm_resource_group.rg.id
  vnet_subnet_id      = module.vnet-ops.subnet_ids[0] # Assuming you want the first subnet for AKS
}

module "aks-app" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "West US"
  aks_name            = "manik-app-aks-cluster"
  parent_id           = azurerm_resource_group.rg.id
  vnet_subnet_id      = module.vnet-app.subnet_ids[0] # Assuming you want the first subnet for AKS
}

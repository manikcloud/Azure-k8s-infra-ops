# Generate random resource group name
resource "random_pet" "rg_name" {
  prefix = "manik-rg"
}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = random_pet.rg_name.id
}

module "acr-ops" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  acr_name            = var.acr_ops_name
  acr_sku             = "Basic"
}

module "acr-app" {
  source              = var.source_acr
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  acr_name            = var.acr_app_name
  acr_sku             = "Basic"
}

module "vnet-ops" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vnet_name           = "manik-ops-vnet"
}

module "vnet-app" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vnet_name           = "manik-app-vnet"
}

module "aks-ops" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  aks_name            = var.aks_ops_name
  parent_id           = azurerm_resource_group.rg.id
  vnet_subnet_id      = module.vnet-ops.subnet_ids[0] # Assuming you want the first subnet for AKS
}

module "aks-app" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  aks_name            = "manik-app-aks-cluster"
  parent_id           = azurerm_resource_group.rg.id
  vnet_subnet_id      = module.vnet-app.subnet_ids[0] # Assuming you want the first subnet for AKS
}

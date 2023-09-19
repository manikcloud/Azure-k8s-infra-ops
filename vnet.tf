resource "azurerm_virtual_network" "manik_vnet" {
  name                = "manikVnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "manik_public_subnet" {
  name                 = "manikPublicSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.manik_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "manik_private_subnet" {
  name                 = "manikPrivateSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.manik_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

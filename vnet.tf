terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.106.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg2" {
  name     = "31may-2"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vn2" {
  name                = "31may-2"
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name

  address_space = ["1.0.0.0/16"]
  dns_servers   = ["1.0.0.3", "1.0.0.4"]
}
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.rg2.name
  virtual_network_name = azurerm_virtual_network.vn2.name
  address_prefixes     = ["1.0.1.0/24"]
}
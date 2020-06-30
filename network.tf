resource "azurerm_virtual_network" "mydevaks-network" {
    name = "${var.aks_name}-network"
    location = var.region
    resource_group_name = azurerm_resource_group.mydev_rg.name
    address_space = var.vnet_cidr
}

resource "azurerm_subnet" "system-internal" {
    name = var.subnet_names[0]
    virtual_network_name = azurerm_virtual_network.mydevaks-network.name
    resource_group_name = azurerm_resource_group.mydev_rg.name
    address_prefixes = var.system_subnet_prefix
}

resource "azurerm_subnet" "stateless-workloads-internal" {
   name = var.subnet_names[1]
   resource_group_name = azurerm_resource_group.mydev_rg.name
   virtual_network_name = azurerm_virtual_network.mydevaks-network.name
   address_prefixes = var.stateless_subnet_prefix
}

resource "azurerm_subnet" "stateful-workloads-internal" {
   name = var.subnet_names[2]
   resource_group_name = azurerm_resource_group.mydev_rg.name
   virtual_network_name = azurerm_virtual_network.mydevaks-network.name
   address_prefixes = var.stateful_subnet_prefix
}
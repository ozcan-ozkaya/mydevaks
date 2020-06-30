resource  "azurerm_resource_group" "mydev_rg" {
    name = var.arg_name
    location = var.region
}
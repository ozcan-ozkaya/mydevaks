﻿resource "random_id" "log_analytics_workspace_name_suffix" {
    byte_length = 8
}

resource "azurerm_log_analytics_workspace" "aks-workspace" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
    location            = var.log_analytics_workspace_location
    resource_group_name = azurerm_resource_group.mydev_rg.name
    sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "aks-analytics-solution" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.aks-workspace.location
    resource_group_name   = azurerm_resource_group.mydev_rg.name
    workspace_resource_id = azurerm_log_analytics_workspace.aks-workspace.id
    workspace_name        = azurerm_log_analytics_workspace.aks-workspace.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}
resource "azurerm_kubernetes_cluster" "mydevaks" {
    name = var.aks_name
    location = var.region
    kubernetes_version = var.kubernetes_version
    resource_group_name = azurerm_resource_group.mydev_rg.name
    dns_prefix = var.dns_prefix

    linux_profile {
        admin_username = var.admin_username
        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }

    default_node_pool {
        name = var.system_nodes_pool_name
        node_count = var.system_nodes_count
        vm_size = var.system_nodes_vm_size
        vnet_subnet_id = azurerm_subnet.system-internal.id
        os_disk_size_gb = 30
    }

    identity {
        type = "SystemAssigned"
    }

    addon_profile {
        aci_connector_linux {
            enabled = false
        }

        azure_policy {
            enabled = false
        }

       http_application_routing {
            enabled = false
        }

       kube_dashboard {
           enabled = true
       }

        oms_agent {
            enabled = true
            log_analytics_workspace_id = azurerm_log_analytics_workspace.aks-workspace.id
        }
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "stateless-workloads" {
    name = var.stateless_worker_nodes_pool_name
    kubernetes_cluster_id = azurerm_kubernetes_cluster.mydevaks.id
    vm_size = var.stateless_worker_nodes_vm_size
    node_count = var.stateless_worker_nodes_count
    max_count = 10
    min_count = 1
    vnet_subnet_id = azurerm_subnet.stateless-workloads-internal.id
    enable_auto_scaling = "true" 
    os_type = "Linux"
    os_disk_size_gb = 30
}

resource "azurerm_kubernetes_cluster_node_pool" "stateful-workloads" {
    name = var.stateful_worker_nodes_pool_name
    kubernetes_cluster_id = azurerm_kubernetes_cluster.mydevaks.id
    vm_size = var.stateful_worker_nodes_vm_size
    node_count = var.stateful_worker_nodes_count
    vnet_subnet_id = azurerm_subnet.stateful-workloads-internal.id
    enable_auto_scaling = "false"
    os_type = "Linux"
    os_disk_size_gb = 50
}


provider "azurerm" {
    features {}
    version = "2.16.0"
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.mydevaks.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.mydevaks.0.kube_config.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.mydevaks.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.mydevaks.kube_config.0.cluster_ca_certificate)
}
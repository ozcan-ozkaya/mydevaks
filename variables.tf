variable "ARM_SUBSCRIPTION_ID" {
    description = "Azure subscription id"
}
variable "ARM_CLIENT_ID" {
    description = "Azure client id"
}

variable "ARM_TENANT_ID" {
    description = "Azure tenant id"
}

variable "ARM_CLIENT_SECRET" {
    description = "Azure Client secret"
}
variable "region" {
    description = "Azure region"
}
variable "vnet_cidr" {
    description = "Azure vnet cidr range"
}
variable "system_subnet_prefix" {
    description = "System Subnet prefix cidr ranges"
}

variable "stateless_subnet_prefix" {
    description = "Stateless workloads Subnet prefix cidr ranges"
}

variable "stateful_subnet_prefix" {
    description = "Stateful workloads Subnet prefix cidr ranges"
}

variable "subnet_names" {
    description = "Subnet names"
}

variable "arg_name" {
    description = "Azure resource group name"
}

variable "aks_name" {
    description = "Aks cluster name"
}

variable "kubernetes_version" {
    description = "Kubernetes cluster version"
}

variable "dns_prefix" {
    description = "Dns prefix for Aks cluster"
}

variable "system_nodes_pool_name" {
    description = "System node pool name for AKS cluster, this node pool dedicated for system"
}

variable "stateless_worker_nodes_pool_name" {
    description = "Worker nodes pool name for stateless workloads"
}

variable "stateful_worker_nodes_pool_name" {
    description = "Worker nodes pool name for stateful workloads"
}

variable "system_nodes_count" {
    description = "Node count for system nodes"
}

variable "stateless_worker_nodes_count" {
    description = "Worker nodes count for stateless workloads"
}

variable "system_nodes_vm_size" {
    description = "System nodes vm size"
}

variable "stateless_worker_nodes_vm_size" {
    description = "Worker nodes vm size for stateless workloads"
}

variable "stateful_worker_nodes_vm_size" {
    description = "Worker nodes vm size for stateful workloads"
}

variable "stateful_worker_nodes_count" {
    description = "Worker nodes count for stateful workloads"
}

variable "admin_username" {
    description = "admin user name for worker nodes"
}

variable "ssh_public_key" {
    description = "ssh key path for linux worker nodes"
}

variable "log_analytics_workspace_name" {
    description = "Workspace name for AKS cluster log analytics"
}

variable "log_analytics_workspace_location" {
    description = "Workspace Azure location for AKS cluster log analytics"
}

variable "log_analytics_workspace_sku" {
    description = "Log analytic workspace plan type"
}
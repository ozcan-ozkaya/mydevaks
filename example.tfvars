subscription_id = ""
client_id = ""
tenant_id = ""
client_secret = ""

region = "UK South"
arg_name = "mydev_rg"
aks_name = "mydevaks"
kubernetes_version = "1.16.9"
dns_prefix = "mydevaks"

vnet_cidr = ["10.1.0.0/16"]
system_subnet_prefix = ["10.1.1.0/24"]
stateless_subnet_prefix = ["10.1.2.0/24"]
stateful_subnet_prefix = ["10.1.3.0/24"]
subnet_names = ["system", "linux-workloads", "win-workloads"]

system_nodes_pool_name = "system"
system_nodes_count = 1
system_nodes_vm_size = "Standard_DS2_v2"

stateless_worker_nodes_pool_name = "pool01"
stateless_worker_nodes_count = 1
stateless_worker_nodes_vm_size = "Standard_DS2_v2"

admin_username = "aks-admin"
ssh_public_key = "~/.ssh/id_rsa.pub"

stateful_worker_nodes_pool_name = "pool02"
stateful_worker_nodes_count = 1
stateful_worker_nodes_vm_size = "Standard_DS2_v2"
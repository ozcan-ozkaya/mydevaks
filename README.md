## Set up Azure storage to store Terraform state

## Create a container in Azure storage
`az storage container create -n tfstate --account-name <YourAzureStorageAccountName> --account-key <YourAzureStorageAccountKey>

## Create the cluster 
terraform init -backend-config="storage_account_name=<YourAzureStorageAccountName>" -backend-config="container_name=tfstate" -backend-config="access_key=<YourStorageAccountAccessKey>" -backend-config="key=codelab.microsoft.tfstate"

## Run the terraform plan command to create the Terraform plan that defines the infrastructure elements.
terraform plan -out out.plan


## Run the terraform apply command to apply the plan to create the Kubernetes cluster.
terraform apply out.plan
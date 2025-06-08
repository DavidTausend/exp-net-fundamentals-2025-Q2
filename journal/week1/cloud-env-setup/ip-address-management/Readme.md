## Create Resource Group

```sh
az group create --name net-fun-bootcamp --location westeurope
```

## Deploy Windows Server

```sh
cd ip-address-management/templates/vm
az deployment group create \
  --resource-group net-fun-bootcamp \
  --template-file template.bicep \
  --parameters @parameters.json \
  --parameters adminPassword="My$StrongP@ssw0rd"
```

🔐 Note: Use secrets and secure vaults for production deployments. Hardcoding passwords is discouraged in real environments.

## 🧹 Delete Resource Group (Clean Up)

To remove all provisioned resources:

```sh
az group delete --name net-fun-bootcamp --yes --no-wait
```

## Summary

•	✅ Deployed Windows Server VM in Azure
•	✅ Exported the ARM template for reuse
•	✅ Converted template to Bicep for better maintainability
•	✅ Deployed using Bicep and Azure CLI
•	✅ Cleaned up using az group delete
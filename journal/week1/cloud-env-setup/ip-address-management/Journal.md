# ⚙️ Azure Windows Server Deployment (Resource Template → Bicep)

This document outlines the process of deploying a Windows Server 2025 Datacenter VM on Azure, downloading the ARM template, converting it to Bicep, and redeploying using Azure CLI.

---


## ⬇️ Download Azure Resource Template

After deploying my Microsoft Windows Server DataCenter 2025 to Azure VM.
I downloade the Resource Template to be able to easily deploy again.


## 🧰 Install Azure CLI

```sh
brew install azure-cli
```


## Login Azure CLI

Log in using device code flow (useful when browser login is preferred):

```sh
az login --use-device-code
```

## Converting Resource Template to Azure Bicep

The deployed server had no Windows GUI, so I wanted to reuse the exported template more efficiently. ARM templates are often too verbose, so I converted it to Bicep, a cleaner and more readable format.

```sh
cd ip-address-management/templates/vm
az bicep decompile --file template.json
```


## Issues Encounter

### Verbose template resource

After decompilation, I noticed the resulting .bicep file was still quite verbose. This is expected, as az bicep decompile attempts a 1:1 translation of the original JSON structure.

To simplify the Bicep code:
	•	I manually cleaned up the output
	•	I also asked ChatGPT to suggest a more modular and readable Bicep refactor

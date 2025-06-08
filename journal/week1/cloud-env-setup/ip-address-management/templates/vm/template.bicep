@description('Location for all resources')
param location string

@description('Virtual network configuration')
param virtualNetworkName string
param addressPrefixes array
param subnets array
param subnetName string

@description('Network security group')
param networkSecurityGroupName string
param networkSecurityGroupRules array

@description('Public IP configuration')
param publicIpAddressName string
param publicIpAddressType string
param publicIpAddressSku string
param pipDeleteOption string

@description('NIC configuration')
param networkInterfaceName string
param nicDeleteOption string

@description('VM configuration')
param virtualMachineName string
param virtualMachineComputerName string
param virtualMachineSize string
param osDiskType string
param osDiskDeleteOption string
param hibernationEnabled bool
param vmZone string

@description('Security configuration')
param securityType string = 'TrustedLaunch'
param secureBoot bool = true
param vTPM bool = true

@description('Admin credentials')
param adminUsername string
@secure()
param adminPassword string

@description('Patch configuration')
param patchMode string
param enablePeriodicAssessment string
param enableHotpatching bool

// Network Security Group
resource nsg 'Microsoft.Network/networkSecurityGroups@2020-05-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: networkSecurityGroupRules
  }
}

// Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
    subnets: subnets
  }
}

// Public IP
resource publicIp 'Microsoft.Network/publicIpAddresses@2020-08-01' = {
  name: publicIpAddressName
  location: location
  sku: {
    name: publicIpAddressSku
  }
  zones: [
    vmZone
  ]
  properties: {
    publicIPAllocationMethod: publicIpAddressType
    deleteOption: pipDeleteOption
  }
}

// NIC
resource nic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaceName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, subnetName)
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
  dependsOn: [
    nsg
    vnet
    publicIp
  ]
}

// Windows 11 Enterprise VM
resource vm 'Microsoft.Compute/virtualMachines@2024-03-01' = {
  name: virtualMachineName
  location: location
  zones: [vmZone]
  properties: {
    hardwareProfile: {
      vmSize: virtualMachineSize
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsDesktop'
        offer: 'windows-11'
        sku: 'win11-22h2-ent'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
        deleteOption: osDiskDeleteOption
      }
    }
    osProfile: {
      computerName: virtualMachineComputerName
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: true
        provisionVMAgent: true
        patchSettings: {
          patchMode: patchMode
          assessmentMode: enablePeriodicAssessment
          enableHotpatching: enableHotpatching
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
          properties: {
            deleteOption: nicDeleteOption
          }
        }
      ]
    }
    securityProfile: {
      securityType: securityType
      uefiSettings: {
        secureBootEnabled: secureBoot
        vTpmEnabled: vTPM
      }
    }
    additionalCapabilities: {
      hibernationEnabled: hibernationEnabled
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

output vmAdmin string = adminUsername

targetScope = 'resourceGroup'

param vnetName string
param subnetName string
param addressPrefix string
param subnetPrefix string
param location string
param tags object = {}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
  }
  tags: tags
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' = {
  name: subnetName
  parent: virtualNetwork
  properties: {
    addressPrefix: subnetPrefix
  }
}

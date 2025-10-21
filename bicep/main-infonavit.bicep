targetScope = 'subscription'

param resourceGroupName string = 'infonavit'
param location string = 'eastus2'
param tags object = {
  project: 'infonavit'
  environment: 'shared'
  managedBy: 'bicep'
}

module resourceGroup 'modules/resource-group/resource-group.bicep' = {
  name: 'deploy-rg-infonavit'
  params: {
    resourceGroupName: resourceGroupName
    location: location
    tags: tags
  }
}

output resourceGroupName string = resourceGroupName
output resourceGroupId string = resourceGroup.outputs.resourceGroupId

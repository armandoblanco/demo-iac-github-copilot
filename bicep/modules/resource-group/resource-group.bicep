targetScope = 'subscription'

param resourceGroupName string
param location string
param tags object = {}

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

output resourceGroupId string = rg.id
output resourceGroupName string = rg.name

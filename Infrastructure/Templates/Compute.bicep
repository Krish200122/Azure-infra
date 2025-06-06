param name string
param location string
param sku string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${name}-plan'
  location: location
  sku: {
    name: sku
    tier: 'Standard'
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webAppName string = webApp.name

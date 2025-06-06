param location string = resourceGroup().location
param vnetName string = 'ecom-vnet'
resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: { addressPrefixes: ['10.0.0.0/16'] }
    subnets: [
      { name: 'app-subnet', properties: { addressPrefix: '10.0.1.0/24' } }
      { name: 'db-subnet', properties: { addressPrefix: '10.0.2.0/24' } }
    ]
  }
}
output vnetId string = vnet.id

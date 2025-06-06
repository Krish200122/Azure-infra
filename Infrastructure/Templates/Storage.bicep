param location string
param sqlServerName string = ''
param sqlDbname string = ''
param adminLogin string
@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
  }
}

resource sqlDb 'Microsoft.Sql/servers/databases@2021-02-01-preview' = {
  name:sqlDbname
  sku: { 
    name: 'GP_S_Gen5_2', tier: 'GeneralPurpose', capacity: 2 
  }
  parent:sqlServer
  location:location
}

param location string = resourceGroup().location
param computename string = ''
param computesku string = ''
param adminLogin string
param sqlServerName string = ''
param sqlDbname string = ''
@secure()
 param adminPassword string

module net './Templates/Network.bicep' = { 
  name: 'network'
   params: { location: location 
  }
 }
module comp './Templates/Compute.bicep' = {
  name: 'compute'
  params: { 
    location: location
    name: computename
    sku:computesku
  }
}

module sqlModule './Templates/storage.bicep' = {
  name: 'deploySqlServerAndDb'   
  params: {
    location        : location
    sqlServerName   : sqlServerName
    sqlDbname       : sqlDbname
    adminLogin      : adminLogin
    adminPassword   : adminPassword
  }
}


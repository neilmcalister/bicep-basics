param location string = 'uksouth'
param prefix string = 'sasandbox'

var uniqueString1 = uniqueString(resourceGroup().id, 'storageAccount1')
var uniqueString2 = uniqueString(resourceGroup().id, 'storageAccount2')

resource storageAccount1 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: '${prefix}${take(uniqueString1, 12)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

resource storageAccount2 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: '${prefix}${take(uniqueString2, 12)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

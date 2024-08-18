targetScope = 'subscription'
param p_azlocation string = 'uksouth'
param p_azsarandomprefix string = 'sasandbox'
param p_azresourcegroup string = 'rg-bicep-subscriptionscopemodules'

resource azresourcegroup01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: p_azresourcegroup
  location: p_azlocation
}

module storageaccount1 './modules/mssa-random.bicep' = {
  name: 'storageaccount1'
  scope: azresourcegroup01
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: p_azlocation
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

module storageaccount2 './modules/mssa-random.bicep' = {
  name: 'storageaccount2'
  scope: azresourcegroup01
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: p_azlocation
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

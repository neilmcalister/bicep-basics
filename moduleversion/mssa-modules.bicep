param p_azlocation string = 'uksouth'
param p_azsarandomprefix string = 'sasandbox'

module storageaccount1 './modules/mssa-random.bicep' = {
  name: 'storageaccount1'
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: p_azlocation
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

module storageaccount2 './modules/mssa-random.bicep' = {
  name: 'storageaccount2'
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: p_azlocation
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

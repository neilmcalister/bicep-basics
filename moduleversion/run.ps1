# Neil McAlister August 2024
# https://github.com/neilmcalister

# You may need to authenticate with az login first and use az acccount set --subscription "yourAzureSubscriptionName" to change your target Azure subscription
# Ensure you are CD'd to the correct folder before running this

$resourcegroup = 'rg-bicep-modules'
$location = 'uksouth'

az group create --name $resourcegroup --location $location

az deployment group what-if --resource-group $resourcegroup --template-file .\mssa-modules.bicep
az deployment group create --resource-group $resourcegroup --template-file .\mssa-modules.bicep

# Delete ONE of those storage accounts (you may want to do it manually via the portal if unsure here)

$getlistofstorageaccounts = & az resource list --resource-group $resourcegroup --query [].name -o tsv
$getlistofstorageaccountsArray = $getlistofstorageaccounts -split "`n"
$storageaccounttodelete = $getlistofstorageaccountsArray[0]
Write-Host "Deleting $storageaccounttodelete"
az storage account delete --name $storageaccounttodelete --resource-group $resourcegroup --yes

# ...once deleted - run this again...

az deployment group what-if --resource-group $resourcegroup --template-file .\mssa-modules.bicep

# RESULT: 
# ... The what-if should pick up the deleted storage account needs putting back with "+ Create" message
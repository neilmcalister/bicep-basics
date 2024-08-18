# Neil McAlister August 2024
# https://github.com/neilmcalister

# You may need to authenticate with az login first and use az acccount set --subscription "yourAzureSubscriptionName" to change your target Azure subscription
# Ensure you are CD'd to the correct folder before running this

$location = 'uksouth'

az deployment sub what-if --location $location --template-file .\mssubscriptionscope.bicep
az deployment sub create --location $location --template-file .\mssubscriptionscope.bicep

# Delete ONE of those storage accounts (you may want to do it manually via the portal if unsure here)
$resourcegroup = 'rg-bicep-subscriptionscopemodules' # This var only used here for the delete step - ensure it matches with what's in your mssubscriptionscope.bicep file!
$getlistofstorageaccounts = & az resource list --resource-group $resourcegroup --query [].name -o tsv
$getlistofstorageaccountsArray = $getlistofstorageaccounts -split "`n"
$storageaccounttodelete = $getlistofstorageaccountsArray[0]
Write-Host "Deleting $storageaccounttodelete"
az storage account delete --name $storageaccounttodelete --resource-group $resourcegroup --yes

# ...once deleted - run this again...

az deployment sub what-if --location $location --template-file .\mssubscriptionscope.bicep

# it should pick up the deleted storage account needs putting back "+ Create"
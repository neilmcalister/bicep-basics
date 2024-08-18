# bicep-basics
A repo with some very basic Bicep in it to demonstrate a few different ways to achieve the same goal - each with increasing benefits.

# Author
Neil McAlister <br>
https://github.com/neilmcalister <br>
https://www.linkedin.com/in/neilmcalister/

## Prerequisites

* Azure CLI installed https://learn.microsoft.com/en-us/cli/azure/install-azure-cli <br>
* Bicep CLI - when the Azure CLI is installed run ```az bicep install``` from a command prompt
* Login using ```az login```
* Select your Azure Subscription with ```az account set --subscription "yourAzureSubscriptionName"``` command - verifiy with ```az account show```
* The ```run.ps1``` files have been created and tested for ```PowerShell``` - any version on any platform should be OK

## A note on parameters
I've not used parameter .JSON files to pass in here - everything is hardcoded in the .bicep files to keep things simple. If you don't like the names of things, you can change the names if you wish. The prefix of the Storage Accounts is currently set as ```sasandbox``` and the location ```uksouth```

## The task at hand...
Provision an Azure Resource Group and put x2 Azure Storage Accounts in it. The Storage Account name has to be globally unique - so the code here works with a fixed prefix of a few letters at the start of the name, and a randomised suffix for the rest of the name.

## Contents
There are x3 subfolders in this repo - each deliver the task at hand (above), but in slightly different ways.
* ```nomoduleversion```
* ```moduleversion```
* ```subscope-moduleversion```

## nomoduleversion
Creates the x2 Storage Accounts into the resource group ```rg-bicep-nomodules``` The resource group HAS to exist BEFORE you run this - follow the instructions in the run.ps1 file in the folder

## moduleversion
Using a single Bicep module specifically for the provisiong a Storage Account - Creates the x2 Storage Accounts into the resource group ```rg-bicep-modules``` The resource group HAS to exist BEFORE you run this - follow the instructions in the run.ps1 file in the folder

## subscope-moduleversion
Using a single Bicep module specifically for the provisiong a Storage Account AND the resource group. Creates the Resource Group ```rg-bicep-subscriptionscopemodules``` and the x2 Storage Accounts. Follow the instructions in the run.ps1 file in the folder

## The differences
The ```nomoduleversion``` is just a single .bicep file - you have to create the resource group OUTSIDE of Bicep code FIRST before you run this

The ```moduleversion``` is near enough the same - except it uses a Bicep module to provision the storage account. Modules are the best way to do things at scale when you have many of the same resources to deploy, and you can also apply a standard way to deploy the same resource many times over. Again though, you have to create the resource group OUTSIDE of Bicep code FIRST before running this.

The ```subscope-moduleversion``` uses the module in the same way, but this time we set a ```targetScope``` of ```"subscription"``` when submitting this. With the exclusive use of modules and the different target scopes for each, we can provision the resource group AND the storage accounts in Bicep - and don't have to set up the reosurce group outside of Bicep.

## The run.ps1 file
The ```run.ps1``` file is a PowerShell file that is unique in each subfolder. It attempts to give you an idea of how to use the ```what-if``` functionality when running Bicep, and also how to delete things and put back again.

I would always recommend using the ```what-if``` functionality BEFORE you deploy anything - just to be sure. I would also recommend that you run the contents of the ```run.ps1``` file line-by-line so that you are safe in your own environment and you can understand what is occuring with each step
Param (
    [string]$envPrefix="demo",
	[Parameter(Mandatory=$true)][string]$username = $( Read-Host "Input username, please:" ) ,
	[Parameter(Mandatory=$true)][string]$password = $( Read-Host "Input password, please:" )
 )
 
write-output "environment prefix: $envPrefix"
write-output "username: $username"
write-output "password: $password"

#[switch]$force = $false
#$abc = $envPrefix-webapp

#write-output "check - $abc"
New-AzureRmResourceGroup -Name "$envPrefix-webapp" -Location "South Central US"

$secret = ConvertTo-SecureString -String "$password" -AsPlainText -Force

New-AzureRmResourceGroupDeployment -ResourceGroupName "$envPrefix-webapp" -TemplateFile webappdeploy.json -siteName glisiteapp -administratorLogin $username -administratorLoginPassword $secret

New-AzureRmResourceGroup -Name "$envPrefix-waf" -Location "South Central US"

New-AzureRmResourceGroupDeployment -ResourceGroupName "$envPrefix-waf" -TemplateFile wafdeploy.json -environmentPrefix $envPrefix

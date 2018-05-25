# azure-arm-templates
Azure ARM templates

This ARM template deployment via powershell configures two resource groups described below:
(a) WebApp consisting of Linux + MySQL DB
WebApp is configured and with needful configuration settings. Password is encrypted and used for configuration of MySQL db.

(b) WebApplication Firewall in Prevention mode
WebApplication firewall is configured with following settings:
- Required subnet
- WebApp configured in step (a) is used as backend pool
- Requests from WAF are proxied and sent to WebApp
- WAF is configured in Prevention mode with OWASP 3.0 specification
- custom probe configuration is done to check if backend webapp is functional
- custom configuration to enable diagnostic logs monitoring of application logs and firewall logs for needful troubleshooting

Usage:
(1) Open Windows PowerShell window

(2) Login to Azure Account

PS D:\Azure\ARMTemplates> Connect-AzureRmAccount

(3) Execute following command to create Azure resources described above:

PS D:\Azure\ARMTemplates> .\azure-run.ps1 -envPrefix Demo6 -username glisten -password Gli20sten18

     Arguments: envPrefix - Prefix for objects getting created in Azure
                username  - Username to login into webapp (Mandatory)
                password  - Password to login into webapp (Mandatory). It needs to meet complexity requirement of Azure. Currently no complexity checks implemented.

Each of the tasks configured in the powershell script can be executed independently with needful arguments.


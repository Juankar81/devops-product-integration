# Install-Module VstsTaskSdk -AllowClobber
# Import-Module -Name VstsTaskSdk
[CmdletBinding()]
param()

Trace-VstsEnteringInvocation $MyInvocation # in debug


Write-Verbose "Entering script $($MyInvocation.MyCommand.Name)" # in debug


Write-Host "Testing task azure devops"


<# 
# Get a variable
$VariableName = Get-VstsInput -name "VariableName"
$Value = Get-VstsInput -name "Value" -default ""
$IsSecret = Get-VstsInput -name "IsSecret" -default $false -AsBool

# Update BuildNumber
Write-VstsUpdateBuildNumber -value $Value
# Set Variable
Set-VstsTaskVariable -name $VariableName -value $Value -Secret $IsSecret

#>

Write-VstsSetResult -Result "Succeeded" -message "DONE" # in debug

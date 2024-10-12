# Import the Active Directory module
Import-Module ActiveDirectory

# Specify the Distinguished Name (DN) of the OU you want to search in
$OU = "OU=_USERS,DC=mydomain,DC=com"

# Get all active users in the specified OU
$activeUsers = Get-ADUser -Filter {Enabled -eq $true} -SearchBase $OU

# Count the number of active users
$userCount = $activeUsers.Count

# Output the count
Write-Host "Number of active users in the OU '$OU': $userCount"

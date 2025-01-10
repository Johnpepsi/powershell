# Define the group name
$group = "group name"

# Retrieve group members, filter out disabled users, and export the data to a CSV file
Get-ADGroupMember -Identity $group |   
    Where-Object { $_.objectClass -eq 'user' } | # Ensure only user objects are selected
    ForEach-Object { Get-ADUser $_.DistinguishedName -Properties SamAccountName, Enabled, GivenName, SurName } |   
    Where-Object { $_.Enabled -eq $true } | # Exclude disabled accounts
    Select-Object SamAccountName, GivenName, SurName |  
    Export-Csv -Path "C:\members.csv" -NoTypeInformation

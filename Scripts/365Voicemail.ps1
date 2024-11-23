Connect-Exchange

do{
    
    Write-Host `n

    $Extension = Read-Host -Prompt 'Input Extension'
    $FullName = Read-Host -Prompt 'Input Name'
    $Name = "Voicemail $FullName"
    $pass = -join ((48..90) + (97..122) | Get-Random -Count 32 | % {[char]$_})
    $UPN = "$Extension`@brandt.local"
    $PrimSMTP = "$Extension`@brandt.ca"

    #East Locations
    New-Mailbox -Alias $Extension -FirstName Voicemail -LastName “$FullName” -DisplayName "$FullName" -Name $Name -OrganizationalUnit “brandt.local/I.T./Voicemail” -Password (ConvertTo-SecureString -String $Pass -AsPlainText -Force) -UserPrincipalName $UPN -SamAccountName $Extension -PrimarySmtpAddress $PrimSMTP -ResetPasswordOnNextLogon $false -Database D2-MAILDB91_SM02
    #West Locations
    #New-Mailbox -Alias $Extension -FirstName Voicemail -LastName “$FullName” -DisplayName "$FullName" -Name $Name -OrganizationalUnit “brandt.local/I.T./Voicemail” -Password (ConvertTo-SecureString -String $Pass -AsPlainText -Force) -UserPrincipalName $UPN -SamAccountName $Extension -PrimarySmtpAddress $PrimSMTP -ResetPasswordOnNextLogon $false -Database D1-MAILDB91_SM02
    Set-Mailbox -Identity $Extension -HiddenFromAddressListsEnabled $true
    Set-CASMailbox -Identity $Extension -PopEnabled $false -imapenabled $false -mapienabled $false -OWAEnabled $false
    Write-Host `n
    $Continue = Read-Host "Create another? [y/n]"
        try
            {
                $Continue = [System.Convert]::ToBoolean($Continue -replace("yes","TRUE")-replace("y","TRUE")-replace("no","False")-replace("n","False"))
            }catch
            {
                Write-Host "Wrong input. Try again."
                $Continue = Read-Host -Prompt "Is this all the users?"
                $Continue = [System.Convert]::ToBoolean($Continue -replace("yes","TRUE")-replace("y","TRUE")-replace("no","False")-replace("n","False"))
            }
}while ($Continue -ne $False)

Pause
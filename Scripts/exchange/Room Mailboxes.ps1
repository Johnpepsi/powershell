#Set-ExecutionPolicy Unrestricted
$org='//inputorgs'
$cred=Get-Credential $admin@$org
$sessExchange = New-PSSession -ConfigurationName microsoft.exchange -Credential $cred -AllowRedirection -Authentication Kerberos -ConnectionUri "//http" -WarningAction SilentlyContinue
Import-PSSession $sessExchange

$x = 1
$RM = [Collections.Generic.List[Object]](Get-Mailbox -RecipientTypeDetails RoomMailbox |Select @{ Name = "ColumnID" ; Expression={ (([ref]$x).Value++) }}, Name, Alias, CustomAttribute1, ResourceCapacity, GrantSendOnBehalfTo, ID)
$RM | sort Alias |select ColumnID, Alias, Name, CustomAttribute1
$ColID = "blah"
while ($ColID -notlike "exit") {
    $x = 1
    Write-Host "-------------------------------------------"
    $ColID = Read-Host 'Enter ColumnID for more info, Enter to re-list, or exit'
    $index = $RM.FindIndex( {$args[0].ColumnID -eq $ColID} )
    if ($index -eq -1) {
        $x = 1
#        $RM = [Collections.Generic.List[Object]](Get-Mailbox -RecipientTypeDetails RoomMailbox |Select @{ Name = "ColumnID" ; Expression={ (([ref]$x).Value++) }}, Name, Alias, CustomAttribute1, ResourceCapacity, GrantSendOnBehalfTo, ID)
        $RM = [Collections.Generic.List[Object]](Get-Mailbox -RecipientTypeDetails RoomMailbox |Select @{ Name = "ColumnID" ; Expression={ (([ref]$x).Value++) }}, Name, Alias, CustomAttribute1, ResourceCapacity, GrantSendOnBehalfTo, ID)
        $RM | sort Alias |select ColumnID, Alias, Name, CustomAttribute1 |Format-Table
#        $RM | Format-Table |select ColumnID, Alias, Name, CustomAttribute1 
#        Format-Table $RM | sort Alias |select ColumnID, Alias, Name, CustomAttribute1 |Format-Table Alignment="left"
    } else {
        Write-host "-----USER FULL DETAILS-----"
        $Usr = Get-User -Identity $RM[$index].alias |select *
        $Usr |Format-List
        Write-host "-----MAILBOX FULL DETAILS------"
        $RM[$index] |Format-List
        Write-Host "-----SUMMARY-----"
        $RM[$index] |Select Name, Alias, CustomAttribute1, ResourceCapacity, GrantSendOnBehalfTo, ID |Format-List
        $Usr |Select CountryorRegion, StateorProvince, City, Name, Phone, Office, DisplayName |Format-List
        $id = $RM[$index].Alias + ":\calendar"
    	write-host "-----PERMISSIONS-----"
	    Get-MailboxFolderPermission -Identity $id |Select User, AccessRights |Format-List
    }
}

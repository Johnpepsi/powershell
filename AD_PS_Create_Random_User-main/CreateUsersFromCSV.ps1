# Import required modules
Import-Module ActiveDirectory

# Create a new password
$securePassword = ConvertTo-SecureString "Brandt20288!!" -AsPlainText -Force

# Prompt user for CSV file path
$filepath = Read-Host -Prompt "Please enter the path of your CSV file"

# Import the file into a variable
$users = Import-Csv $filepath

# Loop through each row and gather information
ForEach ($user in $users) {
    
    # Gather the user's information
    $fname = $user.'First Name'
    $lname = $user.'Last Name'
    $jtitle = $user.'Job Title'
    $officephones = $user.'Office Phones'
    $emailaddress = $user.'Description'
    $organizationalUnit = $user.'Organizational Unit'

    # Create the new AD user for each user in the CSV file
    New-ADUser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fname.$lname" -Path $organizationalUnit -AccountPassword $securePassword -ChangePasswordAtLogon $True -OfficePhone $officephones -Description $emailaddress -Enabled $True

    # Echo output for each new user
    Write-Output "Account created for $fname $lname in $organizationalUnit"
}
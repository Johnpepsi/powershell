# How to bulk reset password in AD in POWERSHELL:

# Import the Active Directory module
Import-Module ActiveDirectory

# List of usernames and new passwords (replace with your list of usernames and passwords)
$usersPasswords = @{
    "Grace Velasco" = "Brandt2024!!"
    "Mina Receno" = "Brandt2024!!"
    # Add more usernames and passwords as needed
}

# Reset password for each user
foreach ($user in $usersPasswords.Keys) {
    $password = ConvertTo-SecureString -String $usersPasswords[$user] -AsPlainText -Force
    Set-ADAccountPassword -Identity $user -NewPassword $password -Reset
    Write-Host "Password reset for user: $user"
}
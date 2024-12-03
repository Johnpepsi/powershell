New-RemoteMailbox -Name "John Palaganas" -FirstName John -LastName Palaganas -Password (ConvertTo-SecureString -String "Computerbenchod" -AsPlainText -Force) 
-UserPrincipalName john.palaganas@solutions.ca -PrimarySmtpAddress JPalaganas@solutions.ca -OnPremisesOrganizationalUnit "OU LINK here" -ResetPasswordOnNextLogon:$true

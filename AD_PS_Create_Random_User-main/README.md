<h1>Active Directory Create Random User</h1>

 ### [YouTube Demonstration](https://youtu.be/lWZhuyryTHo)

<h2>Description</h2>
Creates a user in Active Directory with a randomly generated username.
<br />


<h2>Languages and Utilities Used</h2>

- <b>PowerShell</b> 
- <b>Oracle Virtual Box</b>
- <b>Active Directory</b> 

<h2>Environments Used </h2>

- <b>Windows Server 2022</b>

<h2>Program walk-through:</h2>
Download the files and run PowerShell ISE as administrator. If you can't run the script type "Set-ExecutionPolicy Unrestricted" and select "yes to all" then run again.
After you've ran the script Active Directory will have a new Orginizational Unit called _USERS with a new user that has a randomly generated name. Running the script again will just create another new user inside _USERS.<br /><br />

<p align="center">
Before: <br/>
<img src="https://i.imgur.com/MgN0OCy.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Creating User with PowerShell:  <br/>
<img src="https://i.imgur.com/JUkmc4Z.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
After:  <br/>
<img src="https://i.imgur.com/QmrCHBd.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
</p>

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>

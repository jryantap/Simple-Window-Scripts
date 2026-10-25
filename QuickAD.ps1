# add membership
Import-Module ActiveDirectory

# Enter user name and exact AD group name
# must be exact
$User = Read-host "Enter user name"
$Group = Read-host "Enter exact AD group name" 

# ==================researching 
# plan:  verify if user exist, verify if AD membership exist, then check if it's the user is already a member
$ADUser = Get-ADUser -Identity $User

# do a try and test here
try {

}
catch {
    
}
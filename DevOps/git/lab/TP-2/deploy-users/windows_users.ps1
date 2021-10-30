# https://4sysops.com/archives/powershell-script-to-create-local-user-accounts-or-local-groups/

[CmdletBinding()]
Param(
    [string[]]$ComputerName = $env:COMPUTERNAME,
 
    [Parameter(Mandatory=$true)]
    [ValidateSet("Group","User")]
    [string]$ObjectType,
 
    [Parameter(Mandatory=$true)]
    [string]$ObjectName
)
 
if($ObjectType -eq "User") {
    $PasswordForUser = Read-Host -Prompt "Enter a password for user account" -AsSecureString
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PasswordForUser)
    $PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) 
}
 
foreach($Computer in $ComputerName) {
   Write-Host "Working on $Computer"
   if(Test-Connection -ComputerName $Computer -count 1 -Quiet) {
        try {
            $CompObject = [ADSI]"WinNT://$Computer"
            $NewObj = $CompObject.Create("$ObjectType",$ObjectName)
            if($ObjectType -eq "User") {
                $NewObj.SetPassword($PlainPassword)
            }
            $NewObj.SetInfo()
            
            Write-Host "$ObjectTYpe with the name $ObjectName created successfully" -ForegroundColor Green
        } catch {
            Write-Warning "Error occurred while creating the group"
            Write-Verbose "More details : $_"
 
        }
   } else {
        Write-Warning "$Computer is not online"
   }
 
}
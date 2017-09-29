param(
$AdminUsername,
$AdminPassword
)

$password = ConvertTo-SecureString $Adminpassword -AsPlainText -Force
$credential = new-object System.Management.Automation.PSCredential($adminUsername, $password)

Invoke-Command -Credential $credential -ComputerName $env:COMPUTERNAME -ArgumentList $PSScriptRoot -ScriptBlock {
  param 
  (
    $workingDir
  )

New-ADOrganizationalUnit -Name test -Path $oupath 'dc=testmdv, dc=nl'
}

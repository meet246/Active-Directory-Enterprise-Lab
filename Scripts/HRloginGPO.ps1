#GPO automation script for HR login message
# 1. Import the Group Policy Module
Import-Module GroupPolicy

# 2. Configuration Variables
$GPOName = "HR Login Message"
$Domain = "corp.local"
$TargetOUDN = "OU=HR,OU=Departments,DC=corp,DC=local"

# 3. Create the GPO (if it doesn't already exist)
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    $NewGPO = New-GPO -Name $GPOName -Comment "Automated security banner for HR workstations."
    Write-Host "Created blank GPO: $GPOName" -ForegroundColor Green
} else {
    $NewGPO = Get-GPO -Name $GPOName
    Write-Host "GPO '$GPOName' already exists. Modifying existing object." -ForegroundColor Yellow
}

# 4. Configure the Interactive Logon Policies (Registry Keys)
# In Group Policy, Local Security Options are mapped directly to registry paths.

$RegistryPath = "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System"

# Set the Message Title: "HR Notice"
Set-GPRegistryValue -Name $GPOName `
                    -Key $RegistryPath `
                    -ValueName "LegalNoticeCaption" `
                    -Type String `
                    -Value "HR Notice"
Write-Host "Configured GPO Setting: Message Title -> 'HR Notice'" -ForegroundColor Cyan

# Set the Message Text: "This system is for HR use only."
Set-GPRegistryValue -Name $GPOName `
                    -Key $RegistryPath `
                    -ValueName "LegalNoticeText" `
                    -Type String `
                    -Value "This system is for HR use only."
Write-Host "Configured GPO Setting: Message Text -> 'This system is for HR use only.'" -ForegroundColor Cyan

# 5. Link the GPO to the target HR Organizational Unit
# Check if the link already exists to prevent duplicate link errors
$OU = Get-ADOrganizationalUnit -Identity $TargetOUDN
$CurrentLinks = (Get-GPInheritance -Target $TargetOUDN).GpoLinks

if ($GPOName -notin ($CurrentLinks | Select-Object -ExpandProperty DisplayName)) {
    New-GPLink -Name $GPOName -Target $TargetOUDN -LinkEnabled Yes
    Write-Host "Successfully linked '$GPOName' to the HR OU!" -ForegroundColor Green
} else {
    Write-Host "GPO is already linked to the HR OU." -ForegroundColor DarkGray
}

# 1. Configuration Variables
$CSVPath = "C:\LabFiles\NewHires.csv"
$DomainDN = "DC=corp,DC=local"
$MainOUName = "Departments"
$MainOUDN = "OU=$MainOUName,$DomainDN"

# 2. Ensure the Main 'Departments' OU Exists
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$MainOUName'")) {
    New-ADOrganizationalUnit -Name $MainOUName -Path $DomainDN -ProtectedFromAccidentalDeletion $true
    Write-Host "Created Main OU: $MainOUName" -ForegroundColor Green
}

# 3. Import Users from CSV and Process Pipeline
$NewHires = Import-Csv -Path $CSVPath
$DefaultPassword = ConvertTo-SecureString "Password123!" -AsPlainText -Force

foreach ($User in $NewHires) {
    $SubOUName = $User.Department
    $TargetSubOUDN = "OU=$SubOUName,$MainOUDN"
    $GroupName = $User.SecurityGroup

    # DYNAMIC OU CREATION: Verify department sub-OU exists
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$SubOUName' -and DistinguishedName -like '*$MainOUDN'")) {
        New-ADOrganizationalUnit -Name $SubOUName -Path $MainOUDN -ProtectedFromAccidentalDeletion $true
        Write-Host "Created Missing Sub-OU: $SubOUName" -ForegroundColor Green
    }

    # DYNAMIC SECURITY GROUP CREATION: Verify the group exists inside that specific sub-OU
    if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'")) {
        New-ADGroup -Name $GroupName `
                    -GroupScope Global `
                    -GroupCategory Security `
                    -Path $TargetSubOUDN
        Write-Host "Created Security Group: $GroupName inside $SubOUName OU" -ForegroundColor Yellow
    }

    # Construct UPN (User Principal Name)
    $UPN = "$($User.Username)@corp.local"

    # DYNAMIC USER PROVISIONING: Verify user doesn't already exist
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($User.Username)'")) {
        New-ADUser -Name "$($User.FirstName) $($User.LastName)" `
                   -SamAccountName $User.Username `
                   -UserPrincipalName $UPN `
                   -GivenName $User.FirstName `
                   -Surname $User.LastName `
                   -Path $TargetSubOUDN `
                   -AccountPassword $DefaultPassword `
                   -Enabled $true `
                   -ChangePasswordAtLogon $true
        
        Write-Host "Successfully provisioned user: $($User.Username)" -ForegroundColor Cyan
    }

    # AUTOMATED GROUP ALIGNMENT: Add the user to the designated security group
    # Check if the user is already a member first to prevent console warnings
    $GroupMembers = Get-ADGroupMember -Identity $GroupName | Select-Object -ExpandProperty SamAccountName
    if ($GroupMembers -notcontains $User.Username) {
        Add-ADGroupMember -Identity $GroupName -Members $User.Username
        Write-Host "Added $($User.Username) to Security Group: $GroupName" -ForegroundColor Magenta
    } else {
        Write-Host "$($User.Username) is already a member of $GroupName." -ForegroundColor DarkGray
    }
    Write-Host "---"
}    }

    # DYNAMIC SECURITY GROUP CREATION: Verify the group exists inside that specific sub-OU
    if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'")) {
        New-ADGroup -Name $GroupName `
                    -GroupScope Global `
                    -GroupCategory Security `
                    -Path $TargetSubOUDN
        Write-Host "Created Security Group: $GroupName inside $SubOUName OU" -ForegroundColor Yellow
    }

    # Construct UPN (User Principal Name)
    $UPN = "$($User.Username)@corp.local"

    # DYNAMIC USER PROVISIONING: Verify user doesn't already exist
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($User.Username)'")) {
        New-ADUser -Name "$($User.FirstName) $($User.LastName)" `
                   -SamAccountName $User.Username `
                   -UserPrincipalName $UPN `
                   -GivenName $User.FirstName `
                   -Surname $User.LastName `
                   -Path $TargetSubOUDN `
                   -AccountPassword $DefaultPassword `
                   -Enabled $true `
                   -ChangePasswordAtLogon $true
        
        Write-Host "Successfully provisioned user: $($User.Username)" -ForegroundColor Cyan
    }

    # AUTOMATED GROUP ALIGNMENT: Add the user to the designated security group
    # Check if the user is already a member first to prevent console warnings
    $GroupMembers = Get-ADGroupMember -Identity $GroupName | Select-Object -ExpandProperty SamAccountName
    if ($GroupMembers -notcontains $User.Username) {
        Add-ADGroupMember -Identity $GroupName -Members $User.Username
        Write-Host "Added $($User.Username) to Security Group: $GroupName" -ForegroundColor Magenta
    } else {
        Write-Host "$($User.Username) is already a member of $GroupName." -ForegroundColor DarkGray
    }
    Write-Host "---"
}

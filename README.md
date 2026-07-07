# Enterprise Active Directory Home Lab

A Windows Server Active Directory lab simulating an enterprise identity and access management environment. This project demonstrates Active Directory administration, PowerShell automation, Group Policy management, and Windows security hardening.

---

## Technologies

- Windows Server 2022
- Windows 11
- Active Directory Domain Services
- DNS
- DHCP
- Group Policy
- PowerShell
- VMware Workstation

---

## Project Objectives

- Deploy an enterprise Active Directory environment
- Automate user provisioning using PowerShell
- Configure Organizational Units
- Deploy security groups
- Manage Group Policy Objects
- Harden Windows against common attacks
- Configure auditing for security monitoring

---

## Architecture

```
                  Internet
                      │
              Windows Server 2022
      ┌────────────────────────────────┐
      │ Active Directory               │
      │ DNS                            │
      │ DHCP                           │
      │ Group Policy                   │
      │ PowerShell Automation          │
      └────────────────────────────────┘
                      │
          Windows 11 Domain Client
```

---

## Features

## Active Directory Administration

- Installed Active Directory Domain Services
- Promoted Windows Server to Domain Controller
- Configured DNS
- Configured DHCP
- Joined Windows client to the domain
- Created Organizational Units
- Created Security Groups
- Managed user accounts

---

### Identity & Access Management

- Active Directory Domain Services
- Organizational Units
- Security Groups
- Domain User Accounts
- User Authentication
- Least Privilege

---

### PowerShell Automation

Automated:

- OU Creation
- Security Group Creation
- User Provisioning
- CSV Import
- Group Membership Assignment

Example:

```powershell
Import-Csv NewHires.csv
New-ADUser
New-ADGroup
Add-ADGroupMember
```

---

### Group Policy

Configured:

- Login Banner
- Organizational Unit GPOs
- Security Policies
- Firewall Policies
- Audit Policies

---

### Security Hardening

Implemented:

- Disabled LLMNR
- Disabled NetBIOS
- Enabled Windows Firewall Logging
- Advanced Audit Policies
- Kerberos Auditing
- Logon Auditing
- Process Creation Auditing

---

## Screenshots


### Active Directory Users and Computers

![AD](/Images/AD-Users.png)

---

### Organizational Units

![OU](/Images/OU-PS.png)

---

### Group Policy

![GPO](/Images/HR-GPO.png)
![GPO2](Images/HR-GPO-2.png)

---

### Login Banner

![Banner](/Images/HR-GPO-test.png)

---

### Firewall Logging

![Firewall](/Images/firewall-logging.png)

---

### audit policies

![Logon](/Images/audit-logon.png)
![Logoff](/Images/audit-logoff.png)
![Kerberos](/Images/audit-kerberos.png)
![Process Creation](/Images/audit-process-creation.png)

---

## Validation

Verified configuration using:

```cmd
gpupdate /force
gpresult /r
```

Confirmed:

- GPO deployment
- User authentication
- Group memberships
- Domain connectivity
- Firewall logging

---

## Skills Demonstrated

- Active Directory
- Windows Server Administration
- PowerShell
- Identity and Access Management
- RBAC
- Group Policy
- Windows Security
- DNS
- DHCP
- Windows Firewall
- Enterprise Administration
- Security Hardening

---

# Environment Setup

## Objective

Create an enterprise Windows domain environment for practicing Active Directory administration, identity and access management, and Windows security.

---

## Software

- VMware Workstation
- Windows Server 2022
- Windows 11
- PowerShell 5.1

---

## Virtual Machines

| Machine | Role |
|---------|------|
| DC01 | Domain Controller |
| CLIENT01 | Windows Client |

---

## Installed Server Roles

- Active Directory Domain Services (AD DS)
- DNS Server
- DHCP Server
- Group Policy Management

---

## Network Configuration

The domain controller provides:

- DNS
- DHCP
- Authentication
- Group Policy
- Identity Management

Windows 11 was joined to the **corp.local** domain.

---

## Screenshots

![AD config](Images/AD config.png)

![Client Config](Images/client config.png)

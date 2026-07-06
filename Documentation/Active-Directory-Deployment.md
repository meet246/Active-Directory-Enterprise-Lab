# Active Directory Deployment

## Overview

The Active Directory environment was organized using Organizational Units (OUs) to simulate an enterprise structure.

---

## Organizational Units

Created:

- Departments
    - HR
    - IT Support

---

## Security Groups

Each department contains dedicated security groups used for Role-Based Access Control (RBAC).

Examples:

- Managers
- HelpDesk

---

## User Accounts

User accounts were provisioned from a CSV file using PowerShell automation.

Example CSV

```csv
FirstName,LastName,Username,Department,SecurityGroup
John,Smith,jsmith,HR,Managers
Jane,Doe,jdoe,ITSupport,HelpDesk
```

![OU](./Images/ou-ps.png)

---

The automation script performs the following tasks:

- Creates Organizational Units
- Creates Security Groups
- Imports users from CSV
- Creates Active Directory users
- Assigns users to security groups
- Prevents duplicate objects

![AD](./Images/AD Users.png)

---

## Skills Demonstrated

- Active Directory Users and Computers
- Organizational Units
- Security Groups
- RBAC
- Least Privilege

---

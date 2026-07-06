# Group Policy Management

## Overview

Group Policy Objects (GPOs) were used to centrally manage Windows security settings.

---

## Configured Policies

### Login Banner

Created an HR login message using PowerShell.

![HR GPO](./Images/HR GPO.png)

---

### Organizational Unit Linking

The GPO was linked directly to the HR Organizational Unit.

![HR GPO Link](./Images/HR GPO 2.png)

---

![HR GPO Test](./Images/HR GPO test.png)

### Registry Configuration

Configured:

- LegalNoticeCaption
- LegalNoticeText

---

## Validation

```cmd
gpupdate /force

gpresult /r
```

---

## Skills Demonstrated

- Group Policy Management
- Registry Configuration
- OU Linking
- PowerShell Automation

---
# Windows Security Hardening

## Objective

Reduce attack surface and improve security monitoring using Group Policy and Windows security features.

---

# Security Controls

## Disable LLMNR

Mitigates credential poisoning attacks by preventing multicast name resolution.

![LLMNR](/Images/disable-llmnr.png)

---

## Disable NetBIOS

Reduces legacy network attack vectors.

![NetBIOS](/Images/disable-netbios.png)

---

## Windows Firewall

Configured:

- Domain Profile
- Private Profile
- Public Profile

Enabled:

- Firewall Logging
- Dropped Packet Logging

![Firewall Logging](/Images/firewall-logging.png)

---

## Advanced Audit Policies

Enabled auditing for:

- Logon
- Logoff
- Kerberos Authentication
- Process Creation
- Authentication Policy Changes
- Firewall Events

![Logon](/Images/audit-logon.png)
![Logoff](/Images/audit-logoff.png)
![Kerberos](/Images/audit-kerberos.png)
![Process Creation](/Images/audit-process-creation.png)
![Authentication Policy](/Images/authentication-policy-change.png)

---

## Security Benefits

- Increased visibility
- Better incident response
- Authentication monitoring
- Credential attack mitigation

![Event Viewer](/Images/event-viewer.png)

---

## Skills Demonstrated

- Windows Security
- Group Policy
- Firewall Administration
- Security Hardening
- Audit Policies

---

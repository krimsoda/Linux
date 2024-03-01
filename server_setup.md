# Server Setup

### :helicopter: System
- Update & Upgrade
```
dnf update -y && dnf upgrade -y
```
### :helicopter: Network
- Configure static IP (ip address, default gateway, DNS) Change the addressing from DHCP to static
```
nmcli con mod enps03 ipv4.addresses 192.168.2.20/24 ipv4.gateway 192.168.2.1 ipv4.dns “8.8.8.8”
```
```
nmcli con mod enps03 ipv4.method manual
```
```
nmcli con up enps03
```

- Hostname & FQDN
### :helicopter: FirewallD
- Configure FirewallD (allow port & service)
### :helicopter: SSH
- Configure & secure
### :helicopter: User
- add multiple users & sudo group
### :helicopter: File/Directory Permissions/Access
### :helicopter: Logging
- Configure syslog | rsyslog
- Configure Logrotate
### :helicopter: AuditD
- Configure AuditD
### :helicopter: SELinux
- Configure SELinux
### :helicopter: Hardening
- Configure baseline hardening
- Disable Unnecessary Services & Port
- File permission
### :helicopter: Vulnerability Scanning
- Scan and Patch


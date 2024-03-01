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
```
hostnamectl set-hostname server1.example.com
```
### :helicopter: FirewallD
- Configure FirewallD (allow port & service)
```
systemctl status firewalld
```
### :helicopter: SSH
- Configure & secure
```
systemctl status sshd
```
### :helicopter: User
- add multiple users & sudo group
```
getent passwd
```
```
getent shadow
```
```
getent group
```
### :helicopter: File/Directory Permissions/Access
### :helicopter: Scheduler
- Cron
```
systemctl status crond.service
```
- Systemd Timer
- AT
### :helicopter: Logging
- Configure syslog | rsyslog
```
systemctl status rsyslog
```
- Configure Logrotate
### :helicopter: AuditD
- Configure AuditD
```
systemctl status auditd
```
### :helicopter: SELinux
- Configure SELinux
### :helicopter: Hardening
- Configure baseline hardening
- Disable Unnecessary Services & Port
- File permission
### :helicopter: Vulnerability Scanning
- Scan and Patch



![Tux_Classic_flat_look_v1 1 svg](https://github.com/krimsoda/Linux-Notes/assets/160830222/54b23f2e-99c3-45d3-81a7-e90c6d724f95)


## Linux # System # Management # Configuration # Security # 

### :helicopter:Some basic Linux Commands are:
- reboot | poweroff
- su - | sudo | sudo su
- Navigation : cd | pwd | mv -i | cp -i | rm -i | mkdir -i  | rmdir -i | ln
- ls | cat | grep | sort | uniq | xargs | wc | head | tail | more | less | find | tac
- awk | sed | touch | echo
- cmp | comm
- User Management : id | who | whoami | useradd | usermod | userdel | passwd | groups | chage | chmod | chown | stat
- Process Management : ps | jobs | bg | lsof | kill | killall | systemctl
- Disk Management : fdisk | parted | blkid | lsblk | lsusb | mount | findmnt
- du | df | free 
- top | htop | iostat | vmstat | netstat | mpstat
- systemctl --failed | systemd-analyze
- Network Management : nmcli | ip | ifconfig |  nmtui | ping | dhclient | ss | traceroute | tracepath | nslookup | dig | route |  mtr | arp | tcpdump | netstat | ssh | telnet
- hostname | hostnamectl | uname | env | 
- scp | curl | wget | nc
- dos2unix | unix2dos
- Package Management: rpm | yum | dnf
- dmidecode | lscpu | lspci
- history
- date | time
- tar | gzip
- vi | vim | nano
- Absolute and Relative Path (/)
  - ~
  - . and ..
- ./ (to execute command) | sh
- Advanced Linux Commands
  - Find & exec & xargs 

### :helicopter:User & Group Management
notes
- su	 #Switching users	
- sudo	 #Executing commands as another user. Group = [wheel | sudo]
- sudo su
- newgrp	#Switching user groups
- Users Management
  - Creating Users | Modifying User Accounts (Add | Remove user from group) | Reset Users (Default Setting) |  Deleting Users
  - Locking and Unlocking User Accounts | Expiring User Accounts | User Password Management | Changing User Shell | Viewing User Information | Permission & Access Control Lists (ACLs) | Managing User Quotas | User Account Policies
- Group Management
  - Creating Groups | Modifying Groups Accounts (Add | Remove user from group) | Deleting Groups

 :arrow_right:[user](note_user_management.md)

Script:

  :arrow_right:[user add bulk](sc_user_add.sh)

  :arrow_right:[user setpasswd bulk](sc_user_setpasword.sh)

  :arrow_right:[user_addgroup bulk_sudo](sc_user_addgroup_sudo.sh)

 ### :helicopter: File & Folder | Permission

Notes

:arrow_right:[file & folder permission](note_file_folder_permission.txt)

### :helicopter: System Hardware & Device 
- *check OS version* #cat /etc/*release  
- *check the kernel version* #uname -a
- #hostnamectl
- *kernel parameters* cat /proc/cmdline

Notes

:arrow_right:[system hardware ]
 ### :helicopter: Performance
Notes
- CPU
- Memory
- Disk I/O
- Network
- Process
- System Performance
- File System and Disk
- Kernel and System Tracing
- Performance Profiling
- Benchmarking


### :helicopter: SystemD (Service & Process)
 
 Notes

 :arrow_right:[SystemD](https://systemd.io/) - Website

 :arrow_right:[Service | Ports | Process](note_services_process.txt) 

 ### :helicopter: Network
 
 Notes
 
 :arrow_right: [Network](note_network.txt)

 
 ### :helicopter: FirewallD
 
 Notes
 
 :arrow_right: [FirewallD](note_firewalld.txt)

 ### :helicopter: Schedule - Cron

Notes

 ### :helicopter: Linux Logs

 Notes

:arrow_right: [log](note_log.md)

- Keywords
  - Date & Time
  - Activity
  - Errors, warnings, and critical alerts
  - Service and application failures
  - Security-related incidents (failed logins, suspicious user activity)
  - Performance bottlenecks or memory/disk-related problems
  - Unusual network activity (e.g., port scans, blocked IPs)
  - Hardware malfunctions (disk, CPU, RAM)

 - Parsing Log Files
    - Tools for Parsing Logs;  There are several command-line tools and programming languages that can help with log parsing:
      - grep: For searching text in logs.
      - awk: For pattern scanning and processing.
      - sed: For stream editing and transformations.
      - cut: For extracting specific fields.
      - logwatch: For summarizing log file information.
      - Python with libraries like pandas, json, and re: For advanced parsing.
      - Regex (Regular Expressions)

 ### :helicopter: Vi
 
 Notes
 
 :arrow_right: [Vi](note_Vi_Editor.txt)

 ### :helicopter: Port Number
 
 Notes
 
 :arrow_right: [Ports Number](note_ports_number.txt)


 ### :helicopter: Troubleshooting
 Method
 
 - Recent Change (Narrow Down the Issue)
 - Symptom | Error Massage
 - Log File (Error Pattern | Timing) - Parsing Log Files
 - Configuration Validation
 - Dump file
 - Compare / Replicate / Simulate a problem with a working system that running the same distribution and version
 - Check to see whether the problem is reproducible
 - Common troubleshooting
 - Symptom, Diagnosis, Solution
 - Document findings, actions, and outcomes


 Notes

:arrow_right:[notes](note_troubleshooting.md)

 ### :helicopter: Productivity
 - bash-completion
 ### :helicopter: RHEL
 -  Subscription
 -  Insights
 -  Satellite
 -  Ansible
 
 ### :helicopter: HomeLab
 Linux
- Linux load balancing
    - network interface card (NIC) bonding
    - services to HTTP and TCP-based services
- Integrating Linux user authentication with Windows Active Directory (AD) using the System Security Services Daemon (SSSD)
- [SLURM (Simple Linux Utility for Resource Management)](HomeLab/homelab-SLURM.md)
- Configure NFS Shares
- [Basic Web Server - Apache](HomeLab/homelab-webserver.md)


### :helicopter: References
  - https://www.certdepot.net
  - https://www.tecmint.com
  - https://www.geeksforgeeks.org
  - https://www.javatpoint.com
  - https://linuxjourney.com
  - https://www.open-scap.org/
  - https://www.cisecurity.org/cis-benchmarks
  - https://www.cyberciti.biz/
  - https://killercoda.com
  - https://linuxsecurity.com/
  - https://firecracker-microvm.github.io/
  - https://www.redhat.com/en/interactive-labs


 ### :helicopter: Linux Security
 - Industry Standard (General)
   - CIS Benchmark (Center for Internet Security)
   - STIG Standard (Security Technical Implementation Guide)
     -  Federal Information Processing Standard (FIPS)
     -  SELinux
 -  Hardening (Securing systems by applying configurations, controls, and best practices that minimize potential vulnerabilities)
 - Vulnerability Scanning and Patching
    - Security Technical Implementation Guides (STIGs) Viewer
    - Security Content Automation Protocol (SCAP) Compliance Checker
 - Baseline, Guide and Best Practice
 - Risk Compliance
 - Authentication: Identity and access management (IAM) & Privileged Access Management (PAM)
   - Centralized Authentication (LDAP, Active Directory)
   - Decentralized Authentication (local user accounts)
 - Linux Audit Framework
   - AuditD 

 ### :helicopter: Socratic Linux Administration
  :arrow_right: [Socratic Linux Administration](Socratic_Linux_Administration.md)

 ### :helicopter: RHCSA
  :arrow_right: [RHCSA](RHCSA.md)
  

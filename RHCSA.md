# RHCSA
### Reset Root Password
- GRUB menu PRESS e
- Navigate to a line starts with 'linux' and press CTRL + e (end of line /swap)
- add init=/bin/bash
- PRESS CTRL + x
  - grep "/" /proc/mounts --> to check ro (look at /)
- mount -o remount,rw / --> to change ro to rw
  - grep "/" /proc/mounts --> to recheck ro change to rw
  - echo $PATH
  - /sbin/getenforce --> check SELinux disable
- ls -lZ /etc/shadow --> CRITICAL to refer "system_u:object_r:shadow_t:s0" before set root password
- passwd (to set a root passwd)
- chcon system_u:object_r:shadow_t:s0 /etc/shadow --> to Change Context shadow file as before
  - ls -lZ /etc/shadow --> to recheck
- exec /sbin/init --> to reboot the system!

---
## Resources
Book
- RHCSA Red Hat Enterprise Linux 9: Training and Exam Preparation Guide (EX200), Third Edition by Ghori, Asghar
- Red Hat Rhcsa 9 Cert Guide: Ex200 By Van Vugt, Sander

Video
- RHCSA® RHEL 9 Complete Video Course By Van Vugt, Sander

Youtube
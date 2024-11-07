# Syslog

```Package: rsyslog
Service: syslog | rsyslog | /sbin/rsyslogd
Port:  514
Config file: /etc/syslog.conf | /etc/rsyslog.conf | etc/rsyslog.d/   #rsyslog/syslog-ng
Config file: /etc/logrotate.conf |  /etc/logrotate.d/ | /etc/logrotate.d/rsyslog #logrotate
Log File: /var/log

```
```
rsyslogd -v
```
```
Troubleshooting:
ss -antpl | grep 514 or ss -4 altunp | grep 514  #port test
rsyslogd -f /etc/rsyslog.conf -N1  #Run a configuration check
logger "I just logged a message"  #logging test
logger -p daemon.error "This is a logging error test"  #logging test
logger -t logtester -p daemon.error "This is a logging error test"  #logging test
```
================================================================================
```
Linux generates various types of logs, including:

-System logs (e.g., /var/log/syslog or /var/log/messages): These capture system-wide events like hardware failures or kernel events.
-Authentication logs (e.g., /var/log/auth.log): These track user authentication activities, such as login attempts and sudo commands.
-Boot logs (e.g., /var/log/boot.log): These contain information about the system’s boot process.
-Application logs (e.g., /var/log/apache2/ or /var/log/nginx/): These store logs for specific applications or services, like web servers.
-Kernel logs (e.g., /var/log/kern.log): These log messages from the Linux kernel, typically related to hardware and driver issues.
-Error logs (e.g., /var/log/error.log): Logs generated by programs or services to report errors.
```
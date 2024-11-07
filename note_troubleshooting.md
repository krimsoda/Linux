# Troubleshooting Methodology
  - Identify the problem and it’s symptoms
  - Establish a theory of probably cause
  - Test your theory to determine the cause
  - Establish a plan for resolving the problem
  - Implement the solution or escalate the problem
  - Verify functionality and implement preventative measures
  - Document findings, actions, and outcomes

#=====================================

Issue: Unpingable IP

Possibly Caused :
- NIC issue
- ICMP port block
- Firewall block
- DNS server (local is down)
- DHCP  (local is down)
- VPN
- Network Issue / Diffrent segmentation
- Check the IP (Virtual IP | Origin IP) 

Solution:
- Check IP Address
- ping to destitation IP using IP Address and FQDN
- Ping to DNS server and DHCP Server
- Traceroute / Tracert to destitation IP
- Check the icmp port

=====================================

- user
- file folder permission
  -check current permission *ls -lrt
- performance
  - cpu
  - memory
- network
- logs
	-event viewer
-Security
  -ports
  -process
-Rebuild system

Networking
-check the ip address (origin ip | virtual ip | teaming & bonding)
-Ping machine using ip address & FQDN
-Ping defaut router & gateway
-Ping dns server (nslookup | dig)
-ping dhcp server
-traceroute | tracert
-check and renew connection / Adapter | flush DNS
-check firewall allowing ping protocol
-Traffic analyzer (tcpdump | wireshark | tshark)
  *DNS

CyberArk
-AD (User Status)
-CyberArk console (User status) in Vault
-Password reconsile

HTTP Error
-Server side
-Client side

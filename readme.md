# Mikrotik configuration via Ansible

Cli tool for setup default configs for router  

Features:
* Reset to default
* GoogleDNS
* OpenDNS with agent script
* DMZ (Forward all external connection to target internal ip)
* ~~Dual WAN with load balancing~~
* Setup AD Block hosts file from http://someonewhocares.org/ 
* Enable DNS record for each DHCP lease 

Screenshot:
```
Available action: 
[0] Reset configuration 
[1] Enable GoogleDNS 
[2] Enable OpenDNS 
[3] Enable DMZ 
[4] Enable Dual WAN 
[5] Setup AD hosts file from http://someonewhocares.org/ 
[6] Enable DNS record for each DHCP lease 
Choose what you want to do:
_
```

*note: dual wan currently not implemented*


## Usage

```
/bin/bash run.sh
```

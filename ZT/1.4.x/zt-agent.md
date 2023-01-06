# This script for ZeroTier Node (Agent)
#### This was Tested with VyOS 1.4.x

## Requirements
INSTALL Docker on VyOS First! [Docker install on VyOS 1.4.1](docker/vyos-docker-install.md)

## Switch to root user and run the commands below.
```
# sudo su - 
```

### Create a new file in the /config folder and copy-paste this script (Re-run it after each VyOS update)
[vyos-docker-zt-agent.sh](vyos-docker-zt-agent.sh)
* Change the ZT Network ID to your own  `ZT_NETWORK_ID="YOUR_NETWORK_ID"`
```
# vi /config/vyos-docker-zt-agent.sh
# chmod +x /config/vyos-docker-zt-agent.sh
# /config/vyos-docker-zt-agent.sh
```

### Download the script and run (Re-run it after each VyOS update)
```
[vyos-docker-zt-agent.sh](vyos-docker-zt-agent.sh)
* Change the ZT Network ID to your own  `ZT_NETWORK_ID="YOUR_NETWORK_ID"`
```
# curl -OL https://raw.githubusercontent.com/tosin2013/VyOS/main/ZT/1.4.x/vyos-docker-zt-agent.sh
# mv vyos-docker-zt-agent.sh /config/vyos-docker-zt-agent.sh
# vi /config/vyos-docker-zt-agent.sh
# chmod +x /config/vyos-docker-zt-agent.sh
# /config/vyos-docker-zt-agent.sh
```


# This script for ZeroTier Controller + UI
#### This was Tested with VyOS 1.4.x

## Requirements
INSTALL Docker on VyOS First! [Docker install on VyOS 1.4.1](../../docker/vyos-docker-install.md)

## Switch to root user and run the commands below.
```
# sudo su - 
```

## Create a new file in the /config folder and copy-paste this script (Re-run it after each VyOS update)
Link: [vyos-docker-zt-controller-ui.sh](vyos-docker-zt-controller-ui.sh)
```
# vi /config/vyos-docker-zt-controller-ui.sh
# chmod +x /config/vyos-docker-zt-controller-ui.sh
# /config/vyos-docker-zt-controller-ui.sh
```

## You may also install using the following command:
```
# sudo su - 
# curl -OL https://raw.githubusercontent.com/tosin2013/VyOS/main/docker/vyos-docker-zt-controller-ui.sh
# mv vyos-docker-zt-controller-ui.sh /config/vyos-docker-zt-controller-ui.sh
# chmod +x /config/vyos-docker-zt-controller-ui.sh
# /config/vyos-docker-zt-controller-ui.sh
```
**Default credentials for UI:**
* login: admin
* password: zero-ui
* url: http://127.0.0.1:4000 (or your VyOS IP)

Details at https://github.com/dec0dOS/zero-ui


![20230106180124](https://i.imgur.com/Oi6YCN7.png)
# Docker install on VyOS 1.4.1
### This was tested with VyOS 1.4.1

## On VyOS manually run these few commands:
```
sudo su
```

## Create a new file and copy-paste this script (Re-run it after each VyOS update)
Link: [vyos-docker-install.sh](vyos-docker-install.sh)
```
# vi /config/vyos-docker-install.sh
# chmod +x /config/vyos-docker-install.sh
# /config/vyos-docker-install.sh
```

## You may also install using the following command:
```
# curl -OL 
# chmod +x /config/vyos-docker-install.sh
# /config/vyos-docker-install.sh
```
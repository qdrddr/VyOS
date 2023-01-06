#!/bin/bash 
#Prepare Space for ZT Container
NETWORK_ID=CHANGEME
mkdir -p /config/user-data/docker/zt/agent
cd /config/user-data/docker/zt/agent

#Create ZT Agent run file
cat <<'EOF' | sudo tee ./docker-run.sh
#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

./docker-stop.sh

docker run -d \
    --name zerotier-one \
    --net host \
    --volume $DIR/data:/var/lib/zerotier-one \
    --restart always \
    --device=/dev/net/tun \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_ADMIN \
    zyclonite/zerotier
    
#We are using this docker https://github.com/zyclonite/zerotier-docker
docker ps -a
docker exec zerotier-one zerotier-cli info
echo "Now to join a ZT network run "
echo "docker exec zerotier-one zerotier-cli join 8056c2e21c000001"
echo "then go to your network and authorize your new node"
echo "and then run ifconfig to find your new IP"
echo "ifconfig -a"
#docker pull zyclonite/zerotier
#docker pull zerotier/zerotier
EOF

#Create ZT Agent stop file
cat <<'EOF' | sudo tee ./docker-stop.sh
#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker stop zerotier-one
docker rm zerotier-one
EOF

#Make scripts Executiable
chmod a+x *.sh

#Start Agent first time run twice
docker pull zyclonite/zerotier
docker pull zerotier/zerotier
#docker pull keynetworks/ztncui
./docker-run.sh

docker exec zerotier-one zerotier-cli info
echo "Now to join a ZT network run next command:"
echo "docker exec zerotier-one zerotier-cli join ${NETWORK_ID}"
echo "then go to your network and authorize your new node"
echo "and then run ifconfig to find your new IP"
echo "ifconfig -a"
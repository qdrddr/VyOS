#!/bin/bash
#Prepare Space for ZT Controller Container
mkdir -p /config/user-data/docker/zt/controller/data
cd /config/user-data/docker/zt/controller

#create docker run script for controller

cat <<'EOF' | sudo tee ./docker-run.sh
#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

./docker-stop.sh

docker run -d \
    --name zerotier_controller \
    --net host \
    --volume $DIR/data:/var/lib/zerotier-one \
    --restart always \
    zerotier/zerotier

docker ps -a
EOF

#create docker stop script for controller
cat <<'EOF' | sudo tee ./docker-stop.sh
#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker stop zerotier_controller
docker rm zerotier_controller
EOF


#Create config file for Controller API to work (needed for UI)
cat <<'EOF' | sudo tee ./data/local.conf
{
        "settings": {
                "primaryPort": 9994
        }
}
EOF
#Start Controller

docker pull zerotier/zerotier
#docker pull keynetworks/ztncui

#make scripts executiable
chmod a+x *.sh

./docker-run.sh

#Prepare Space for ZT UI Container
mkdir -p /config/user-data/docker/zt/ui
cd /config/user-data/docker/zt/ui

#create docker run script for UI
cat <<'EOF' | sudo tee ./docker-run.sh
#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

./docker-stop.sh

docker run -d \
        --restart always \
        --name zero-ui \
        --net host \
        -v $DIR/../controller/data:/var/lib/zerotier-one \
        -v $DIR/data:/app/backend/data \
        -e ZU_CONTROLLER_ENDPOINT=http://127.0.0.1:9994/ \
        -e ZU_SECURE_HEADERS=false \
        -e ZU_DEFAULT_USERNAME=admin \
        -e ZU_DEFAULT_PASSWORD=zero-ui \
        dec0dos/zero-ui:latest

docker ps -a
EOF

#create docker stop script for UI
cat <<'EOF' | sudo tee ./docker-stop.sh
#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker stop zero-ui
docker rm zero-ui
EOF

chmod a+x *.sh
#Start UI
./docker-run.sh

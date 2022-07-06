Simple DNS server running as a container on VyOS based on jpillora/dnsmasq docker container<br>
Before you start make sure VyOS has DNS pointed to internet and working <br>
in VyOS configure mode first run:</br>
del system name-server</br>
set system name-server '1.1.1.1'</br>
set system name-server '8.8.8.8'</br>
commit</br>

Install [docker on VyOS](https://github.com/qdrddr/VyOS/blob/main/docker) First</br>

Then</br>
vi /config/vyos-docker-simpledns.sh</br>
copy & paste content of this file </br>
make executiable this file</br>
sudo chmod a+x *.sh</br>

run the docker script with siple DNS server</br>
/config/vyos-docker-simpledns.sh</br>

Change our VyOS DNS to the docker</br>
in VyOS configure mode:</br>
del system name-server</br>
set system name-server '127.0.0.1'</br>
commit</br>
save</br>

modify /config/user-data/docker/dns/data/dnsmasq.conf add something like:</br>
echo "address=/test.company/127.0.0.1" >> /config/user-data/docker/dns/data/dnsmasq.conf</br>
/config/user-data/docker/dns/docker-run.sh


# This is a repository to run ZeroTier Agent or Controller on VyOS router
# You can run only Agent or only Controller; 
# You can run both. But! I guess its not a good idea to attach an agent to the controller that runs on the save VyOS, because if your controller stops working you'll not be able to connect to your agent and that's like shooting into your own foot. FYI.

# To make it work first install docker container app on VyOS https://github.com/qdrddr/VyOS/blob/main/vyos-docker-install.script
# Then install either controller or agent containers on your VyOS

Controller
https://github.com/qdrddr/VyOS/blob/main/zt-controller.script

Agent
https://github.com/qdrddr/VyOS/blob/main/zt-agent.script

# After each VyOS update you must re-run these scripts

# This is a repository to run ZeroTier Agent or Controller on VyOS router
# You can run only Agent or only Controller; 
# You can run both. But! I guess its not a good idea to attach an agent to the controller that runs on the save VyOS, because if your controller stops working you'll not be able to connect to your agent and that's like shooting into your own foot. FYI.

# To make it work first install docker container app on VyOS https://github.com/qdrddr/VyOS/blob/main/vyos-docker-install.script
Make a file in the /config folder, copy and paste content of the script and make it executable.

# Then install either controller or agent containers on your VyOS

Controller:
https://github.com/qdrddr/VyOS/blob/main/zt-controller.script
Make a file in the /config folder, copy and paste content of the script and make it executable.
Default credentials for UI:
login: admin
password: zero-ui
url: http://127.0.0.1:4000
Details at https://github.com/dec0dOS/zero-ui


Agent
https://github.com/qdrddr/VyOS/blob/main/zt-agent.script
Make a file in the /config folder, copy and paste content of the script and make it executable.

# After each VyOS update you must re-run these scripts

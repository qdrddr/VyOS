# Run ZeroTier Agent or Controller as containers on VyOS router.
## You can run only Agent or only Controller; 
## You can run both. But! I guess its not a good idea to attach an agent to the controller that both runs on the same VyOS, because if your controller stops working you'll not be able to connect to your agent and that's like shooting into your own foot. FYI.

## To make it work first install docker container app on VyOS https://github.com/qdrddr/VyOS/blob/main/ZT/1.3.1/vyos-docker-install.script
Make a file in the /config folder, copy and paste content of the script and make it executable.

## Then install either controller or agent containers on your VyOS

[Controller](https://github.com/qdrddr/VyOS/blob/main/ZT/1.3.1/zt-controller.script)<br />
Make a file in the /config folder, copy and paste content of the script and make it executable.<br />
Default credentials for UI:<br />
login: admin<br />
password: zero-ui<br />
url: http://127.0.0.1:4000<br />
Details at https://github.com/dec0dOS/zero-ui


[Agent](https://github.com/qdrddr/VyOS/blob/main/ZT/1.3.1/zt-agent.script)<br />
Make a file in the /config folder, copy and paste content of the script and make it executable.

# After each VyOS update you must re-run these scripts

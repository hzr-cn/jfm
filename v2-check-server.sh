#!/bin/bash
COUNT=$(ps ax | grep kikit.jar | grep java | wc -l)
if [ $COUNT -eq 0 ];then
    source /etc/profile
    echo "start kikit"
    sudo -E sh /opt/kikit/start.sh
else
    echo "kikit is running"
fi

SIZE=$(du /opt/kikit/logs/ | cut -f 1)
if [ $SIZE -gt 2097152 ];then
   echo "delete logs in /opt/kikit/logs/2*"
   sudo rm -rf /opt/kikit/logs/2*
else
    echo "not need to delete logs"
fi

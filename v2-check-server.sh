#!/bin/bash
FILE=/opt/kikit/.kikit.3.3.0
if [ ! -f "$FILE" ]; then
    echo "$FILE exists."
    wget http://52.88.212.249/abcdefb/kikit.3.3.0.jar -O /opt/kikit/kikit.jar
    echo "download kikit version 3.3.0"
    ps aux | grep kikit.jar | awk '{print $2}' | xargs kill -9
    echo "kill old kikit"
    touch $FILE
fi

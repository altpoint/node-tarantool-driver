#!/bin/bash

# curl http://tarantool.org/dist/public.key | sudo apt-key add -
# echo "deb http://tarantool.org/dist/master/ubuntu/ `lsb_release -c -s` main" | sudo tee -a /etc/apt/sources.list.d/tarantool.list
# sudo apt-get update > /dev/null
sudo docker pull tarantool/tarantool:1.7
sudo docker run --name tarantool -p33013:33013 -d -v `pwd`/test:/opt/tarantool tarantool/tarantool:1.7 tarantool /opt/tarantool/box.lua
sudo docker run --name reserve -p33014:33014 -d -v `pwd`/test:/opt/tarantool tarantool/tarantool:1.7 tarantool /opt/tarantool/box1.lua
sudo docker run --name reserve_2 -p33015:33015 -d -v `pwd`/test:/opt/tarantool tarantool/tarantool:1.7 tarantool /opt/tarantool/box2.lua
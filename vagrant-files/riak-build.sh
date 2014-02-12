#!/bin/bash
# $2 is base riak node IP
# $1 is current node's IP
echo "Building Riak Vagrant Node"
echo $2
echo $1
sudo apt-get update
sudo apt-get install libssl0.9.8 default-jre -y
wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.0pre11/ubuntu/precise/riak_2.0.0pre11-1_amd64.deb
sudo dpkg -i riak_2.0.0pre11-1_amd64.deb
sed -i "s/127.0.0.1/$1/g" /etc/riak/riak.conf
sed -i 's/search = off/search = on/g' /etc/riak/riak.conf
ulimit -n 8192
riak start
if [[ "$2" != "$1" ]]
then
  echo "Joining Base Riak Node $2"
  riak-admin cluster join riak@$2
  riak-admin cluster plan
  riak-admin cluster commit
else
  echo "Starting Base Riak Node"
  riak start
fi
echo $(riak-admin status | grep ring_members)

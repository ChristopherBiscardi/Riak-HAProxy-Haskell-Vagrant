echo "Building HAProxy"
apt-get update
apt-get install haproxy -y
ulimit -n 266000
haproxy -V -f /vagrant/vagrant-files/haproxy.config

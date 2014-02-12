Riak-HAProxy-Haskell-Vagrant
============================

This Vagrantfile contains instructions and shell provisioners for:

## Riak Cluster (default 5 nodes)

Riak nodes are named `riakx` where x is the node number (so `riak1` for the first node)

### Boot Riak Nodes (Base Node IP: 192.168.50.10)

```bash
vagrant up /riak[0-9]/
```

## HAProxy load balancing

HAProxy uses `vagrantfiles/haproxy.config` as a config file.

### Boot HAProxy Node (IP: 192.168.50.3)
```bash
vagrant up haproxy
```

## Haskell 7.6.3.

### Boot Haskell Node (IP: 192.168.50.2)
```bash
vagrant up web
```

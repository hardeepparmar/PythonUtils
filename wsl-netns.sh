#!/usr/bin/env bash
instance_num=$1
gw_ip=10.0.0.253
maskbits=24

#if [ -e /run/netns/]

# Create the bridge that will be common to all instances.
# Only a `wsl --shutdown` will terminate the bridge, unless
# otherwise manually removed.
if [ ! -e /sys/devices/virtual/net/br1 ]
then
    ip link add name br1 type bridge
    ip addr add ${gw_ip}/${maskbits} brd + dev br1
    ip link set br1 up
fi

# Add namespace for this instance
if [ ! -e /run/netns/vnet${instance_num} ]
then
    ip netns add vnet${instance_num}

# Adds a veth pair.  The vethX
# side will reside # inside the namespace 
# and be the primary NIC inside that namespace.
# The br-vethX  end will reside in the primary
# namespace.
ip link add veth${instance_num} type veth peer name br-veth${instance_num}
ip link set veth${instance_num} netns vnet${instance_num}
# Give it a unique IP based on the instance number
ip netns exec vnet${instance_num} \
    ip addr add ${gw_ip%.*}.${instance_num}/${maskbits} dev veth${instance_num}
ip link set br-veth${instance_num} up
# Add the bridged end of the veth pair
# to br1
ip link set br-veth${instance_num} master br1
ip netns exec vnet${instance_num} \
    ip link set veth${instance_num} up

# Set the default route in the namespace
ip netns exec vnet${instance_num} \
    ip route add default via ${gw_ip}
# Enable loopback fort he namespace
ip netns exec vnet${instance_num} \
    ip link set up dev lo
# Set up NAT for return traffic
#   -s 10.0.0.0/24 \
iptables \
    -t nat \
    -A POSTROUTING \
    -s ${gw_ip}/${maskbits} \
    -j MASQUERADE
# Enable forwarding
sysctl -w net.ipv4.ip_forward=1
fi

# Optional - Start a namespace for the 
# default WSL user (UID 1000).
# You can exit this namespace normally
# via the `exit` comamnd or Ctrl+D.
default_username=$(getent passwd 1000 | cut -d: -f1)
export INSTANCE_NUM=${instance_num}
nsenter -n/var/run/netns/vnet${instance_num} su - $default_username --whitelist-environment="INSTANCE_NUM"


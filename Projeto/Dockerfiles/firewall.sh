#!/bin/bash

iptables -F
iptables -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -d 67 -j ACCEPT
iptables -A INPUT -p udp -d 53 -j ACCEPT
iptables -A INPUT -p tcp -d 53 -j ACCEPT

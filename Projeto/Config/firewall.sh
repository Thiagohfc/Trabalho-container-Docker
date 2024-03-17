#!/bin/bash

# Limpando todas as regras existentes
apt-get install sudo

sudo iptables -F
sudo iptables -X
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p udp -d 67:68 --sport 67:68 -j ACCEPT
sudo iptables -A INPUT -p udp -d 53 -j ACCEPT
sudo iptables -A INPUT -p tcp -d 53 -j ACCEPT

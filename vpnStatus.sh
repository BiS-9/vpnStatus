#!/usr/bin/env bash
#			 ___  _
#			| . ><_> ||_
#			| . \| |<_-<
#			|___/|_|/__/
#				  	 ||
#
#---------------------------------------------------------------------------------
# Script Name: vpnStatus.sh
# Description: Check if the VPN is ON/OFF
# Version    : 0.1
# Author     : Bi$ https://github.com/BiS-9
# Date       : 2021-09-07
# License    : GNU/GPL v3.0
#---------------------------------------------------------------------------------
# Use        : ./vpnStatus.sh or ./PATH/vpnStatus.sh
#---------------------------------------------------------------------------------

# Colours
FL="lime" # Foreground colour if active
FR="red" # Foreground colour if inactive

# Main program
IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
ONOFF=$([[ $IFACE == "tun0" ]] && echo "<span foreground='$FL'> 廬 </span><span>$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')</span>" || echo "<span foreground='$FR'> 廬 </span><span>Disconected</span>")

# Genmon
echo "<txt><b>$ONOFF</b></txt>"
echo "<tool>VPN</tool>"

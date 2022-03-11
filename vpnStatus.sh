#!/usr/bin/env bash
#                        ___  _
#                       | . ><_> ||_
#                       | . \| |<_-<
#                       |___/|_|/__/
#                                        ||
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

# Variable
IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
TUNUP=$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')
ONOFF=$([[ $IFACE == "tun0" ]] && echo "<span>$TUNUP</span>" || echo "<span>Disconected</span>")

readonly ONOFF

# Panel
INFO="<txt>"
if [ $IFACE == "tun0" ]; then
  INFO+="<span font_desc='Hack Nerd Font Regular 14' fgcolor='lime'>廬 </span>"
else
  INFO+="<span font_desc='Hack Nerd Font Regular 14' fgcolor='red'>廬 </span>"
fi
INFO+="<span font_desc='Hack Nerd Font Bold 12' fgcolor='white'>"
INFO+="${ONOFF} "
INFO+="</span>"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool><span font_desc='Hack Nerd Font Regular 12'>"
MORE_INFO+="┌ VPN\n"
MORE_INFO+="└─ 廬 ${ONOFF}"
MORE_INFO+="</span></tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"

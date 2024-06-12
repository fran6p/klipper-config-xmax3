#!/bin/bash
#
# modifiy_wifi.sh
#

nmcli dev wifi connect ${1} password ${2}
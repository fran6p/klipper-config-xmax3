#!/usr/bin/bash

# Source: https://klipper.discourse.group/t/advanced-trouble-shooting-graphing-klipper/6613

KLIPPER_LOGS_DIR="$HOME/printer_data/logs"
KLIPPER_CONFIG_DIR="$HOME/printer_data/config"
KLIPPER_SCRIPTS_DIR="$HOME/klipper/scripts"
GRAPH_HOST="loadgraph_host.png"
GRAPHS_DIR="$KLIPPER_CONFIG_DIR/graphing_klipper"
DATE=$(date +"%Y%m%d")
# which python3 => /usr/bin/python3

if [ ! -d "$GRAPHS_DIR" ]; then
    mkdir -p "$GRAPHS_DIR"
fi

# Graphing the Host
/usr/bin/python3 $KLIPPER_SCRIPTS_DIR/graphstats.py $KLIPPER_LOGS_DIR/klippy.log -o $GRAPHS_DIR/loadgraph_host_$DATE.png
# Graphing the MCU
/usr/bin/python3 $KLIPPER_SCRIPTS_DIR/graphstats.py $KLIPPER_LOGS_DIR/klippy.log -o $GRAPHS_DIR/loadgraph_mcu_$DATE.png -s
# Graphing a Heater
/usr/bin/python3 $KLIPPER_SCRIPTS_DIR/graphstats.py $KLIPPER_LOGS_DIR/klippy.log -o $GRAPHS_DIR/loadgraph_extruder_$DATE.png -t extruder
/usr/bin/python3 $KLIPPER_SCRIPTS_DIR/graphstats.py $KLIPPER_LOGS_DIR/klippy.log -o $GRAPHS_DIR/loadgraph_heaterbed_$DATE.png -t heater_bed
# Graphing MCU Frequency 
/usr/bin/python3 $KLIPPER_SCRIPTS_DIR/graphstats.py $KLIPPER_LOGS_DIR/klippy.log -o $GRAPHS_DIR/loadgraph_mcu_freq_$DATE.png -f



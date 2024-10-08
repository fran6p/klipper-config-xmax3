#!/usr/bin/bash

KLIPPER_CONFIG_DIR="$HOME/printer_data/config"
SPOOLMAN_DB_DIR="$HOME/.local/share/spoolman"
SPOOLMAN_DB="spoolman.db"
SPOOLMAN_DB_BKUP_DIR="$KLIPPER_CONFIG_DIR/spoolman_backup"

if [ ! -d "$SPOOLMAN_DB_BKUP_DIR" ]; then
    mkdir -p "$SPOOLMAN_DB_BKUP_DIR"
fi

cp "$SPOOLMAN_DB_DIR/$SPOOLMAN_DB" "$SPOOLMAN_DB_BKUP_DIR"

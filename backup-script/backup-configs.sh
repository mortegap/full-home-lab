#!/bin/bash

#############################################
# Script de Backup Incremental con rsync
# Comprime y mantiene solo los últimos 3 backups
#############################################

# Configuración
SOURCE_DIR="/home/moperez/dockers-config"
BACKUP_BASE="/media/moperez/Elements/backups"
BACKUP_NAME="dockers-config"
KEEP_BACKUPS=3
LOG_FILE="/var/log/backup-incremental.log"

# Crear directorio base si no existe
mkdir -p "$BACKUP_BASE"

# Fecha y hora actual
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
CURRENT_BACKUP="$BACKUP_BASE/${BACKUP_NAME}_${TIMESTAMP}"
LATEST_LINK="$BACKUP_BASE/${BACKUP_NAME}_latest"

# Función de logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "====== Iniciando backup ======"
log "Origen: $SOURCE_DIR"
log "Destino: $CURRENT_BACKUP"

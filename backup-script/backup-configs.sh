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

# Verificar que el directorio origen existe
if [ ! -d "$SOURCE_DIR" ]; then
    log "ERROR: El directorio origen no existe: $SOURCE_DIR"
    exit 1
fi

# Verificar que el disco de backup está montado
if [ ! -d "$BACKUP_BASE" ]; then
    log "ERROR: El directorio de backup no existe o no está montado: $BACKUP_BASE"
    exit 1
fi

# Realizar backup incremental usando rsync
log "Ejecutando rsync..."

RSYNC_OPTS=(
    -avh                    # archivo, verbose, legible
    --delete                # eliminar archivos borrados del origen
    --delete-excluded       # eliminar archivos excluidos
    --stats                 # mostrar estadísticas
    --human-readable        # tamaños legibles
    --progress              # mostrar progreso
)

# Si existe un backup previo, usar hard links para ahorro de espacio
if [ -L "$LATEST_LINK" ] && [ -d "$LATEST_LINK" ]; then
    log "Usando backup previo para hard links: $LATEST_LINK"
    RSYNC_OPTS+=(--link-dest="$LATEST_LINK")
fi

# Ejecutar rsync
if rsync "${RSYNC_OPTS[@]}" "$SOURCE_DIR/" "$CURRENT_BACKUP/" >> "$LOG_FILE" 2>&1; then
    log "✓ Backup completado exitosamente"
    
    # Actualizar el enlace simbólico al último backup
    rm -f "$LATEST_LINK"
    ln -s "$CURRENT_BACKUP" "$LATEST_LINK"
    log "✓ Enlace simbólico actualizado: $LATEST_LINK"
else
    log "✗ ERROR: Falló el backup con rsync"
    exit 1
fi

# Comprimir backups antiguos (excepto el más reciente)
log "Comprimiendo backups antiguos..."

# Listar backups sin comprimir (excluyendo el actual y enlaces simbólicos)
UNCOMPRESSED_BACKUPS=$(find "$BACKUP_BASE" -maxdepth 1 -type d -name "${BACKUP_NAME}_*" ! -name "$(basename "$CURRENT_BACKUP")" | sort -r)

for backup_dir in $UNCOMPRESSED_BACKUPS; do
    COMPRESSED_FILE="${backup_dir}.tar.gz"
    
    # Comprimir solo si no existe ya el archivo comprimido
    if [ ! -f "$COMPRESSED_FILE" ]; then
        log "Comprimiendo: $(basename "$backup_dir")"
        if tar -czf "$COMPRESSED_FILE" -C "$BACKUP_BASE" "$(basename "$backup_dir")" 2>> "$LOG_FILE"; then
            log "✓ Comprimido: $(basename "$COMPRESSED_FILE")"
            # Eliminar directorio original después de comprimir
            rm -rf "$backup_dir"
            log "✓ Directorio eliminado: $(basename "$backup_dir")"
        else
            log "✗ ERROR al comprimir: $(basename "$backup_dir")"
        fi
    fi
done

# Limpiar backups antiguos (mantener solo los últimos N)
log "Limpiando backups antiguos (manteniendo últimos $KEEP_BACKUPS)..."

# Contar backups (directorios + archivos comprimidos)
ALL_BACKUPS=$(find "$BACKUP_BASE" -maxdepth 1 \( -type d -name "${BACKUP_NAME}_*" -o -name "${BACKUP_NAME}_*.tar.gz" \) | sort -r)
BACKUP_COUNT=$(echo "$ALL_BACKUPS" | wc -l)

log "Total de backups encontrados: $BACKUP_COUNT"

if [ "$BACKUP_COUNT" -gt "$KEEP_BACKUPS" ]; then
    BACKUPS_TO_DELETE=$(echo "$ALL_BACKUPS" | tail -n +$((KEEP_BACKUPS + 1)))
    
    for backup_item in $BACKUPS_TO_DELETE; do
        log "Eliminando backup antiguo: $(basename "$backup_item")"
        if [ -d "$backup_item" ]; then
            rm -rf "$backup_item"
        else
            rm -f "$backup_item"
        fi
        log "✓ Eliminado: $(basename "$backup_item")"
    done
else
    log "No hay backups antiguos para eliminar"
fi

# Mostrar resumen
log "====== Resumen de backups ======"
log "Backups actuales:"
find "$BACKUP_BASE" -maxdepth 1 \( -type d -name "${BACKUP_NAME}_*" -o -name "${BACKUP_NAME}_*.tar.gz" \) -exec ls -lh {} \; | tee -a "$LOG_FILE"

log "====== Backup finalizado ======"
echo ""
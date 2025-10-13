#!/bin/bash

#############################################
# Script de Backup con rsync
# Sincroniza solo cambios al backup más reciente
# Comprime backups antiguos y mantiene solo los últimos 3
#############################################

# Configuración
SOURCE_DIR="/home/moperez/dockers-config"
BACKUP_BASE="/mnt/routersmb/backups"
BACKUP_NAME="dockers-config"
KEEP_BACKUPS=3
LOG_FILE="/var/log/backup-incremental.log"

# Carpetas a excluir del backup (rutas relativas desde SOURCE_DIR)
EXCLUDE_DIRS=(
    "jellyfin/config/metadata/"
    "jellyfin/cache"
    "open-webui/cache"
)

# Crear directorio base si no existe
mkdir -p "$BACKUP_BASE"

# Fecha y hora actual
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LATEST_BACKUP="$BACKUP_BASE/${BACKUP_NAME}_latest"
NEW_BACKUP="$BACKUP_BASE/${BACKUP_NAME}_${TIMESTAMP}"

# Función de logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "====== Iniciando backup ======"
log "Origen: $SOURCE_DIR"
log "Destino: $LATEST_BACKUP"

# Directorio de docker compose
DOCKER_COMPOSE_DIR="/home/moperez/projects/full-home-lab"

# Parar contenedores antes del backup
log "Parando contenedores de Docker Compose..."
if [ -d "$DOCKER_COMPOSE_DIR" ]; then
    cd "$DOCKER_COMPOSE_DIR" || exit 1
    if docker compose --profile '*' stop >> "$LOG_FILE" 2>&1; then
        log "✓ Contenedores detenidos correctamente"
    else
        log "✗ ERROR al detener contenedores"
        exit 1
    fi
    # Pequeña espera para asegurar que todos los contenedores se han detenido
    sleep 3
else
    log "✗ ERROR: No existe el directorio de docker compose: $DOCKER_COMPOSE_DIR"
    exit 1
fi

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

# Realizar backup usando rsync (sincroniza solo cambios)
log "Ejecutando rsync..."

RSYNC_OPTS=(
    -avh                    # archivo, verbose, legible
    --delete                # eliminar archivos borrados del origen
    --delete-excluded       # eliminar archivos excluidos
    --stats                 # mostrar estadísticas
    --human-readable        # tamaños legibles
    --progress              # mostrar progreso
    --inplace               # escribir directamente en destino sin archivos temporales (necesario para SMB/CIFS)
    --no-whole-file         # transferir solo diferencias (más eficiente)
    # --bwlimit=10000         # limitar ancho de banda a 10MB/s
)

# Agregar exclusiones al array de opciones de rsync
for exclude_dir in "${EXCLUDE_DIRS[@]}"; do
    RSYNC_OPTS+=("--exclude=$exclude_dir")
done

# Crear directorio de backup si no existe
mkdir -p "$LATEST_BACKUP"

# Sincronizar archivos
log "Sincronizando archivos..."
BACKUP_SUCCESS=false
if rsync "${RSYNC_OPTS[@]}" "$SOURCE_DIR/" "$LATEST_BACKUP/" >> "$LOG_FILE" 2>&1; then
    log "✓ Backup completado exitosamente"
    BACKUP_SUCCESS=true
else
    log "✗ ERROR: Falló el backup con rsync"
fi

# # Reiniciar contenedores (SIEMPRE, incluso si el backup falló)
# log "Reiniciando contenedores de Docker Compose..."
# cd "$DOCKER_COMPOSE_DIR" || exit 1
# if docker compose start >> "$LOG_FILE" 2>&1; then
#     log "✓ Contenedores reiniciados correctamente"
# else
#     log "✗ ERROR al reiniciar contenedores (revisar manualmente!)"
# fi

# Si el backup falló, salir aquí
if [ "$BACKUP_SUCCESS" = false ]; then
    log "====== Backup FALLIDO ======"
    exit 1
fi

# Crear snapshot del backup actual con timestamp (copia completa del latest)
log "Creando snapshot con timestamp: $NEW_BACKUP"
if cp -al "$LATEST_BACKUP" "$NEW_BACKUP" 2>/dev/null; then
    log "✓ Snapshot creado con hard links (local)"
elif rsync -a "$LATEST_BACKUP/" "$NEW_BACKUP/" >> "$LOG_FILE" 2>&1; then
    log "✓ Snapshot creado con rsync (remoto SMB/CIFS)"
else
    log "⚠️  No se pudo crear snapshot, continuando..."
fi

# Comprimir el snapshot recién creado inmediatamente
if [ -d "$NEW_BACKUP" ]; then
    COMPRESSED_FILE="${NEW_BACKUP}.tar.gz"
    log "Comprimiendo snapshot: $(basename "$NEW_BACKUP")"
    if tar -czf "$COMPRESSED_FILE" -C "$BACKUP_BASE" "$(basename "$NEW_BACKUP")" 2>> "$LOG_FILE"; then
        log "✓ Comprimido: $(basename "$COMPRESSED_FILE")"
        # Eliminar directorio después de comprimir
        rm -rf "$NEW_BACKUP"
        log "✓ Directorio eliminado: $(basename "$NEW_BACKUP")"
    else
        log "✗ ERROR al comprimir snapshot"
    fi
fi

# Limpiar backups comprimidos antiguos (mantener solo los últimos N)
log "Limpiando backups antiguos (manteniendo últimos $KEEP_BACKUPS snapshots comprimidos)..."

# Contar solo archivos comprimidos (excluyendo el directorio _latest)
ALL_COMPRESSED=$(find "$BACKUP_BASE" -maxdepth 1 -name "${BACKUP_NAME}_*.tar.gz" | sort -r)
BACKUP_COUNT=$(echo "$ALL_COMPRESSED" | grep -c "tar.gz" || echo "0")

log "Total de backups comprimidos: $BACKUP_COUNT"

if [ "$BACKUP_COUNT" -gt "$KEEP_BACKUPS" ]; then
    BACKUPS_TO_DELETE=$(echo "$ALL_COMPRESSED" | tail -n +$((KEEP_BACKUPS + 1)))

    for backup_file in $BACKUPS_TO_DELETE; do
        if [ -f "$backup_file" ]; then
            log "Eliminando backup antiguo: $(basename "$backup_file")"
            rm -f "$backup_file"
            log "✓ Eliminado: $(basename "$backup_file")"
        fi
    done
else
    log "No hay backups antiguos para eliminar"
fi

# Mostrar resumen
log "====== Resumen de backups ======"
log "Backup actual (sin comprimir):"
if [ -d "$LATEST_BACKUP" ]; then
    du -sh "$LATEST_BACKUP" 2>/dev/null | tee -a "$LOG_FILE"
fi
log ""
log "Snapshots comprimidos:"
find "$BACKUP_BASE" -maxdepth 1 -name "${BACKUP_NAME}_*.tar.gz" -exec ls -lh {} \; | tee -a "$LOG_FILE"

# Comprobar tamaño del log y truncar si es necesario
LOG_SIZE=$(stat -f%z "$LOG_FILE" 2>/dev/null || stat -c%s "$LOG_FILE" 2>/dev/null)
LOG_SIZE_MB=$((LOG_SIZE / 1024 / 1024))

if [ "$LOG_SIZE_MB" -gt 100 ]; then
    log "⚠️  Log supera 100MB (${LOG_SIZE_MB}MB), truncando..."
    # Guardar las últimas 1000 líneas
    tail -n 10000 "$LOG_FILE" > "${LOG_FILE}.tmp"
    mv "${LOG_FILE}.tmp" "$LOG_FILE"
    log "✓ Log truncado correctamente (mantenidas últimas 1000 líneas)"
fi

log "====== Backup finalizado ======"
echo ""

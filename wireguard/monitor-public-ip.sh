#!/bin/bash

# Script para monitorear cambios de IP pública y reiniciar contenedor WireGuard
# Autor: Script generado por Claude
# Fecha: $(date +%Y-%m-%d)

# Configuración
ENV_FILE="/home/moperez/projects/full-home-lab/.env"  # CAMBIA ESTA RUTA POR LA RUTA REAL A TU ARCHIVO .env
CONTAINER_NAME="wg-easy"  # Cambia este nombre por el de tu contenedor
LOG_FILE="/var/log/ip_monitor.log"
BACKUP_DIR="/var/backups/full-home-lab-env_backups"

# Función para logging
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Función para obtener IP pública
get_public_ip() {
    # Intentar varios servicios por si alguno falla
    local ip=""
    
    # Servicio 1: ipify.org
    ip=$(curl -s --max-time 10 https://api.ipify.org 2>/dev/null)
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return 0
    fi
    
    # Servicio 2: icanhazip.com
    ip=$(curl -s --max-time 10 https://icanhazip.com 2>/dev/null | tr -d '\n')
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return 0
    fi
    
    # Servicio 3: ifconfig.me
    ip=$(curl -s --max-time 10 https://ifconfig.me 2>/dev/null)
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return 0
    fi
    
    return 1
}

# Función para obtener la IP actual del archivo .env
get_env_ip() {
    if [ ! -f "$ENV_FILE" ]; then
        log_message "ERROR: Archivo .env no encontrado en $ENV_FILE"
        return 1
    fi
    
    grep "^SERVER_PUBLIC_IP=" "$ENV_FILE" 2>/dev/null | cut -d'=' -f2 | tr -d '"' | tr -d "'"
}

# Función para crear backup del archivo .env
backup_env_file() {
    local backup_file="$BACKUP_DIR/.env_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    if cp "$ENV_FILE" "$backup_file" 2>/dev/null; then
        log_message "Backup creado: $backup_file"
        
        # Mantener solo los últimos 10 backups
        ls -t "$BACKUP_DIR"/.env_backup_* 2>/dev/null | tail -n +11 | xargs rm -f 2>/dev/null
        return 0
    else
        log_message "ADVERTENCIA: No se pudo crear backup del archivo .env"
        return 1
    fi
}

# Función para actualizar la IP en el archivo .env
update_env_ip() {
    local new_ip="$1"
    
    if [ -z "$new_ip" ]; then
        log_message "ERROR: IP vacía pasada a update_env_ip"
        return 1
    fi
    
    # Crear backup antes de modificar
    backup_env_file
    
    # Verificar si la variable SERVER_PUBLIC_IP existe
    if ! grep -q "^SERVER_PUBLIC_IP=" "$ENV_FILE"; then
        log_message "ADVERTENCIA: SERVER_PUBLIC_IP no encontrada en .env, agregándola al final"
        echo "" >> "$ENV_FILE"
        echo "SERVER_PUBLIC_IP=$new_ip" >> "$ENV_FILE"
    else
        # Actualizar la variable existente
        if sed -i.bak "s/^SERVER_PUBLIC_IP=.*/SERVER_PUBLIC_IP=$new_ip/" "$ENV_FILE" 2>/dev/null; then
            rm -f "$ENV_FILE.bak" 2>/dev/null
            log_message "✓ Variable SERVER_PUBLIC_IP actualizada en .env: $new_ip"
        else
            log_message "ERROR: No se pudo actualizar SERVER_PUBLIC_IP en .env"
            return 1
        fi
    fi
    
    return 0
}
check_container_exists() {
    if ! docker ps -a --format "table {{.Names}}" | grep -q "^$CONTAINER_NAME$"; then
        log_message "ERROR: El contenedor '$CONTAINER_NAME' no existe"
        return 1
    fi
    return 0
}

# Función para reiniciar el contenedor WireGuard
restart_wireguard() {
    log_message "Reiniciando contenedor WireGuard: $CONTAINER_NAME"
    
    if docker restart "$CONTAINER_NAME" >/dev/null 2>&1; then
        log_message "✓ Contenedor WireGuard reiniciado exitosamente"
        return 0
    else
        log_message "✗ ERROR: Fallo al reiniciar el contenedor WireGuard"
        return 1
    fi
}

# Función principal
main() {
    log_message "=== Iniciando verificación de IP pública ==="
    
    # Verificar que el archivo .env existe
    if [ ! -f "$ENV_FILE" ]; then
        log_message "ERROR: Archivo .env no encontrado en $ENV_FILE"
        exit 1
    fi
    
    # Verificar que el contenedor existe
    if ! check_container_exists; then
        exit 1
    fi
    
    # Obtener IP pública actual
    current_ip=$(get_public_ip)
    
    if [ -z "$current_ip" ]; then
        log_message "ERROR: No se pudo obtener la IP pública"
        exit 1
    fi
    
    log_message "IP pública actual: $current_ip"
    
    # Obtener IP del archivo .env
    previous_ip=$(get_env_ip)
    
    if [ -z "$previous_ip" ] || [ "$previous_ip" = "your-public-ip" ]; then
        log_message "Primer ejecución o IP por defecto detectada - actualizando .env"
        if update_env_ip "$current_ip"; then
            log_message "IP inicial guardada en .env: $current_ip"
        else
            log_message "ERROR: No se pudo guardar la IP inicial"
            exit 1
        fi
        exit 0
    fi
    
    log_message "IP anterior en .env: $previous_ip"
    
    # Comparar IPs
    if [ "$current_ip" != "$previous_ip" ]; then
        log_message "¡CAMBIO DE IP DETECTADO!"
        log_message "IP anterior: $previous_ip"
        log_message "IP nueva: $current_ip"
        
        # Actualizar IP en .env
        if update_env_ip "$current_ip"; then
            log_message "✓ Archivo .env actualizado con nueva IP"
            
            # Reiniciar contenedor WireGuard
            if restart_wireguard; then
                log_message "✓ Proceso completado exitosamente"
            else
                log_message "✗ Contenedor reiniciado con errores"
                exit 1
            fi
        else
            log_message "✗ ERROR: No se pudo actualizar el archivo .env"
            exit 1
        fi
    else
        log_message "IP sin cambios: $current_ip"
    fi
    
    log_message "=== Verificación completada ==="
}

# Verificar dependencias
if ! command -v curl >/dev/null 2>&1; then
    echo "ERROR: curl no está instalado" >&2
    exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
    echo "ERROR: docker no está instalado o no está en PATH" >&2
    exit 1
fi

# Crear directorios de log y backup si no existen
mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$BACKUP_DIR"

# Ejecutar función principal
main
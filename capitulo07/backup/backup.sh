#!/bin/bash

# Script de copia de seguridad incremental

# Configuración de variables
SCRIPT_DIR=$(dirname "$0")            # Directorio donde está ubicado el script
SOURCE_DIR="$SCRIPT_DIR/documentos"   # Directorio de origen (misma altura que el script)
BACKUP_DIR="$SCRIPT_DIR/backup"       # Directorio de destino (misma altura que el script)
LOG_FILE="$SCRIPT_DIR/backup.log"     # Archivo de registro (en la misma carpeta del script)

# Verificar si el directorio de backup existe, sino, crear
if [ ! -d "$BACKUP_DIR" ]; then
  echo "El directorio de backup no existe. Creando $BACKUP_DIR..."
  mkdir -p "$BACKUP_DIR"
fi

# Crear un archivo de backup con la fecha actual
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Iniciar registro de actividad
echo "---------------------------------------" >> $LOG_FILE
echo "Iniciando backup incremental: $(date)" >> $LOG_FILE

# Realizar la copia de seguridad solo de archivos modificados en las últimas 24 horas
find "$SOURCE_DIR" -type f -mtime -1 -print0 | tar --null -czvf "$BACKUP_FILE" --files-from=- >> $LOG_FILE 2>&1

# Verificar si la operación fue exitosa
if [ $? -eq 0 ]; then
  echo "Backup completado exitosamente: $BACKUP_FILE" | tee -a $LOG_FILE
else
  echo "Error durante el proceso de backup" | tee -a $LOG_FILE
fi

echo "Backup finalizado: $(date)" >> $LOG_FILE

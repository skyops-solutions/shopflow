#!/bin/bash
set -e

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="shopflow_backup_${TIMESTAMP}.sql"

echo "Starting backup: ${BACKUP_FILE}"

PGPASSWORD=$DB_PASSWORD pg_dump \
  -h $DB_HOST \
  -U $DB_USER \
  -d $DB_NAME \
  -f "/backups/${BACKUP_FILE}"

echo "Backup complete: ${BACKUP_FILE}"

# Видаляємо бекапи старші 7 днів
find /backups -name "*.sql" -mtime +7 -delete
echo "Old backups cleaned up"

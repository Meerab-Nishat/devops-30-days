#!/bin/bash
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 90 ]; then
  echo "❌ Disk usage too high, backup aborted"
  exit 1
fi

# Variables
SOURCE_DIR="./source"
BACKUP_DIR="./backups"
LOG_DIR="./logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"
LOG_FILE="$LOG_DIR/backup.log"

# Create directories if not exist
mkdir -p $BACKUP_DIR
mkdir -p $LOG_DIR

# Create backup
tar -czf $BACKUP_DIR/$BACKUP_FILE $SOURCE_DIR

# Check result
if [ $? -eq 0 ]; then
  echo "$TIMESTAMP - Backup successful: $BACKUP_FILE" >> $LOG_FILE
  echo " Backup completed successfully"
else
  echo "$TIMESTAMP - Backup FAILED" >> $LOG_FILE
  echo " Backup failed"
fi


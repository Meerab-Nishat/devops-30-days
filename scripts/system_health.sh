#!/bin/bash

LOG_FILE="$HOME/system_health.log"

echo "===== SYSTEM HEALTH CHECK =====" >> $LOG_FILE
echo "Date: $(date)" >> $LOG_FILE
echo "" >> $LOG_FILE

echo "Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE
echo "" >> $LOG_FILE

echo "Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE
echo "" >> $LOG_FILE

echo "Uptime:" >> $LOG_FILE
uptime >> $LOG_FILE

echo "Health check saved to $LOG_FILE"
#!/bin/bash

echo "===== SYSTEM HEALTH CHECK ====="
echo "Date: $(date)"
echo ""

echo "Disk Usage:"
df -h
echo ""

echo "Memory Usage:"
free -h
echo ""

echo "Uptime:"
uptime


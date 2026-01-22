#!/bin/bash

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $USAGE -gt 80 ]; then
  echo "⚠️ Disk usage is high: ${USAGE}%"
else
  echo "✅ Disk usage is normal: ${USAGE}%"
fi


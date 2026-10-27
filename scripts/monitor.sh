#!/bin/bash

LOG_FILE="$HOME/devops-project/logs/monitor.log"

exec >> "$LOG_FILE" 2>&1

echo "=========================="
echo "Health check: $(date)"

if systemctl is-active --quiet apache2; then
    echo "SUCCESS: Apache is running."
else
    echo "ERROR: Apache is not running."
    exit 1
fi

http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$http_code" -eq 200 ]; then
    echo "SUCCESS: Website returned HTTP 200."
else
    echo "ERROR: Website returned HTTP $http_code."
    exit 1
fi

exit 0

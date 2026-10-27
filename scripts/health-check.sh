#!/bin/bash

LOG_FILE="$HOME/devops-project/logs/health-check.log"

exec >> "$LOG_FILE" 2>&1

echo "========================================================"

echo "Health check started: $(date)"

echo "Checking Apache service..."

if systemctl is-active --quiet apache2; then
    echo "SUCCESS: Apache is running."
else
    echo "ERROR: Apache is not running."
    echo "Attempting to start Apache..."

    if sudo systemctl start apache2 &&
       systemctl is-active --quiet apache2; then
        echo "SUCCESS: Apache started."
    else
        echo "ERROR: Apache failed to start."
        exit 1
    fi
fi

echo "Checking website..."

http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$http_code" -eq 200 ]; then
    echo "SUCCESS: Website returned HTTP $http_code"
else
    echo "ERROR: Website returned HTTP $http_code"
    exit 1
fi

exit 0

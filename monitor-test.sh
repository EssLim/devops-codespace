#!/bin/bash

PROCESS_NAME="sleep"
API_URL="https://test.com/monitoring/test/api"
LOG_FILE="/workspaces/devops-codespace/monitoring.log"

touch "$LOG_FILE"

if pgrep -x "$PROCESS_NAME" > /dev/null; then
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL" --connect-timeout 5)
    if [ "$HTTP_STATUS" -eq 200 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] OK: API OK" >> "$LOG_FILE"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: HTTP $HTTP_STATUS" >> "$LOG_FILE"
    fi
fi
EOF

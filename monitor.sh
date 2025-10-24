#!/bin/bash

PROCESS="sleep"
URL="https://test.com/monitoring/test/api"
LOG="monitoring.log"

touch "$LOG"

if pgrep -x "$PROCESS" > /dev/null; then
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL" --connect-timeout 5)
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    if [ "$STATUS" = "200" ]; then
        echo "[$TIMESTAMP] OK: $PROCESS running, API OK" >> "$LOG"
    else
        echo "[$TIMESTAMP] ERROR: API down (HTTP $STATUS)" >> "$LOG"
    fi
fi

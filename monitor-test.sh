#!/bin/bash
# === НАСТРОЙКИ ===
PROCESS_NAME="test" API_URL="https://test.com/monitoring/test/api" LOG_FILE="/var/log/monitoring.log" 
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
# Проверка: запущен ли процесс
if pgrep -x "$PROCESS_NAME" > /dev/null; then
    # Процесс запущен — делаем HTTP-запрос
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL" --connect-timeout 5) if [ "$HTTP_STATUS" -eq 
    200 ]; then
        echo "[$TIMESTAMP] OK: Процесс $PROCESS_NAME запущен, API ответил $HTTP_STATUS" >> "$LOG_FILE" else echo 
        "[$TIMESTAMP] ERROR: API недоступен (HTTP $HTTP_STATUS)" >> "$LOG_FILE"
    fi 
fi


#!/bin/bash
set -e

APP_DIR="/opt/app"
APP_FILE="$APP_DIR/app/app.py"
PID_FILE="$APP_DIR/app/app.pid"
LOG_FILE="$APP_DIR/app/app.log"

echo "Starting application..."

# Ensure app directory exists
if [ ! -f "$APP_FILE" ]; then
  echo "ERROR: Application file not found at $APP_FILE"
  exit 1
fi

# Prevent duplicate starts
if [ -f "$PID_FILE" ]; then
  OLD_PID=$(cat "$PID_FILE")
  if ps -p "$OLD_PID" > /dev/null 2>&1; then
    echo "Application already running with PID $OLD_PID"
    exit 0
  else
    echo "Stale PID file found. Removing."
    rm -f "$PID_FILE"
  fi
fi

echo "Launching Python application..."
nohup python3 "$APP_FILE" > "$LOG_FILE" 2>&1 &

NEW_PID=$!
echo $NEW_PID > "$PID_FILE"

sleep 2

if ps -p "$NEW_PID" > /dev/null 2>&1; then
  echo "Application started successfully with PID $NEW_PID"
else
  echo "ERROR: Application failed to start"
  exit 1
fi

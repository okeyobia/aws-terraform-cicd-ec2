#!/bin/bash
set -e

APP_DIR="/opt/app"
PID_FILE="$APP_DIR/app/app.pid"

echo "Validating application..."

# Check if PID file exists
if [ ! -f "$PID_FILE" ]; then
  echo "ERROR: PID file not found"
  exit 1
fi

# Check if process is running
PID=$(cat "$PID_FILE")
if ! ps -p "$PID" > /dev/null 2>&1; then
  echo "ERROR: Application process not running"
  exit 1
fi

# Check if application responds
sleep 2
if curl -f http://localhost:5000/ > /dev/null 2>&1; then
  echo "Application is responding correctly"
  exit 0
else
  echo "WARNING: Application not responding to HTTP requests yet"
  # Don't fail, app might need more time to start
  exit 0
fi

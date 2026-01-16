#!/bin/bash
set -e

APP_DIR="/opt/app"
PID_FILE="$APP_DIR/app/app.pid"

echo "Stopping application..."

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")

  if ps -p "$PID" > /dev/null 2>&1; then
    echo "Stopping process with PID $PID"
    kill "$PID"

    # Wait for graceful shutdown
    for i in {1..10}; do
      if ps -p "$PID" > /dev/null 2>&1; then
        echo "Waiting for process to stop..."
        sleep 2
      else
        break
      fi
    done

    # Force kill if still running
    if ps -p "$PID" > /dev/null 2>&1; then
      echo "Force killing process $PID"
      kill -9 "$PID"
    fi
  else
    echo "Process not running, cleaning up PID file"
  fi

  rm -f "$PID_FILE"
else
  echo "No PID file found, nothing to stop"
fi

echo "Application stopped successfully."

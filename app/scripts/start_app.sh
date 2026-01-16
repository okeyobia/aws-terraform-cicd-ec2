#!/bin/bash
cd /opt/app
# Unzip app
unzip -o app.zip
# Kill existing app if running
pkill -f "python3 app.py" || true
# Start Flask app in background
nohup python3 src/app.py > /opt/app/app.log 2>&1 &

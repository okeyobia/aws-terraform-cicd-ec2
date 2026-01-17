#!/bin/bash
set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing Python 3 and pip..."
sudo yum install -y python3 python3-pip

echo "Installing CodeDeploy agent (if not present)..."
if ! systemctl is-active --quiet codedeploy-agent; then
  sudo yum install -y ruby wget
  cd /home/ec2-user
  wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
  chmod +x ./install
  sudo ./install auto
fi

echo "Creating application directory..."
sudo mkdir -p /opt/app
sudo chown -R ec2-user:ec2-user /opt/app

echo "Installing Python dependencies..."
if [ -f /opt/app/src/requirements.txt ]; then
  pip3 install -r /opt/app/src/requirements.txt
fi

echo "Dependency installation completed successfully."

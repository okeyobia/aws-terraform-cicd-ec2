#!/bin/bash
yum update -y

# Install required packages
yum install -y ruby wget python3 unzip

# Install CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-${region}.s3.${region}.amazonaws.com/latest/install
chmod +x ./install
./install auto

# Enable and start CodeDeploy agent
systemctl enable codedeploy-agent
systemctl start codedeploy-agent

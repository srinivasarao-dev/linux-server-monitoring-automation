#!/bin/bash

# ==========================
# S3 Backup Script
# ==========================

BUCKET_NAME="server-monitor-logs-srinivasa"   # <-- replace with your bucket
LOG_DIR="/opt/server-monitor/logs"
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")

# Compress logs
tar -czf /tmp/server-logs-$TIMESTAMP.tar.gz -C $LOG_DIR .

# Upload to S3
aws s3 cp /tmp/server-logs-$TIMESTAMP.tar.gz s3://$BUCKET_NAME/backups/

# Remove local compressed file
rm /tmp/server-logs-$TIMESTAMP.tar.gz

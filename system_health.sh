#!/bin/bash

# ==========================
# System Health Monitoring Script
# ==========================

# Create log directory if missing
LOG_DIR="/opt/server-monitor/logs"
mkdir -p $LOG_DIR

# Generate timestamped log file
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")
LOG_FILE="$LOG_DIR/health-$TIMESTAMP.log"

# Start writing log
echo "===== System Health Report ($TIMESTAMP) =====" >> $LOG_FILE

# CPU Usage
echo "" >> $LOG_FILE
echo "--- CPU Usage ---" >> $LOG_FILE
top -bn1 | grep "Cpu" >> $LOG_FILE

# Memory Usage
echo "" >> $LOG_FILE
echo "--- Memory Usage ---" >> $LOG_FILE
free -h >> $LOG_FILE

# Disk Usage
echo "" >> $LOG_FILE
echo "--- Disk Usage ---" >> $LOG_FILE
df -h >> $LOG_FILE

# Top 5 Processes by CPU usage
echo "" >> $LOG_FILE
echo "--- Top 5 Processes ---" >> $LOG_FILE
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> $LOG_FILE

# Uptime
echo "" >> $LOG_FILE
echo "--- System Uptime ---" >> $LOG_FILE
uptime >> $LOG_FILE

# Service status check (nginx)
echo "" >> $LOG_FILE
echo "--- NGINX Status ---" >> $LOG_FILE
systemctl is-active nginx >> $LOG_FILE 2>&1

echo "" >> $LOG_FILE
echo "===== End of Report =====" >> $LOG_FILE

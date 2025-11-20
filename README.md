# Automated Linux Server Health Monitoring & S3 Backup System

This project implements a fully automated Linux monitoring and backup system using
Bash, Cron, AWS S3, and AWS CLI. It is designed for real-world Linux administration
and DevOps workflows, and runs on an AWS EC2 instance.

---

## 🚀 Features

### ✔️ 1. Automated System Health Checks (Every 5 Minutes)
The script `system_health.sh` collects:

- CPU usage  
- RAM usage  
- Disk usage  
- Top 5 CPU-consuming processes  
- System uptime  
- NGINX service status  
- Timestamped log output  

Logs are stored in:

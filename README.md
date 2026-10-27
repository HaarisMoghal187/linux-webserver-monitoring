# Linux Web Server Monitoring & Recovery

A hands-on DevOps project using Ubuntu Linux, Apache, Bash scripting, and cron.

## Features

- Apache web server hosting a custom HTML website
- VirtualBox NAT port forwarding for Windows access
- Bash script to monitor Apache and HTTP status
- Automatic Apache recovery when the service stops
- Timestamped logging of health checks and recovery attempts
- Scheduled monitoring every five minutes using cron

## Technologies

- Ubuntu Linux
- Apache2
- Bash
- Cron
- Git

## Project Structure

- `scripts/health-check.sh` — Health checks and recovery
- `scripts/monitor.sh` — Scheduled read-only monitoring
- `logs/` — Local generated logs, excluded from Git

## How It Works

The monitoring script runs every five minutes using cron. It checks whether Apache is running and whether the website returns HTTP 200.

A separate recovery script can be run manually to attempt to restore Apache when it stops.

## What I Learned

- Linux service administration
- Troubleshooting using systemctl and journalctl
- HTTP testing using curl
- Bash conditionals and exit codes
- Automated service monitoring
- Cron scheduling
- Git version control

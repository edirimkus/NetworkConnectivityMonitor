# NetworkConnectivityMonitor

## Description
This PowerShell script monitors network connectivity to a specified URL and sends an email alert if it detects any loss of connectivity. It schedules the connectivity check to run every 10 minutes.

## Features
- **Monitors network connectivity** to a specified URL.
- **Sends an email alert** if connectivity is lost.
- **Schedules the task** to check connectivity every 10 minutes.

## Prerequisites
- Windows PowerShell
- Administrator privileges
- SMTP server details for sending email alerts

## Installation
1. Customize the target URL and email parameters (`$targetURL`, `$alertEmail`, `$smtpServer`, `$smtpPort`, `$smtpUser`, `$smtpPass`) with your own details.
2. Download and save the script as `NetworkConnectivityMonitor.ps1`.
3. Run the script in PowerShell with administrator privileges to set up the scheduled task.

## Usage
- The script will monitor network connectivity to the specified URL every 10 minutes.
- Sends an email alert if connectivity is lost.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

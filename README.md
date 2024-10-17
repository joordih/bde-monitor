# BDE-Monitor

A PowerShell script to monitor BitLocker encryption/decryption progress in real-time, showing updates only when the progress percentage changes.

![BDE-Monitor Demo]([https://raw.githubusercontent.com/joordih/bde-monitor/main/bde-monitor-preview.png](https://raw.githubusercontent.com/joordih/bde-monitor/refs/heads/main/bde-monitor-preview.png))

## Description

This script was born out of boredom while waiting for a BitLocker drive to decrypt. Instead of manually running `manage-bde -status` repeatedly to check the progress, this script automates the monitoring process and provides a clean, real-time view of the encryption/decryption status.

## Features

- Real-time monitoring of BitLocker encryption/decryption progress
- Clean, minimal interface that updates only when progress changes
- Automatic detection of process completion
- Low resource usage through optimized polling
- Support for both encryption and decryption monitoring

## Usage

1. Save the script as `bitlocker-monitor.ps1`
2. Open PowerShell as Administrator
3. Navigate to the script location
4. Run the script:
```powershell
powershell -ExecutionPolicy Bypass .\bitlocker-monitor.ps1
```

## How It Works

The script:
1. Polls the BitLocker status every 2 seconds
2. Updates the display only when the progress percentage changes
3. Automatically detects when the process completes
4. Provides clear status information throughout the process

## Sample Output
```
Monitoring BitLocker Status...
Status: [Decryption in Progress]
Progress: 44.5%

Waiting for progress changes...
```

## Requirements

- Windows OS with BitLocker capability
- PowerShell 5.1 or higher
- Administrator privileges

## Author

Created by Jordi Xavier Macho Ruiz while waiting for BitLocker to finish decrypting a drive. Because sometimes boredom leads to useful tools! 🛠️

---

**Note:** Always be cautious when running scripts that interact with BitLocker. Review the code before running it on your system.

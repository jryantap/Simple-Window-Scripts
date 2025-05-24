<#
.SYNOPSIS
  Checks if VMware Tools is disconnected (not running) and logs the event.

.DESCRIPTION
  This script periodically checks the "VMTools" Windows service status.
  If it's not running or not found, the script writes an entry to a log file
  and continues checking on an interval.

.PARAMETER CheckInterval
  Time in seconds between checks. Default = 60 seconds.

.PARAMETER LogFilePath
  Path to the log file where disconnection events will be recorded. 
  Default = "C:\VMware_Disconnect_Log.txt".
#>

param(
    [int]$CheckInterval = 60,
    [string]$LogFilePath = "C:\VMware_Disconnect_Log.txt"
)

Write-Host "Starting VMware Tools monitoring..."
Write-Host "Check Interval (seconds): $CheckInterval"
Write-Host "Log File: $LogFilePath"
Write-Host "Press [Ctrl] + [C] to stop if running in a console window."

while ($true) {
    try {
        $service = Get-Service -Name "VMTools" -ErrorAction SilentlyContinue
        if ($service) {
            # Service found; check status
            if ($service.Status -ne 'Running') {
                $message = "[{0}] VMware Tools NOT running. Current status: {1}" -f (Get-Date), $service.Status
                Add-Content -Path $LogFilePath -Value $message
            }
        } else {
            # Service not found at all
            $message = "[{0}] VMware Tools service not found!" -f (Get-Date)
            Add-Content -Path $LogFilePath -Value $message
        }
    }
    catch {
        # If anything unexpected happens, log the exception
        $message = "[{0}] ERROR checking VMware Tools: {1}" -f (Get-Date), $_.Exception.Message
        Add-Content -Path $LogFilePath -Value $message
    }
    
    Start-Sleep -Seconds $CheckInterval
}

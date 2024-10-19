# Define the target URL to test connectivity
$targetURL = "https://www.google.com"
$alertEmail = "your.email@example.com"
$smtpServer = "smtp.example.com"
$smtpPort = 587
$smtpUser = "your.email@example.com"
$smtpPass = "YourPassword"

# Function to test network connectivity
function Test-NetworkConnectivity {
    try {
        $response = Invoke-WebRequest -Uri $targetURL -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            Write-Output "Network connectivity is stable."
        } else {
            Send-AlertEmail
        }
    } catch {
        Send-AlertEmail
    }
}

# Function to send an alert email
function Send-AlertEmail {
    $subject = "Alert: Network Connectivity Issue Detected"
    $body = "The network connectivity to $targetURL was lost."
    Send-MailMessage -From $alertEmail -To $alertEmail -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -Credential (New-Object PSCredential($smtpUser, (ConvertTo-SecureString $smtpPass -AsPlainText -Force)))
    Write-Output "Alert email sent."
}

# Schedule the connectivity test to run every 10 minutes
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(10) -RepetitionInterval (New-TimeSpan -Minutes 10) -RepetitionDuration ([timeSpan]::MaxValue)
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File `"$PSScriptRoot\NetworkConnectivityMonitor.ps1`""
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "NetworkConnectivityMonitor" -Description "Monitors network connectivity and sends alerts" -User "$env:UserName" -RunLevel Highest -Force

# Run the connectivity test function
Test-NetworkConnectivity

$ErrorActionPreference = 'Stop'
$config = Get-Content ./appsettings.json | ConvertFrom-Json

while ($true) {
    Write-Output "$(Get-Date) - Sleeping for $($config.interval) seconds..."
    sleep $config.interval
    Write-Output "$(Get-Date) - message from appsettings.json - $($config.message)"    
}

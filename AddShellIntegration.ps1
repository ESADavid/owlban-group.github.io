# PowerShell script to add a Windows Explorer context menu item to run MoveFilesToLANAndOneDrive.ps1 on selected folder

param(
    [string]$ScriptPath = "$PSScriptRoot\\MoveFilesToLANAndOneDrive.ps1"
)

# Registry path for folder context menu
$regPath = "Registry::HKEY_CLASSES_ROOT\\Directory\\Background\\shell\\MoveToLANAndOneDrive"

try {
    # Create the registry key for the context menu
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Set-ItemProperty -Path $regPath -Name "(Default)" -Value "Move to LAN and OneDrive"
        Set-ItemProperty -Path $regPath -Name "Icon" -Value "powershell.exe"
    }

    # Create the command subkey
    $commandPath = "$regPath\\command"
    if (-not (Test-Path $commandPath)) {
        New-Item -Path $commandPath -Force | Out-Null
    }

    # Set the command to run the PowerShell script with the selected folder as parameter
    $command = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`" -LocalOneDrivePath `"%V`""
    Set-ItemProperty -Path $commandPath -Name "(Default)" -Value $command

    Write-Host "Shell integration added successfully. Right-click a folder background to use 'Move to LAN and OneDrive'."
}
catch {
    Write-Error "Failed to add shell integration: $_"
}

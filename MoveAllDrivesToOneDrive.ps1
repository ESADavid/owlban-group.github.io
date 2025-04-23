# PowerShell script to move all files from all fixed drives on the computer to the default OneDrive sync folder, excluding known protected system folders and additional problematic folders

param(
    [string]$OneDriveSyncPath = "C:\\Users\\Dell\\OneDrive"
)

# List of known protected system folders and additional problematic folders to exclude
$excludedFolders = @(
    "\$Recycle.Bin",
    "\System Volume Information",
    "\pagefile.sys",
    "\hiberfil.sys",
    "\swapfile.sys",
    "\Windows",
    "\Program Files",
    "\Program Files (x86)",
    "\ProgramData",
    "\Config.Msi",
    "\Documents and Settings",
    "\Intel",
    "\MSOCache",
    "\OneDriveTemp",
    "\PerfLogs",
    "\Recovery",
    "\System Repair",
    "\DumpStack.log.tmp",
    "\Users\All Users"
)

# Get all fixed drives
$fixedDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -ne $null -and $_.Root -ne $OneDriveSyncPath }

foreach ($drive in $fixedDrives) {
    $sourcePath = $drive.Root
    Write-Host "Copying files from drive $($drive.Name) ($sourcePath) to OneDrive sync folder..."

    # Get all top-level directories and files excluding the protected system folders
    $itemsToCopy = Get-ChildItem -Path $sourcePath -Force | Where-Object {
        $fullPath = $_.FullName
        $exclude = $false
        foreach ($excluded in $excludedFolders) {
            if ($fullPath.StartsWith($sourcePath.TrimEnd('\') + $excluded, [System.StringComparison]::OrdinalIgnoreCase)) {
                $exclude = $true
                break
            }
        }
        -not $exclude
    }

    foreach ($item in $itemsToCopy) {
        try {
            $destination = Join-Path -Path $OneDriveSyncPath -ChildPath $item.Name
            Copy-Item -Path $item.FullName -Destination $destination -Recurse -Force -ErrorAction Stop
            Write-Host "Copied $($item.FullName) successfully."
        }
        catch {
            Write-Warning "Failed to copy $($item.FullName): $_"
        }
    }
}

Write-Host "All drives processed. File transfer to OneDrive sync folder completed."

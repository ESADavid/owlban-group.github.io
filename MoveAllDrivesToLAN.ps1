# PowerShell script to move all files from all fixed drives on the computer to the Owlban LAN network shared folder using IP address

param(
    [string]$LANServerIP = "192.168.1.1",
    [string]$LANSharedFolderName = "SharedData"
)

# Construct LAN shared folder UNC path using IP address
$LANSharedFolderPath = "\\$LANServerIP\$LANSharedFolderName"

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

# Check if LAN shared folder exists
if (-Not (Test-Path -Path $LANSharedFolderPath)) {
    Write-Error "LAN shared folder does not exist. Please create the folder manually on the LAN server before running this script."
    exit 1
}

# Get all fixed drives
$fixedDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -ne $null }

foreach ($drive in $fixedDrives) {
    $sourcePath = $drive.Root
    Write-Host "Copying files from drive $($drive.Name) ($sourcePath) to LAN shared folder..."

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
            $destination = Join-Path -Path $LANSharedFolderPath -ChildPath $item.Name
            Copy-Item -Path $item.FullName -Destination $destination -Recurse -Force -ErrorAction Stop
            Write-Host "Copied $($item.FullName) successfully."
        }
        catch {
            Write-Warning "Failed to copy $($item.FullName): $_"
        }
    }
}

Write-Host "All drives processed. File transfer to LAN shared folder completed."

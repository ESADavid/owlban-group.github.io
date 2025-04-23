# PowerShell script to move files from OneDrive folder to LAN shared folder and OneDrive cloud folder
param(
    [string]$SourceFolder = "C:\Users\Dell\OneDrive",
    [string]$LANFolder = "\\OWLBAN-LAN-SERVER\SharedFolder",
    [string]$OneDriveFolder = "C:\Users\Dell\OneDrive\CloudBackup"
)

Write-Host "Starting file transfer from $SourceFolder to LAN folder $LANFolder and OneDrive folder $OneDriveFolder"

# Check if LAN folder is accessible
if (!(Test-Path -Path $LANFolder)) {
    Write-Error "LAN folder path $LANFolder is not accessible. Please check network connection and path."
    exit 1
}

# Check if OneDrive folder exists
if (!(Test-Path -Path $OneDriveFolder)) {
    Write-Host "OneDrive folder $OneDriveFolder does not exist. Creating it."
    New-Item -ItemType Directory -Path $OneDriveFolder -Force
}

# Copy files to LAN folder
Write-Host "Copying files to LAN folder..."
Copy-Item -Path "$SourceFolder\*" -Destination $LANFolder -Recurse -Force

# Copy files to OneDrive cloud folder
Write-Host "Copying files to OneDrive cloud folder..."
Copy-Item -Path "$SourceFolder\*" -Destination $OneDriveFolder -Recurse -Force

Write-Host "File transfer completed successfully."

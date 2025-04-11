# SharePoint Document Library Approval Automation

## Prerequisites
- PnP PowerShell module: `Install-Module -Name PnP.PowerShell`
- SharePoint admin permissions
- PowerShell 5.1 or later

## Configuration
1. Edit `config.json` with your settings:
   - `SiteUrl`: Your SharePoint site URL
   - `LibraryName`: Document library name
   - `Approvers`: Array of approver emails
   - `LogPath`: Path for log file

2. Sample configuration:
```json
{
    "SiteUrl": "https://contoso.sharepoint.com/sites/marketing",
    "LibraryName": "Proposals",
    "Approvers": ["manager@contoso.com", "director@contoso.com"],
    "LogPath": "./approvals.log"
}
```

## Usage
Run the configuration script:
```powershell
.\Enable-DocumentLibraryApprovals.ps1 -ConfigPath ".\config.json"
```

## Features
- Configures versioning and content approval
- Sets up approval workflow
- Detailed logging
- Error handling and validation

## Outputs
- `flow-config.json`: Generated workflow configuration
- `approval-setup.log`: Execution log

## Troubleshooting
- Check log files for errors
- Verify SharePoint admin permissions
- Ensure PnP PowerShell is installed

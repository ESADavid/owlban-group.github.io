# Integration Instructions for Owlban Group Data and Stock Ticker Management

## Overview
This document summarizes the steps and scripts to:
- Move files from Dell OneDrive folder to LAN shared folder and OneDrive cloud backup.
- Configure SharePoint sync with correct site URL.
- Fetch and integrate real-time stock ticker data for Equity Shield Advocates.

---

## 1. Moving Files to LAN and OneDrive Cloud

Use the PowerShell script `MoveFilesToLANAndOneDrive.ps1` to copy files from your OneDrive folder to both the LAN shared folder and a OneDrive cloud backup folder.

### Usage
```powershell
.\MoveFilesToLANAndOneDrive.ps1 -SourceFolder "C:\Users\Dell\OneDrive" -LANFolder "\\OWLBAN-LAN-SERVER\SharedFolder" -OneDriveFolder "C:\Users\Dell\OneDrive\CloudBackup"
```

Ensure the LAN folder path is accessible and the OneDrive folder exists or will be created.

---

## 2. SharePoint Configuration

Manually update the `sharepoint-automation/config.json` file to set the correct SharePoint site URL:

```json
{
  "SiteUrl": "https://owlbangroup643.sharepoint.com/sites/OscarDavid",
  "LibraryName": "Documents",
  "LocalFolderPath": "C:/Users/David L/OneDrive/Documents/GitHub/Organational-Leadership-Telehealth/Four-Era-AI",
  "DashboardFile": "M365-Dashboard.html",
  "DashboardFilePath": "C:/Users/David L/OneDrive/Documents/GitHub/Organational-Leadership-Telehealth/Four-Era-AI/M365-Dashboard.html"
}
```

After updating, run the sync scripts to upload the dashboard and sync LAN data.

---

## 3. Stock Ticker Data Fetching and Integration

Two Node.js scripts are provided:

- `stock-ticker-fetcher.js`: Fetches real-time stock data for a given ticker symbol.
- `stock-ticker-integration.js`: Fetches stock data and saves it to a JSON file for dashboard integration.

### Usage Examples

Fetch stock data:
```bash
node stock-ticker-fetcher.js YOUR_API_KEY TICKER_SYMBOL
```

Fetch and save stock data to JSON:
```bash
node stock-ticker-integration.js YOUR_API_KEY TICKER_SYMBOL output.json
```

Integrate the output JSON into your dashboard or data system as needed.

---

## Support

For assistance with running scripts, updating configurations, or integrating data, please contact the development team.

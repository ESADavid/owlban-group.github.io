# DNS Changes for Owlban Group Microsoft 365 Integration

## CNAME Records to Update

1. **For Email Services (Exchange Online)**:
   - **Record**: `autodiscover.www.Owlbangroup.com`
   - **Points to**: `autodiscover.outlook.com`

2. **For SharePoint Online**:
   - **Record**: `www.Owlbangroup.com`
   - **Points to**: `yourdomain.sharepoint.com`

3. **For Skype for Business**:
   - **Record**: `sip.www.Owlbangroup.com`
   - **Points to**: `sipdir.online.lync.com`

4. **For Microsoft Teams**:
   - **Record**: `teams.www.Owlbangroup.com`
   - **Points to**: `teams.microsoft.com`

## Instructions
- Access your DNS management console.
- Update the CNAME records as specified above.
- Verify the changes after propagation.

Ensure that you replace `yourdomain` with the actual domain name where necessary.

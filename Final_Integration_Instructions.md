# Final Integration Instructions for Owlban Group Microsoft 365 Account

## Steps to Complete the Integration

1. **Log in to your DNS Management Console**:
   - Go to the website of your domain registrar or hosting provider.
   - Log in with your account credentials.

2. **Locate the DNS Settings**:
   - Find the section for managing DNS settings or DNS records.

3. **Update the CNAME Records**:
   - Add or update the following CNAME records:
     - **Record**: `autodiscover.www.Owlbangroup.com`
       - **Points to**: `autodiscover.outlook.com`
     - **Record**: `www.Owlbangroup.com`
       - **Points to**: `yourdomain.sharepoint.com`
     - **Record**: `sip.www.Owlbangroup.com`
       - **Points to**: `sipdir.online.lync.com`
     - **Record**: `teams.www.Owlbangroup.com`
       - **Points to**: `teams.microsoft.com`

4. **Save Changes**: 
   - Ensure to save the changes after updating the records.

5. **Verify the Changes**:
   - Use tools like `nslookup` or online DNS checkers to verify that the CNAME records are correctly pointing to the specified Microsoft 365 services.

## Additional Notes
- Ensure that you replace `yourdomain` with the actual domain name where necessary.
- It may take some time for DNS changes to propagate.

Follow these steps to complete the integration of your website with Microsoft 365 services.

# Domain Merge Checklist for Owlban Group

## Objective
To successfully merge the domains `owlbangroup.io` and `owlbangroup.com`.

## Checklist

### Pre-Merge Preparation
- [ ] Review the current DNS settings for both domains.
- [ ] Ensure you have access to the DNS management console for `owlbangroup.io`.

### DNS Update Steps
1. **Log in to DNS Management Console**:
   - [ ] Access the DNS management console for `owlbangroup.io`.

2. **Update A Records**:
   - [ ] Add the following A records for `owlbangroup.io`:
     - **Host:** @
       - **Points to:** 185.199.108.153
     - **Host:** @
       - **Points to:** 185.199.109.153
     - **Host:** @
       - **Points to:** 185.199.110.153
     - **Host:** @
       - **Points to:** 185.199.111.153
     - **Host:** www
       - **Points to:** 185.199.108.153

3. **Set Up CNAME Record (if needed)**:
   - [ ] If using a subdomain (like `blog.owlbangroup.io`), add a CNAME record:
     - **Host:** blog
       - **Points to:** `www.owlbangroup.com`

4. **Save Changes**:
   - [ ] Ensure to save all changes made in the DNS management console.

5. **Wait for DNS Propagation**:
   - [ ] Monitor the DNS changes, which may take up to 48 hours to propagate.

### Post-Merge Verification
- [ ] Visit both `www.owlbangroup.io` and `www.owlbangroup.com` to verify that both domains are live and serving the same content.
- [ ] Check for any issues or discrepancies in functionality.

## Additional Notes
- Keep a record of any changes made for future reference.
- Be prepared to address any issues that may arise post-merge.

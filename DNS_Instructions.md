# DNS Management Instructions for www.Owlbangroup.com

To connect your custom domain `www.Owlbangroup.com` to GitHub Pages, follow these steps:

## Step 1: Set Up A Records
1. Log in to your domain registrar's website.
2. Navigate to the DNS management section.
3. Add the following A records:
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

## Step 2: Set Up CNAME Record (if needed)
If you want to use a subdomain (like `blog.Owlbangroup.com`), you can add a CNAME record:
- **Host:** blog
  - **Points to:** `www.Owlbangroup.com`

## Step 3: Save Changes
Make sure to save your changes in the DNS management section.

## Step 4: Wait for DNS Propagation
It may take some time for the DNS changes to propagate. This can take anywhere from a few minutes to 48 hours.

## Step 5: Verify the Setup
Once the DNS changes have propagated, visit `www.Owlbangroup.com` to verify that your site is live.

If you have any questions or need further assistance, feel free to reach out.

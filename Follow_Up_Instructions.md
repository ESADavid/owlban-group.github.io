# Follow-Up Instructions for DNS Setup

To complete the DNS setup for your custom domain `www.Owlbangroup.com`, please follow these steps:

1. **Log in to your domain registrar's website.**
2. **Navigate to the DNS management section.**
3. **Add the following A records:**
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
4. **Set up a CNAME record (if needed):**
   - **Host:** blog
     - **Points to:** `www.Owlbangroup.com`
5. **Save your changes in the DNS management section.**
6. **Wait for DNS propagation, which can take anywhere from a few minutes to 48 hours.**
7. **Verify the setup by visiting `www.Owlbangroup.com`.**

If you have any questions or need further assistance, feel free to reach out.

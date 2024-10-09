<div>

<div>

<div>

<div>

### 17.3.9. Set Up X.509 certificate issuer, HTTPS listener and generate ODS user's certificates

</div>

</div>

</div>

The following Step-by-Step guide walks you through set up of an X.509
certificate issuer and HTTPS listener, and generation of ODS user
certificates.

<div>

1.  Install <a
    href="http://download.openlinksw.com/packages/5.0/virtuoso/ods_framework_dav.vad"
    class="ulink" target="_top">ODS</a> and <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
    class="ulink" target="_top">Virtuoso Conductor</a> VAD packages.

    <div>

    <div>

    **Figure 17.7. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl6.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Go to the http://cname:port/identity_manager URL, enter the DBA user
    credentials in the dialog presented.

    <div>

    <div>

    **Figure 17.8. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl7.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Enter the Issuer details and click generate.

    <div>

    <div>

    **Figure 17.9. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl8.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Go to Conductor -\> Web Application Server -\> Virtual Domains &
    Directories, and add a new listener.

    <div>

    <div>

    **Figure 17.10. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl9.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Edit the new listener, and generate new key.

    <div>

    <div>

    **Figure 17.11. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl10.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Go to Packages list and select Configure for ODS Framework.

    <div>

    <div>

    **Figure 17.12. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl11.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select Create New Endpoint.

    <div>

    <div>

    **Figure 17.13. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl12.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Enter the home path for ODS, and save.

    <div>

    <div>

    **Figure 17.14. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl13.png)

    </div>

    </div>

    </div>

      

    </div>

9.  The new endpoint should now appear in the endpoint list.

    <div>

    <div>

    **Figure 17.15. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl14.png)

    </div>

    </div>

    </div>

      

    </div>

10. Go to the HTTPS site, e.g., https://cname:port/ods; in our example,
    https://localhost:4433/ods/. If Firefox is used, it will complain
    that the certificate is not valid, so we must register the site's
    certificate.

    <div>

    <div>

    **Figure 17.16. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl15.png)

    </div>

    </div>

    </div>

      

    </div>

11. In Firefox certificate manager, in Site's certificates, add an
    exception.

    <div>

    <div>

    **Figure 17.17. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl16.png)

    </div>

    </div>

    </div>

      

    </div>

12. Confirm exception.

    <div>

    <div>

    **Figure 17.18. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl17.png)

    </div>

    </div>

    </div>

      

    </div>

13. Return to ODS site, and register new user.

    <div>

    <div>

    **Figure 17.19. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl18.png)

    </div>

    </div>

    </div>

      

    </div>

14. Edit the user's profile and enter his/her name(s). If this step is
    skipped, the certificate will not have a human readable name.

    <div>

    <div>

    **Figure 17.20. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl19.png)

    </div>

    </div>

    </div>

      

    </div>

15. Open the Security tab in the Profile Editor, and generate the client
    key.

    <div>

    <div>

    **Figure 17.21. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl20.png)

    </div>

    </div>

    </div>

      

    </div>

16. If all is set up correctly, you should see this message. It means
    Firefox has the private key, and has obtained a new certificate from
    the server.

    <div>

    <div>

    **Figure 17.22. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl21.png)

    </div>

    </div>

    </div>

      

    </div>

17. Refresh the Security tab by clicking on same tab.

    <div>

    <div>

    **Figure 17.23. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl22.png)

    </div>

    </div>

    </div>

      

    </div>

18. Select automatic login option, and save.

    <div>

    <div>

    **Figure 17.24. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl23.png)

    </div>

    </div>

    </div>

      

    </div>

19. Log out from ODS and refresh browser to simulate opening the ODS
    site. The browser will ask for a certificate; select the one
    generated in the steps above.

    <div>

    <div>

    **Figure 17.25. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl24.png)

    </div>

    </div>

    </div>

      

    </div>

20. ODS presents your card, and asks to login with certificate. Confirm
    it.

    <div>

    <div>

    **Figure 17.26. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl25.png)

    </div>

    </div>

    </div>

      

    </div>

21. You should now be logged in to ODS via WebID Protocol.

    <div>

    <div>

    **Figure 17.27. Setting-Up issuer CA**

    <div>

    <div>

    ![Setting-Up issuer CA](images/ui/foafssl26.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

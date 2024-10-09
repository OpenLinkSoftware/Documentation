<div>

<div>

<div>

<div>

### 17.4.5. ODS Ubiquity Commands

</div>

</div>

</div>

ODS provides Ubiquity commands to manipulate user accounts as well as
instances and instance specific data using the ODS Controllers API. This
command set is available only for the Firefox browser with the Ubiquity
extension installed.

<div>

<div>

<div>

<div>

#### Installation

</div>

</div>

</div>

First, the Ubiquity Firefox extension must be installed. Then, ODS
Ubiquity commands can be installed by accessing
http://host:port/ods/ods_ubiquity.html page. Ubiquity commands are
accessed by the ctrl-space key combination.

</div>

<div>

<div>

<div>

<div>

#### Basic Session Setup Commands

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### ODS OAuth Endpoint Identification

</div>

</div>

</div>

Assuming the OAuth endpoint: http://myopenlink.net/OAuth, in order to
change it use the command:

``` programlisting
Syntax: ods-oauth-host <host_url>
Example: ods-oauth-host http://demo.openlinksw.com/OAuth
```

</div>

<div>

<div>

<div>

<div>

##### ODS Command Mode

</div>

</div>

</div>

There are two command modes available to ubiquity commands when working
against an ODS instance: oauth or sid.

In OAuth mode, for every ODS application instance, an OAuth key must be
obtained and then initialized via the following steps:

<div>

- obtain an ODS based OAuth session-key via the ODS example endpoint:
  http://host:port/ods/oauth_sid.vsp

  ``` programlisting
  http://myopenlink.net/ods/oauth_sid.vsp
  ```

- bind session key to command session via the command: \*ods-set-oauth
  \<oauth-key\>\* or use \*ods-set-\[class name\]-oauth \<oauth-key\>\*
  when oauth-key was generated for particular application instance.

</div>

If you choose the SID mode of interaction with ODS you have to perform
the following steps:

<div>

- set mode via command: ods-set-mode sid or ods-set-mode oauth

- set sid via command: ods-set-sid sid

</div>

Note: The sid is a session ID applicable to all ODS commands for a given
bound instance and user combination. It's obtained from an ODS session.

</div>

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

The following example demonstrates oauth authentication getting the
OAuth SID value for ex. for existing Bookmark instance "mybookmarks"
with owner user demo at the OpenLink Demo server.

In order to execute correctly the example, you need to have OAuth
Generate Key for the Bookmark "mybookmarks" instance at OpenLink Demo
server. More information and simple scenario how to be done you can find
<a href="voauthcontrollers.html" class="link"
title="17.4.4. OAuth Generate Keys for ODS Controllers (Web Services)">here.</a>

<div>

1.  Execute the command:

    ``` programlisting
    ods-oauth-host <host_url>
    -- for ex.:
    ods-oauth-host http://demo.openlinksw.com/OAuth
    ```

    <div>

    <div>

    **Figure 17.30. OAuth Authentication**

    <div>

    <div>

    ![OAuth Authentication](images/ui/keys3.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Execute the command:

    ``` programlisting
    ods-set-mode oauth
    ```

    <div>

    <div>

    **Figure 17.31. OAuth Authentication**

    <div>

    <div>

    ![OAuth Authentication](images/ui/keys4.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Obtain the OAuth Generated Key:

    <div>

    1.  Go to http://cname:port/ods/oauth_sid.vsp . For ex.
        http://demo.openlinksw.com/ods/oauth_sid.vsp

        <div>

        <div>

        **Figure 17.32. OAuth Authentication**

        <div>

        <div>

        ![OAuth Authentication](images/ui/keys5.png)

        </div>

        </div>

        </div>

          

        </div>

    2.  In the shown form enter user demo and choose the application
        "mybookmarks". Click the "Execute" button.

        <div>

        <div>

        **Figure 17.33. OAuth Authentication**

        <div>

        <div>

        ![OAuth Authentication](images/ui/keys6.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

4.  As result will be shown a form where you need to enter the user
    password.

5.  Enter for user demo its password and click the "Login" button.

    <div>

    <div>

    **Figure 17.34. OAuth Authentication**

    <div>

    <div>

    ![OAuth Authentication](images/ui/keys7.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click the "Authorize" button.

    <div>

    <div>

    **Figure 17.35. OAuth Authentication**

    <div>

    <div>

    ![OAuth Authentication](images/ui/keys8.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Copy the obtains OAuth SID value for ex.:
    7ef4dcf23869488823b771b09b952cc9

    <div>

    <div>

    **Figure 17.36. OAuth Authentication**

    <div>

    <div>

    ![OAuth Authentication](images/ui/keys9.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Execute the following command:

    ``` programlisting
    ods-set-sid 7ef4dcf23869488823b771b09b952cc9

    or

    ods-set-addressbook-oauth 7ef4dcf23869488823b771b09b952cc9
    ```

    <div>

    <div>

    **Figure 17.37. OAuth Authentication**

    <div>

    <div>

    ![OAuth Authentication](images/ui/keys10.png)

    </div>

    </div>

    </div>

      

    </div>

9.  You can also execute the command(s) depending on the application
    type:

    ``` programlisting
    ods-set-briefcase-oauth <the obtained oauth session-key>
    -- or
    ods-set-bookmark-oauth <the obtained oauth session-key>
    -- or
    ods-set-feeds-oauth <the obtained oauth session-key>
    -- or
    ods-set-calendar-oauth <the obtained oauth session-key>
    -- or
    ods-set-addressbook-oauth <the obtained oauth session-key>
    -- or
    ods-set-poll-oauth <the obtained oauth session-key>
    -- or
    ods-set-weblog-oauth <the obtained oauth session-key>
    -- or
    ods-set-discussion-oauth <the obtained oauth session-key>
    ```

</div>

<div>

|                            |                                                                                                  |
|:--------------------------:|:-------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                        |
|                            | the <a href="rdfsparqlprotocolendpoint.html#sparqloauthendpoint"                                 
                              class="link" title="SPARQL OAuth Endpoint">Virtuoso SPARQL OAuth                                  
                              Tutorial</a> and the full list of <a href="http://ods.openlinksw.com/wiki/ODS/VirtOAuthExamples"  
                              class="ulink" target="_top">ODS Application Authentication Examples                               
                              using OAuth</a>                                                                                   |

</div>

</div>

<div>

<div>

<div>

<div>

##### 

</div>

</div>

</div>

<div>

|                            |                                                                               |
|:--------------------------:|:------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                     |
|                            | the full list of <a                                                           
                              href="http://ods.openlinksw.com/dataspace/dav/wiki/ODS/VirtuosoOdsUbiquity"    
                              class="ulink" target="_top">ODS Ubiquity Commands</a> and the full list of <a  
                              href="http://ods.openlinksw.com/wiki/ODS/VirtuosoOdsUbiquityTutorialsOAuth"    
                              class="ulink" target="_top">OpenLink Data Spaces (ODS) Ubiquity Commands       
                              Tutorials</a>                                                                  |

</div>

</div>

</div>

</div>

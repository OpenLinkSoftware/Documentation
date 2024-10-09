<div>

<div>

<div>

<div>

### 17.4.6. OAuth Test Tool for ODS Controllers

</div>

</div>

</div>

The ODS OAuth Test Tool creates examples to show users the correct
format for constructing HTTP requests signed according to OAuth
specifications. The users use this format in their applications to make
successful requests to the ODS REST APIs.

The ODS users generate a Consumer Key and a Consumer Secret for their
application instances by ODS application UI (Setings -\> OAuth Keys).
You can find more information and sample scenario
<a href="voauthcontrollers.html" class="link"
title="17.4.4. OAuth Generate Keys for ODS Controllers (Web Services)">here.</a>

To reach a specific ODS resource via the ODS REST API, a user must also
specify a API method and associated API parameters.

ODS OAuth standards validate the credentials of an external user by
means of the digital signature. If the user signs the request, and the
ODS server validates the digital signature, the developer is granted
access to the requested resource.

To tool is accessible via http://host:port/ods/oauth_test.vsp

<div>

<div>

<div>

<div>

#### Example

</div>

</div>

</div>

The following example demonstrates creating and getting contact info by
the ODS REST APIs weblog.post.new and weblog.post.get using the OAuth
Test Tool.

<div>

1.  Go to http://demo.openlinksw.com/ods

2.  Log in as user demo with password demo

3.  Go to Settings-\>OAuth Keys

    <div>

    <div>

    **Figure 17.38. Weblog OAuth**

    <div>

    <div>

    ![Weblog OAuth](images/ui/keys11.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Copy the Token value for an Weblog instance or create such in not
    existing. For ex.:

    ``` programlisting
    150fd483a3219e09847676deebae6c725d5a0a03
    ```

5.  Go to http://demo.openlinksw.com/ods/oauth_test.vsp

6.  In the shown form enter for:

    <div>

    1.  Server: http://demo.openlinksw.com/ods/api

    2.  Consumer Key: 150fd483a3219e09847676deebae6c725d5a0a03

    3.  API method: weblog.post.new

    4.  API parameters:

        ``` programlisting
        inst_id=44&description=my test&title=my first post
        ```

        <div>

        - An easy way to get the instance id is using the ODS ubiquity
          commands sequence:

          ``` programlisting
          ods-host http://demo.openlinksw.com/ods
          ods-set-mode sid
          ods-authenticate-user demo password demo
          ods-get-instance-id demo's Weblog
          ```

        </div>

    5.  Select for Query options: "Generate URI and Submit".

        <div>

        <div>

        **Figure 17.39. Weblog OAuth**

        <div>

        <div>

        ![Weblog OAuth](images/ui/keys12.png)

        </div>

        </div>

        </div>

          

        </div>

    6.  Click the "Execute" button.

    7.  In the shown authorization form click the "Authorize" button.

        <div>

        <div>

        **Figure 17.40. Weblog OAuth**

        <div>

        <div>

        ![Weblog OAuth](images/ui/keys13.png)

        </div>

        </div>

        </div>

          

        </div>

    8.  As result will be shown the generated URI and the output message
        of executing the ODS REST API. In our case, the id of the new
        created post will be: 37

        <div>

        <div>

        **Figure 17.41. Weblog OAuth**

        <div>

        <div>

        ![Weblog OAuth](images/ui/keys14.png)

        </div>

        </div>

        </div>

          

        </div>

    9.  Now let's get the data for the created post. In the form enter:

        <div>

        1.  API method: weblog.get

        2.  API parameters: post_id=37

        3.  Select for Query options: "Generate URI and Submit".

        </div>

    10. Click the "Execute" button.

    11. As result in the "Response Body" text-area will be shown the
        retrieved details for the posts with the given above id.

        <div>

        <div>

        **Figure 17.42. Weblog OAuth**

        <div>

        <div>

        ![Weblog OAuth](images/ui/keys15.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

</div>

</div>

</div>

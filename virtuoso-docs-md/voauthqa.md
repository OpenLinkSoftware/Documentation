<div>

<div>

<div>

<div>

### 17.4.7. OAuth QA

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### MySpace Tools

</div>

</div>

</div>

In order to use the
<a href="http://developer.myspace.com/community/myspace/oauthintro.aspx"
class="ulink" target="_top">MySpace OAuth Testing Tool</a> :

<div>

1.  Need to have registered myspace account.

2.  Need to apply to build apps on the MySpace Developer Platform.

</div>

</div>

<div>

<div>

<div>

<div>

#### Google Tools

</div>

</div>

</div>

<a
href="http://code.google.com/apis/gdata/articles/oauth.html#OAuthPlayground"
class="ulink" target="_top">Google's OAuth playground tool</a> can be
tried
<a href="http://googlecodesamples.com/oauth_playground/" class="ulink"
target="_top">here</a> .

<div>

<div>

<div>

<div>

##### Register your domain in Google

</div>

</div>

</div>

In order to use the tool, you need to register the web application as
domain:

<div>

1.  Login at your gmail account

2.  Go to https://www.google.com/accounts/ManageDomains

3.  Enter in the field for ex. the QA server
    ec2-67-202-42-146.compute-1.amazonaws.com and click the "Add Domain"
    button.

    Note: for now registered domains cannot be deleted (not supported
    from the Google UI)

4.  As result the domain will be created and the manage domain page will
    be opened. Here you need to verify you have admin privileges by
    choosing verification method

5.  Choose "Upload an HTML file" and follow further the instructions.

6.  Once the file is put in the correct server root, you should get the
    confirmation page:

    <div>

    <div>

    **Figure 17.43. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys16.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click the "Agree .." buttons.

8.  As result will be additional setting page you need to change. Type
    in for "Target URL path prefix:":
    http://ec2-67-202-42-146.compute-1.amazonaws.com/ods

    <div>

    <div>

    **Figure 17.44. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys17.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click the "Save" button.

10. As result will be shown the generated OAuth Consumer Secret for the
    OAuth Consumer Key: ec2-67-202-42-146.compute-1.amazonaws.com:

    ``` programlisting
    OAuth Consumer Key:      ec2-67-202-42-146.compute-1.amazonaws.com
    OAuth Consumer Secret:  uEkfBvpMhTTT/VyFItEnEYt4
    ```

11. Also will be shown "test" link "Test your AuthSub registration
    here". Click it.

12. As result will be opened new window with OAuth request

13. Click the "Grant Access" button.

    <div>

    <div>

    **Figure 17.45. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys18.png)

    </div>

    </div>

    </div>

      

    </div>

14. As result will be redirected to
    http://ec2-67-202-42-146.compute-1.amazonaws.com/ods/

15. Now lets return to our initial window and click there the button
    "Save".

16. Note that already is shown for the domain that is "Active":

    <div>

    <div>

    **Figure 17.46. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys19.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

##### The Playground Tool qa steps

</div>

</div>

</div>

Let's try the playground tool:

<div>

1.  Go to http://googlecodesamples.com/oauth_playground/

2.  Select Scope, for ex. check the check-box for "Blogger".

3.  Change oauth signature_method to HMAC-SHA1

4.  Enter for "oauth consumer_key":
    ec2-67-202-42-146.compute-1.amazonaws.com

5.  Enter for "consumer secret" the value generated from above.

6.  Click the "Request token" button.

7.  As result will get Response with Status Ok

    <div>

    <div>

    **Figure 17.47. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys20.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    - the Signature base string:

      ``` programlisting
      GET&https%3A%2F%2Fwww.google.com%2Faccounts%2FOAuthGetRequestToken&oauth_consumer_key
      %3Dec2-67-202-42-146.compute-.amazonaws.com%26oauth_nonce%3D60f50c8800b2f52807732ca1ae3855ef
      %26oauth_signature_method%3DHMACSHA1%26oauth_timestamp%3D1224191856%26oauth_version%3D1.0
      %26scope%3Dhttp%253A%252F%252Fwww.blogger.com%252Ffeeds%252F
      ```

    - the Authorization header:

      ``` programlisting
      Authorization: OAuth oauth_version="1.0",
      oauth_nonce="60f50c8800b2f52807732ca1ae3855ef",
      oauth_timestamp="1224191856",
      oauth_consumer_key="ec2-67-202-42-146.compute-1.amazonaws.com",
      oauth_signature_method="HMAC-SHA1",
      oauth_signature="nohPMCw%2BMrO8%2FwslS4oEm2wfuhg%3D"
      ```

    - the Response body:

      ``` programlisting
      HTTP/1.1 200 OK
      Content-Type: text/plain; charset=UTF-8
      Date: Thu, 16 Oct 2008 21:17:37 GMT
      X-Content-Type-Options: nosniff
      Expires: Thu, 16 Oct 2008 21:17:37 GMT
      Cache-Control: private, max-age=0
      Content-Length: 76
      Server: GFE/1.3
       oauth_token=COW3iN_7HxCXqfuzAQ&oauth_token_secret=ulsD7N5SuY16qC%2FvY2Sdk3AS
      ```

    </div>

8.  And also in the "Get the Token" section now will be active the
    "Authorize" button. Click it.

    <div>

    <div>

    **Figure 17.48. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys21.png)

    </div>

    </div>

    </div>

      

    </div>

9.  As result will be shown the authentication page where you need to
    click the "Grant Access" button:

    <div>

    <div>

    **Figure 17.49. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys22.png)

    </div>

    </div>

    </div>

      

    </div>

10. As result now in the "Get the Token" section will be active the
    "Access token" button. Click it.

    <div>

    <div>

    **Figure 17.50. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys23.png)

    </div>

    </div>

    </div>

      

    </div>

11. As result the access_token will be obtained:

    <div>

    <div>

    **Figure 17.51. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys24.png)

    </div>

    </div>

    </div>

      

    </div>

12. Click the "available feeds" button marked as 6.

13. As result in the "Response" body section will be shown:

    ``` programlisting
    Blogger
    http://www.blogger.com/feeds/default/blogs
    http://www.blogger.com/feeds/<blogID>/posts/default
    http://www.blogger.com/feeds/<blogID>/[<postID>]/comments/default
    ```

14. Copy the 1st URL and paste in the field after the method GET.

15. Click "execute".

16. As result will find your blogs, post, info at Blogger:

    <div>

    <div>

    **Figure 17.52. Google OAuth**

    <div>

    <div>

    ![Google OAuth](images/ui/keys25.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 17.4.3. OAuth Implementation in OpenLink Data Spaces

</div>

</div>

</div>

OAuth tokens must be generated for each user account, for each ODS
application, via ODS -\> Settings -\> OAuth Keys. This UI provides a
list of all applications to which the logged-in user has access, i.e.,
of which the user is a member or owner. To enable access with OAuth, the
user simply selects the desired application instance from the list, and
clicks the 'generate keys' button. The generated Consumer Key and Secret
will be associated with the given ODS user account & application
instance.

Once a consumer token is available, the sequence below must be executed
in order to establish an authorized session:

<div>

1.  client uses request_token to get a token/secret pair for
    establishing session using consumer token

2.  client asks OAuth server to authorize the token from step 1.

3.  using authorized token from step 1 client asks OAuth server for
    authentication token.

4.  with authentication token from step 3, clients can access instance
    data associated with the consumer token from step 1.

</div>

<div>

<div>

<div>

<div>

#### Sample OAuth Client

</div>

</div>

</div>

To demonstrate the Virtuoso implementation of OAuth, we have written
this sample client, in Virtuoso/PL.

``` programlisting
<html>
<?vsp
    declare consumer_key, consumer_secret, oauth_token, oauth_secret, signature, timest, nonce varchar;
    declare srv, res, signature_base, ret_url, url, tmp, sid varchar;
    declare meth, pars any;
    consumer_key := {?'key'};
    srv := sprintf ('http://example.com:%s/OAuth/', server_http_port ());
    sid := null;
    res := '';

    sid :=  {?'sid'};
    if (sid = '')
      sid := null;
    else
      {
        -- if selected token is not same as one from the session we need to get new authentication token
        if (consumer_key <> OAUTH..get_consumer_key (sid))
      {
        OAUTH..session_terminate (sid);
            sid := null;
      }
      }

    meth := get_keyword ('meth', params, 'weblog.post.new');;
    pars := get_keyword ('pars', params, 'inst_id=15&title=testing&description=Some test post');;

    if ({?'rt'} is not null and sid is null) -- request new token for the session
      {
    url := srv||'request_token';
    url := OAUTH..sign_request ('GET', url, '', consumer_key, sid);
        res := http_get (url);
    sid := OAUTH..parse_response (sid, consumer_key, res);
    OAUTH..set_session_data (sid, params);
    ret_url := sprintf ('http://example.com:%s/oauth/oauth_client.vsp?ready=%U', server_http_port (), sid);
    -- call authorize
        url := sprintf ('%sauthorize?oauth_token=%U&oauth_callback=%U', srv, OAUTH..get_auth_token (sid), ret_url);
    http_status_set (301);
        http_header (sprintf ('Location: %s\r\n', url));
        return;
      }
    else if ({?'ready'} is not null) -- get access token
      {
    -- we go here when token above is authorized
        sid := {?'ready'};
    url := srv||'access_token';
    consumer_key := OAUTH..get_consumer_key (sid);
    url := OAUTH..sign_request ('GET', url, '', consumer_key, sid);
        res := http_get (url);
    sid := OAUTH..parse_response (sid, consumer_key, res);

      }
    if (sid is not null) -- access token is ready, and we can call API
      {
        -- here we are ready to call service
    if ({?'rt'} is null)
          {
            tmp := OAUTH..get_session_data (sid);
            pars := get_keyword ('pars', tmp, pars);
        meth := get_keyword ('meth', tmp, meth);
      }
    url := sprintf ('http://example.com:%s/ods/api/%s', server_http_port (), meth);
    tmp := split_and_decode (pars);
    params := '';
    for (declare i,l int, l:=length (tmp); i < l; i := i + 2)
       {
         params := params || sprintf ('%U=%U&', tmp[i], tmp[i+1]);
       }
    --params := sprintf ('inst_id=%d&description=%U&title=%U', 15, 'Some test post', 'testing');
    consumer_key := OAUTH..get_consumer_key (sid);
    url := OAUTH..sign_request ('GET', url, params, consumer_key, sid);
        res := http_get (url);
        --dbg_obj_print (res);
      }
?>
    <head><title>OAuth Client</title></head>
    <body>
    <h1>OAuth client for ODS Controllers</h1>
    <form method="POST" action="oauth_client.vsp">
    <input type="hidden" name="sid" value="<?V sid ?>"/>
    APPLICATION : <br /> <select name="key">
    <?vsp for select a_name, a_key from OAUTH..APP_REG do { ?>
        <option value="<?V a_key ?>" <?vsp if (consumer_key = a_key) http ('selected'); ?>><?V a_name ?></option>
    <?vsp } ?>
        </select>
    <?vsp
    if (sid is not null) http (sprintf (' TOKEN: %s', OAUTH..get_auth_token (sid)));
    ?>
    <br />
    ODS API: <br /><input type="text" name="meth" value="<?V meth ?>" size=50/> <br />
    PARAMETERS: <br /> <textarea name="pars" rows="5" cols="50"><?V pars ?></textarea> <br />
        <input type="submit" value="Execute" name="rt"/><br />
    </form>
    RESULT:
    <hr/>
    <pre><?V res ?></pre>
    </body>
</html>
```

</div>

<div>

<div>

<div>

<div>

#### Sample OAuth Session

</div>

</div>

</div>

The following shows a sample session, using the above Virtuoso/PL OAuth
client.

``` programlisting
GET /OAuth/request_token?oauth_consumer_key=50082d0fb861b0e6e67d5d986b8
333607edc5f36&oauth_nonce=b8f1089077cbce6e&oauth_signature_method=HMAC-
SHA1&oauth_timestamp=1211212829&oauth_version=1.0&oauth_signature=V1zmk
757LBHcmqVJ6obMhNX5hKA%3D HTTP/1.1
Host: example.com

HTTP/1.1 200 Ok
Content-Length: NNN
<CR/LF>
oauth_token=86da75079d3aee0fab57a36fcffbf900768e4de3&oauth_token_secret
=M...
```

``` programlisting
GET /OAuth/authorize?oauth_token=86da75079d3aee0fab57a36fcffbf900768e4d
e3&oauth_callback=http%3A//localhost%3A6666/oauth/oauth_client.vsp%3Fre
ady%3D00c874b2fab2f6424008b5064fe83e88 HTTP/1.1
Host: example.com

HTTP/1.1 301 Moved
Location: /ods/oauth_authorize.vspx?....
```

``` programlisting
GET /OAuth/access_token?oauth_consumer_key=50082d0fb861b0e6e67d5d986b83
33607edc5f36&oauth_nonce=242cc4875a0059f6&oauth_signature_method=HMAC-S
HA1&oauth_timestamp=1211212831&oauth_token=86da75079d3aee0fab57a36fcffb
f900768e4de3&oauth_version=1.0&oauth_signature=sqs/8nmNNnNJiZ/eBa688uNe
g9o%3D HTTP/1.1
Host: example.com

HTTP/1.1 200 Ok
Content-Length: NNN
<CR/LF>
oauth_token=N..&oauth_token_secret=M...
```

``` programlisting
GET /ods/api/weblog.post.new?description=Some%20test%20post&inst_id=15&
oauth_consumer_key=50082d0fb861b0e6e67d5d986b8333607edc5f36&oauth_nonce
=2f4765d20664e696&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1211
213321&oauth_token=db83a37d74faf53edc8ed56d418ded3a70fcc0bc&oauth_versi
on=1.0&title=testing&oauth_signature=oocIyr6kgoEQkC3WVwzvl6w62W4%3D HTT
P/1.1
Host: example.com

HTTP/1.1 200 Ok
Content-Length: NNN
<CR/LF>
<result><code>1&lt/code></result>
```

</div>

</div>

<div>

<div>

<div>

<div>

### 17.4.2. Virtuoso OAuth server

</div>

</div>

</div>

Virtuoso implements the OAuth Core 1.0 specification, and exposes the
following API endpoints:

<div>

<div>

<div>

<div>

#### Request token

</div>

</div>

</div>

Endpoint:

``` programlisting
http://server-cname/OAuth/request_token
```

Parameters:

<div>

- <span class="emphasis">*oauth_consumer_key* </span> : The Consumer
  Key.

- <span class="emphasis">*oauth_signature_method* </span> : The
  signature method the Consumer used to sign the request.

- <span class="emphasis">*oauth_signature* </span> . The signature as
  defined in Signing Requests (Signing Requests).

- <span class="emphasis">*oauth_timestamp* </span> : As defined in Nonce
  and Timestamp (Nonce and Timestamp).

- <span class="emphasis">*oauth_nonce* </span> : As defined in Nonce and
  Timestamp (Nonce and Timestamp).

- <span class="emphasis">*oauth_version* </span> : OPTIONAL. If present,
  value MUST be 1.0 .

</div>

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

Request:

``` programlisting
http://example.com/OAuth/request_token?oauth_version=1.0&oauth_nonce
=dad4cb071e2169cbcaa051d404ac61a3&oauth_timestamp=1201873644&oauth_cons
umer_key=f756023be5ff1f20881cf8fe398069f3976b2304&oauth_signature_metho
d=HMAC-SHA1&oauth_signature=z76k5fQ0msFsQzCmhO%2FJZ329ZUE%3D
```

Note: all long lines in example texts are split, i.e., the GET request
is single line.

Response:

``` programlisting
oauth_token=b4e22daa117b0bebf60ab6ba6e401edc7addd78c&oauth_token_secret
=4de6e3ab17553a0a385ebf6a3b4dd30f
```

</div>

</div>

<div>

<div>

<div>

<div>

#### Authorization

</div>

</div>

</div>

Endpoint:

``` programlisting
http://server-cname/OAuth/authorize
```

Parameters:

<div>

- <span class="emphasis">*oauth_token* </span> : The Request Token
  obtained in the previous step. The current implementation of the
  Service Provider declare this parameter as REQUIRED.

- <span class="emphasis">*oauth_callback*</span> : OPTIONAL. The
  Consumer MAY specify a URL the Service Provider will use to redirect
  the User back to the Consumer when Obtaining User Authorization
  (Obtaining User Authorization) is complete.

</div>

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

Request:

``` programlisting
http://example.com/OAuth/authorize?oauth_token=b4e22daa117b0bebf60ab
6ba6e401edc7addd78c&oauth_callback=http%3A%2F%2Flocalhost%3A8890%2Foaut
h%2Fexample%2Fclient.php%3Fkey%3Df756023be5ff1f20881cf8fe398069f3976b23
04%26secret%3Dcc249bfb732039d8ecba9e4f94fdead7%26token%3Db4e22daa117b0b
ebf60ab6ba6e401edc7addd78c%26token_secret%3D4de6e3ab17553a0a385ebf6a3b4
dd30f%26endpoint%3Dhttp%253A%252F%252Flocalhost%253A8890%252FOAuth%252F
authorize
```

The User will be asked via web page to accept or decline the token.

</div>

</div>

<div>

<div>

<div>

<div>

#### Access token

</div>

</div>

</div>

Endpoint:

``` programlisting
http://server-cname/OAuth/access_token
```

Parameters:

<div>

- <span class="emphasis">*oauth_consumer_key* </span> : The Consumer
  Key.

- <span class="emphasis">*oauth_token* </span> : The Request Token
  obtained previously.

- <span class="emphasis">*oauth_signature_method* </span> : The
  signature method the Consumer used to sign the request.

- <span class="emphasis">*oauth_signature*</span> : The signature as
  defined in Signing Requests (Signing Requests).

- <span class="emphasis">*oauth_timestamp* </span> : As defined in Nonce
  and Timestamp (Nonce and Timestamp).

- <span class="emphasis">*oauth_nonce* </span> : As defined in Nonce and
  Timestamp (Nonce and Timestamp).

- <span class="emphasis">*oauth_version* </span> : OPTIONAL. If present,
  value MUST be 1.0 .

</div>

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

Request:

``` programlisting
http://example.com/OAuth/access_token?oauth_version=1.0&oauth_nonce=
8ad75091a66bdd741472be42149c828e&oauth_timestamp=1201873800&oauth_consu
mer_key=f756023be5ff1f20881cf8fe398069f3976b2304&oauth_token=b4e22daa11
7b0bebf60ab6ba6e401edc7addd78c&oauth_signature_method=HMAC-SHA1&oauth_s
ignature=tCxy0Lod4%2Bp%2FCBPV7Ph7RrsHXe4%3D
```

Response:

``` programlisting
oauth_token=8c03b3da93480ca4728cc1194d6d03962f3bb5bb&oauth_token_secret
=854fd29c00adcedff4fbeaeb96584911
```

In addtion to the endpoints it define a API for PL applications to check
authentication:

</div>

</div>

<div>

<div>

<div>

<div>

#### Authentication verification

</div>

</div>

</div>

``` programlisting
OAUTH.DBA.check_authentication (in params any, in lines any)
```

Parameters:

<div>

- <span class="emphasis">*params* </span> : an array of strings
  representing the HTTP parameters

- <span class="emphasis">*lines* </span> : an array of HTTP request
  headers

</div>

Result:

<div>

- on success it returns integer 1,

- on failure it signal an SQL error.

</div>

<div>

<div>

<div>

<div>

##### Sample code:

</div>

</div>

</div>

A sample service (oauth.vsp):

``` programlisting
<html>
<body>
<?vsp
  OAUTH..check_authentication (params, lines);
?>
An OAuth testing page
</body>
</html>
```

</div>

<div>

<div>

<div>

<div>

##### Sample request:

</div>

</div>

</div>

``` programlisting
http://example.com/admin/oauth.vsp?oauth_version=1.0&oauth_nonce=d57
640869b994b2d51bf9800229c4997&oauth_timestamp=1201873935&oauth_consumer
_key=f756023be5ff1f20881cf8fe398069f3976b2304&oauth_token=8c03b3da93480
ca4728cc1194d6d03962f3bb5bb&oauth_signature_method=HMAC-SHA1&oauth_sign
ature=X3K4lr9bJVz5YLnnyJDkykQZivY%3D
```

</div>

<div>

<div>

<div>

<div>

##### Sample request:

</div>

</div>

</div>

``` programlisting
http://example.com/admin/oauth.vsp?oauth_version=1.0&oauth_nonce=d57
640869b994b2d51bf9800229c4997&oauth_timestamp=1201873935&oauth_consumer
_key=f756023be5ff1f20881cf8fe398069f3976b2304&oauth_token=8c03b3da93480
ca4728cc1194d6d03962f3bb5bb&oauth_signature_method=HMAC-SHA1&oauth_sign
ature=X3K4lr9bJVz5YLnnyJDkykQZivY%3D
```

</div>

<div>

<div>

<div>

<div>

##### Sample response:

</div>

</div>

</div>

``` programlisting
<html>
<body>
An OAuth testing page
</body>
</html>
```

</div>

</div>

</div>

<div>

<div>

</div>

<div>

## Name

vsp_calculate_digest — calculate on server-side a digest to perform a
HTTP digest authentication

</div>

<div>

## Synopsis

<div>

|                                   |                            |
|-----------------------------------|----------------------------|
| ` `**`vsp_calculate_digest`**` (` | in `username ` varchar ,   |
|                                   | in `password ` varchar ,   |
|                                   | in `credentials ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The vsp_calculate_digest() function is used to calculate on server-side
a digest to perform a HTTP digest authentication. When the
authentication type is 'digest' the function will return a md5 checksum
based on credentials, user name and password. The checksum calculation
will be made as required for HTTP Digest authentication to compare
against 'response' element of credentials. If the authentication is
basic a NULL will be returned.

</div>

<div>

## Parameters

<div>

### username

A string with name of the user account name

</div>

<div>

### password

A string with a plain text password from the users table (can be from
external LDAP server etc.)

</div>

<div>

### credentials

A vector of name/value pairs (the keyword and value are strings) of:

<div>

**Table 24.113. Valid values**

<div>

| Name     | Description                            |
|----------|----------------------------------------|
| authtype | 'digest' or 'basic'                    |
| realm    | from HTTP Authorization request header |
| method   | from HTTP request line                 |
| uri      | from HTTP Authorization request header |
| nonce    | from HTTP Authorization request header |
| nc       | from HTTP Authorization request header |
| cnonce   | from HTTP Authorization request header |
| qop      | from HTTP Authorization request header |
| response | the client-side calculated digest      |

</div>

</div>

  

</div>

</div>

<div>

## Return Types

A string containing md5 digest, if 'authtype' option is 'digest'.
Otherwise returns null.

</div>

<div>

## Examples

<div>

**Example 24.446. A VSP page performing digest authentication**

<div>

The following page check for digest authentication and returns OK if
authentication succeeds, otherwise it asks for authentication again.

``` programlisting
      <?vsp
      declare auth any;
      declare cs varchar;
      auth := app_auth_vec (lines);
      if (not isarray (auth))
        app_get_auth ();
      cs := vsp_calculate_digest ('u1', 'secret', auth);
      if (cs is not null and cs = get_keyword ('response',auth))
         http ('OK');
      else
        app_get_auth ();
      ?>

      -- making the HTTP Digest authentication header
      create procedure app_get_auth ()
       {
         http_request_status ('HTTP/1.1 401 Unauthorized');
     http_header (sprintf ('WWW-Authenticate: Digest realm="%s", domain="%s", nonce="%s", opaque="%s", stale="%s", qop="auth", algorithm="MD5"\r\n', 'my_realm', http_path(), md5 (datestring (now ())), md5 ('some string for hash'), 'false'));
       };

      -- returns an array suitable for vsp_calculate_digest
      create procedure app_auth_vec (in lines any)
       {
      declare ahdr, arr, authvec any;
      ahdr := http_request_header (lines, 'Authorization');
      if (isstring (ahdr) and ahdr like 'Digest%')
        {
          ahdr := subseq (ahdr, 6, length (ahdr));
          arr := split_and_decode (ahdr, 0, '\0\0,=');
          authvec := vector ('authtype', 'Digest', 'method', http_request_get ('REQUEST_METHOD'));
          foreach (varchar elm in arr) do
        {
          declare elm1 varchar;
          elm1 := trim (elm, '" ');
          authvec := vector_concat (authvec, vector (elm1));
        }
             }
       return authvec;
       }
      
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_vhost_define.html" class="link"
title="VHOST_DEFINE">vhost_define</a>

</div>

</div>

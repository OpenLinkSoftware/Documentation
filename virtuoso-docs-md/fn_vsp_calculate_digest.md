<div id="fn_vsp_calculate_digest" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vsp_calculate_digest — calculate on server-side a digest to perform a
HTTP digest authentication

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vsp_calculate_digest" class="funcsynopsis">

|                                   |                            |
|-----------------------------------|----------------------------|
| ` `**`vsp_calculate_digest`**` (` | in `username ` varchar ,   |
|                                   | in `password ` varchar ,   |
|                                   | in `credentials ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vsp_calculate_digest" class="refsect1">

## Description

The vsp_calculate_digest() function is used to calculate on server-side
a digest to perform a HTTP digest authentication. When the
authentication type is 'digest' the function will return a md5 checksum
based on credentials, user name and password. The checksum calculation
will be made as required for HTTP Digest authentication to compare
against 'response' element of credentials. If the authentication is
basic a NULL will be returned.

</div>

<div id="params_vsp_calculate_digest" class="refsect1">

## Parameters

<div id="id118677" class="refsect2">

### username

A string with name of the user account name

</div>

<div id="id118680" class="refsect2">

### password

A string with a plain text password from the users table (can be from
external LDAP server etc.)

</div>

<div id="id118683" class="refsect2">

### credentials

A vector of name/value pairs (the keyword and value are strings) of:

<div id="id118686" class="table">

**Table 24.114. Valid values**

<div class="table-contents">

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

<div id="ret_vsp_calculate_digest" class="refsect1">

## Return Types

A string containing md5 digest, if 'authtype' option is 'digest'.
Otherwise returns null.

</div>

<div id="examples_vsp_calculate_digest_01" class="refsect1">

## Examples

<div id="ex_vsp_calculate_digest_01" class="example">

**Example 24.446. A VSP page performing digest authentication**

<div class="example-contents">

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

<div id="seealso_vsp_calculate_digest_01" class="refsect1">

## See Also

<a href="fn_vhost_define.html" class="link"
title="VHOST_DEFINE">vhost_define</a>

</div>

</div>

<div id="fn_davlogins" class="section">

<div class="titlepage">

<div>

<div>

## 12.8. WebDAV Logins

</div>

</div>

</div>

`DB.DBA.DBEV_DAV_LOGIN (inout user_name varchar, in password varchar, in http_auth any, ) `

This function, if defined, will always be called by Virtuoso just before
a HTTP client is authenticated against the WebDAV Server. Three
parameters are available for audit purposes or any other pre-processing
purpose totally user definable.

<div class="orderedlist">

1.  <span class="emphasis">*user_name:*</span>

    |                                                                                            |
    |--------------------------------------------------------------------------------------------|
    | <span class="emphasis">*IN*</span> : the user name from the login data                     |
    | <span class="emphasis">*OUT*</span> : the user name used by WebDAV server for this request |

2.  <span class="emphasis">*password*</span> : the encrypted password
    that corresponding to the *`user_name`*

3.  <span class="emphasis">*http_auth*</span> : HTTP authentication
    information (see below)

</div>

The data structure of the *`http_auth`* is an array containing
name/value pairs as described below.

For HTTP Basic authentication:

|                                                            |
|------------------------------------------------------------|
| method - HTTP method : GET/POST/PUT etc.                   |
| authtype - string 'Basic'                                  |
| username - the same as *`user_name`* parameter             |
| pass - the password (in case of basic authentication only) |

For HTTP Digest authentication:

|                                                                                                      |
|------------------------------------------------------------------------------------------------------|
| method - HTTP method : GET/POST/PUT etc.                                                             |
| authtype - string 'Digest'                                                                           |
| username - the same as *`user_name`* parameter                                                       |
| realm - authentication realm                                                                         |
| qop - Indicates what "quality of protection" the client has applied to the message                   |
| algorithm - hashing algorithm used to create the checksum or digest                                  |
| uri - the URI from Request-URI of the Request-Line                                                   |
| nonce - data string which may be uniquely generated                                                  |
| nc - The nc-value is the hexadecimal count of the number of requests (including the current request) |
| cnonce - The cnonce-value is an opaque quoted string value provided by the client                    |
| opaque - string value provided by the server and returned by the client unchanged                    |
| response - string containing password hash as described in RFC 2617                                  |

An example of the *`http_auth`* value:

``` programlisting
    vector ('method', 'GET', 'authtype', 'basic', 'username', 'MyUser', 'pass', 'My!Secret')
    
```

This hook can be used to control how Virtuoso proceeds with the WebDAV
client login by responding to 3 possible return values:

|                                                                                    |
|------------------------------------------------------------------------------------|
| -1 - continue with normal verification                                             |
| 0 - reject the login                                                               |
| 1 - allow the login (the user returned should be a valid Virtuoso local user name) |

<div id="ex_dbev_dav_login" class="example">

**Example 12.8. Sample WebDAV Login Hook**

<div class="example-contents">

``` programlisting
create procedure
DB.DBA.DBEV_DAV_LOGIN (inout user_name varchar, in pwd any, in auth any)
{
  declare result any;

  WHENEVER SQLSTATE '28000' GOTO validation_failure;

  -- All accounts that are not WebDAV admin are going here
  if (lcase(user_name) <> 'dav')
    {
      declare pass any;

      -- use password from request if basic HTTP authentication is used
      if (get_keyword ('authtype', auth) = 'basic')
        pass := get_keyword ('pass', auth);
      else -- or use the password from database if digest
        pass := pwd_magic_calc (user_name, pwd, 1);

      -- set appropriate LDAP protocol version
      connection_set ('LDAP_VERSION', 2);
      commit work;
      result := LDAP_SEARCH('ldap://mail2.openlinksw.com:389',
        0, 'ou=Accounts, o=OpenLink Software, c=US', sprintf ('(uid=%s)', user_name),
        sprintf('uid=%s, ou=Accounts, o=OpenLink Software, c=US', user_name),
                pass);
      return 1;
    }
  -- normal authentication for WebDAV admin
  return -1;

  -- all accounts that are not authenticated by LDAP are rejected
validation_failure:
  return 0;
};
```

</div>

</div>

  

</div>

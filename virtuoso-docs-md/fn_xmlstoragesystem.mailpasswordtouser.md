<div>

<div>

</div>

<div>

## Name

xmlStorageSystem.mailPasswordToUser — Mail password to user.

</div>

<div>

## Synopsis

<div>

|                                                           |                         |
|-----------------------------------------------------------|-------------------------|
| `structure `**`xmlStorageSystem.mailPasswordToUser`**` (` | in `email ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This method is used to send the password for user identified by email.
To work properly the default SMTP server Virtuoso INI file setting must
be set properly.

</div>

<div>

## Parameters

<div>

### email

For user identification, this should be a valid email account.

</div>

</div>

<div>

## Return Types

This method returns a structure as follows:

``` programlisting
    'flError' boolean           0 success, 1 fault
    'message' string            fault message (can be used to handle error cases)
```

</div>

<div>

## Examples

<div>

**Example 24.539. Mailing the XML Storage System Users Password to the
User**

<div>

Simple example of mailing the users password.

``` screen
    SQL> SOAP_CLIENT (url=>'http://example.com/xmlStorageSystem',
    operation=>'mailPasswordToUser', parameters=>vector ('email','user@example.domain'));

    SOAP response:

    <mailPasswordToUserResponse>
      <Result>
    <flError>1</flError>
    <message>Mail service is not available on that server.</message>
      </Result>
    </mailPasswordToUserResponse>
```

Note : in this case emailing was failed

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmlstoragesystem.registeruser.html" class="link"
title="xmlStorageSystem.registerUser"><code
class="function">xmlStorageSystem.registerUser() </code></a>

<a href="fn_xmlstoragesystem.getservercapabilities.html" class="link"
title="xmlStorageSystem.getServerCapabilities"><code
class="function">xmlStorageSystem.getServerCapabilities() </code></a>

<a href="fn_xmlstoragesystem.deletemultiplefiles.html" class="link"
title="xmlStorageSystem.deleteMultipleFiles"><code
class="function">xmlStorageSystem.deleteMultipleFiles() </code></a>

<a href="fn_xmlstoragesystem.savemultiplefiles.html" class="link"
title="xmlStorageSystem.saveMultipleFiles"><code
class="function">xmlStorageSystem.saveMultipleFiles() </code></a>

</div>

</div>

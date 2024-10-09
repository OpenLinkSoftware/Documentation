<div>

<div>

</div>

<div>

## Name

xmlStorageSystem.getServerCapabilities — Retrieve server specific
information.

</div>

<div>

## Synopsis

<div id="fsyn_xmlstoragesystem.getservercapabilities"
class="funcsynopsis">

|                                                              |                            |
|--------------------------------------------------------------|----------------------------|
| `structure `**`xmlStorageSystem.getServerCapabilities`**` (` | in `email ` string ,       |
|                                                              | in `password ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This method is used to obtain information about the capabilities of the
server, such as files size limitations, supported types, etc...

</div>

<div id="params_xmlstoragesystem.getservercapabilities"
class="refsect1">

## Parameters

<div>

### email

For user identification, this should be a valid email account.

</div>

<div>

### password

The MD5 hash of the password.

</div>

</div>

<div>

## Return Types

This method returns a structure as follows:

``` programlisting
    'flError' boolean           0 success, 1 fault
    'message' string            fault message (can be used to handle error cases)
     ctBytesInUse integer       how many bytes are used on repository
     legalFileExtensions string array   which extensions are recognized
     maxBytesPerUser integer        total bytes available for this user
     maxFileSize integer        largest file size for upload (bytes)
     yourUpstreamFolderUrl string   base URL for user's blog on repository
```

</div>

<div id="examples_xmlstoragesystem.getservercapabilities"
class="refsect1">

## Examples

<div>

**Example 24.540. Retrieving the XML Storage System Capabilities**

<div>

Simple example of fetching the server capabilities.

``` screen
    SQL> SOAP_CLIENT (url=>'http://example.com/xmlStorageSystem',
    operation=>'getServerCapabilities', parameters=>vector
    ('email','user@example.domain', 'password', md5('xxx'));

    SOAP response:

    <getServerCapabilitiesResponse>
       <Result>
     <ctBytesInUse>14</ctBytesInUse>
     <flError>0</flError>
       <legalFileExtensions>
         <item>ai</item>
         <item>aif</item>
         <item>aifc</item>
       </legalFileExtensions>
     <maxBytesPerUser>41943040</maxBytesPerUser>
     <maxFileSize>1048576</maxFileSize>
     <message />
     <yourUpstreamFolderUrl>http://example.com/DAV/user@example.domain/blog/</yourUpstreamFolderUrl>
       </Result>
    </getServerCapabilitiesResponse>
```

</div>

</div>

  

</div>

<div id="seealso_xmlstoragesystem.getservercapabilities"
class="refsect1">

## See Also

<a href="fn_xmlstoragesystem.registeruser.html" class="link"
title="xmlStorageSystem.registerUser"><code
class="function">xmlStorageSystem.registerUser() </code></a>

<a href="fn_xmlstoragesystem.mailpasswordtouser.html" class="link"
title="xmlStorageSystem.mailPasswordToUser"><code
class="function">xmlStorageSystem.mailPasswordToUser() </code></a>

<a href="fn_xmlstoragesystem.deletemultiplefiles.html" class="link"
title="xmlStorageSystem.deleteMultipleFiles"><code
class="function">xmlStorageSystem.deleteMultipleFiles() </code></a>

<a href="fn_xmlstoragesystem.savemultiplefiles.html" class="link"
title="xmlStorageSystem.saveMultipleFiles"><code
class="function">xmlStorageSystem.saveMultipleFiles() </code></a>

</div>

</div>

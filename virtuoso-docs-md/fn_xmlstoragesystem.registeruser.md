<div id="fn_xmlstoragesystem.registeruser" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xmlStorageSystem.registerUser — Register a user with the XML Storage
System

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmlstoragesystem.registeruser" class="funcsynopsis">

|                                                     |                                |
|-----------------------------------------------------|--------------------------------|
| `structure `**`xmlStorageSystem.registerUser`**` (` | in `email ` string ,           |
|                                                     | in `name ` string ,            |
|                                                     | in `password ` string ,        |
|                                                     | in `clientPort ` integer ,     |
|                                                     | in `userAgent ` string ,       |
|                                                     | in `serialNumber ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmlstoragesystem.registeruser" class="refsect1">

## Description

This method allows users to register within XML Storage System. The
actions performed on the server are:

|                                                                     |
|---------------------------------------------------------------------|
| make a new Web account named \<email\> with the password specified. |
| make a home-folder in WebDAV repository as /DAV/\<email\>.          |
| make a sub-folder called "blog".                                    |

</div>

<div id="params_xmlstoragesystem.registeruser" class="refsect1">

## Parameters

<div id="id124890" class="refsect2">

### email

For user identification, this should be a valid email account.

</div>

<div id="id124893" class="refsect2">

### name

A human readable name for the user account.

</div>

<div id="id124896" class="refsect2">

### password

The password for authentication. Note that this is the only call that
sends the password in clear-text. All other functions send the password
as a MD5 hash.

</div>

<div id="id124899" class="refsect2">

### clientPort

Currently ignored and reserved for future use.

</div>

<div id="id124902" class="refsect2">

### userAgent

Currently ignored and reserved for future use.

</div>

<div id="id124905" class="refsect2">

### serialNumber

Currently ignored and reserved for future use.

</div>

</div>

<div id="ret_xmlstoragesystem.registeruser" class="refsect1">

## Return Types

This method returns a structure as follows:

``` programlisting
    'usernum' string    account id
    'flError' boolean   0 success, 1 fault
    'message' string    fault message (can be used to handle error cases)
```

</div>

<div id="examples_xmlstoragesystem.registeruser" class="refsect1">

## Examples

<div id="ex_xmlstoragesystem" class="example">

**Example 24.538. Registering a new user**

<div class="example-contents">

``` screen
SQL> SOAP_CLIENT (url=>'http://example.com/xmlStorageSystem',
         operation=>'registerUser', parameters=>vector
        ('email','user@example.domain', 'name', 'Somebody Name',
         'password', 'xxx', 'clientPort', 0, 'userAgent', '' , 'serialNumber', ''));

    - SOAP response
    <registerUserResponse>
      <Result>
    <usernum>user@example.domain</usernum>
    <flError>0</flError>
    <message>Welcome, Somebody Name</message>
      </Result>
    </registerUserResponse>
```

</div>

</div>

  

</div>

<div id="seealso_xmlstoragesystem.registeruser" class="refsect1">

## See Also

<a href="fn_xmlstoragesystem.mailpasswordtouser.html" class="link"
title="xmlStorageSystem.mailPasswordToUser"><code
class="function">xmlStorageSystem.mailPasswordToUser() </code></a>

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

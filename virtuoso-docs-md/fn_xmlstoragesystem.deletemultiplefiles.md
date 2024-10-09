<div>

<div>

</div>

<div>

## Name

xmlStorageSystem.deleteMultipleFiles — Remove files from XML Storage
System Directory

</div>

<div>

## Synopsis

<div id="fsyn_xmlstoragesystem.deletemultiplefiles"
class="funcsynopsis">

|                                                            |                                   |
|------------------------------------------------------------|-----------------------------------|
| `structure `**`xmlStorageSystem.deleteMultipleFiles`**` (` | in `email ` string ,              |
|                                                            | in `password ` string ,           |
|                                                            | in `relativepathList ` array `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This method is used for removing files from the repository.

</div>

<div>

## Parameters

<div>

### email

For user identification, this should be a valid email account.

</div>

<div>

### password

The MD5 hash of the password.

</div>

<div>

### relativepathList

Array of strings of paths relative to the `<user home>/blog` folder in
WebDAV to be deleted.

</div>

</div>

<div>

## Return Types

This method returns a structure as follows:

``` programlisting
    'flError' boolean           0 success, 1 fault
    'message' string            fault message (can be used to handle error cases)
    'errorList' array of string     contains a list of errors corresponding to files
                      which cannot be removed.  Successfully deleted files have an empty string.
```

</div>

<div id="examples_xmlstoragesystem.deletemultiplefiles"
class="refsect1">

## Examples

<div>

**Example 24.541. Using the XML Storage System to Delete Multiple
Files**

<div>

Simple example of removing a file.

``` screen
    SQL> SOAP_CLIENT (url=>'http://example.com/xmlStorageSystem', operation=>'deleteMultipleFiles',
     parameters=>vector ('email','user@example.domain', 'password', md5('xxx'),
       'relativepathList', vector ('test.txt'));

    - SOAP Response

    <deleteMultipleFilesResponse>
      <Result>
       <flError>0</flError>
       <message />
       <errorList>
     <item />
       </errorList>
      </Result>
    </deleteMultipleFilesResponse>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmlstoragesystem.registeruser.html" class="link"
title="xmlStorageSystem.registerUser"><code
class="function">xmlStorageSystem.registerUser() </code></a>

<a href="fn_xmlstoragesystem.mailpasswordtouser.html" class="link"
title="xmlStorageSystem.mailPasswordToUser"><code
class="function">xmlStorageSystem.mailPasswordToUser() </code></a>

<a href="fn_xmlstoragesystem.getservercapabilities.html" class="link"
title="xmlStorageSystem.getServerCapabilities"><code
class="function">xmlStorageSystem.getServerCapabilities() </code></a>

<a href="fn_xmlstoragesystem.savemultiplefiles.html" class="link"
title="xmlStorageSystem.saveMultipleFiles"><code
class="function">xmlStorageSystem.saveMultipleFiles() </code></a>

</div>

</div>

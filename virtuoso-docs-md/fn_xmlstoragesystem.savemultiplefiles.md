<div id="fn_xmlstoragesystem.savemultiplefiles" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xmlStorageSystem.saveMultipleFiles — Upload a set of files to XML
Storage System directory.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmlstoragesystem.savemultiplefiles" class="funcsynopsis">

|                                                          |                                |
|----------------------------------------------------------|--------------------------------|
| `structure `**`xmlStorageSystem.saveMultipleFiles`**` (` | in `email ` string ,           |
|                                                          | in `password ` string ,        |
|                                                          | in `relativepathList ` array , |
|                                                          | in `fileTextList ` array `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmlstoragesystem.savemultiplefiles" class="refsect1">

## Description

This method allows users to upload a set of files. The files will be
stored in WebDAV repository and will be accessible via HTTP.

</div>

<div id="params_xmlstoragesystem.savemultiplefiles" class="refsect1">

## Parameters

<div id="id125111" class="refsect2">

### email

For user identification, this should be a valid email account.

</div>

<div id="id125114" class="refsect2">

### password

The MD5 hash of the password.

</div>

<div id="id125117" class="refsect2">

### relativepathList

Array of strings of target paths relative to the `<user home>/blog`
folder in WebDAV.

</div>

<div id="id125121" class="refsect2">

### fileTextList

An array of strings containing the contents of the files to be uploaded.
These must be in the same sequence as the relativepathList. i.e.
relativepathList\[i\] is name for fileTextList\[i\].

</div>

</div>

<div id="ret_xmlstoragesystem.savemultiplefiles" class="refsect1">

## Return Types

This method returns a structure as follows:

``` programlisting
    'flError' boolean           0 success, 1 fault
    'message' string            fault message (can be used to handle error cases)
    'urllist' array of string   contains list of URLs corresponding to uploaded files
    'yourUpstreamFolderUrl' string  base URL for upload
```

</div>

<div id="examples_xmlstoragesystem.savemultiplefiles" class="refsect1">

## Examples

<div id="ex_xmlstoragesystem.savemultiplefiles" class="example">

**Example 24.542. Using the XML Storage System to Save Multiple Files**

<div class="example-contents">

Simple example of saving a file.

``` screen
    - Invocation:

    SQL> SOAP_CLIENT (url=>'http://example.com/xmlStorageSystem', operation=>'saveMultipleFiles',
    parameters=>vector ('email','user@example.domain', 'password', md5('xxx'),
      'relativepathList', vector ('test.txt'), 'fileTextList', vector ('this is a test'));

    - SOAP Response

    <saveMultipleFilesResponse>
      <Result>
    <flError>0</flError>
    <message />
    <urllist>
      <item>http://example.com/DAV/user@example.domain/blog/test.txt</item>
    </urllist>
    <yourUpstreamFolderUrl>http://example.com/DAV/user@example.domain/blog/</yourUpstreamFolderUrl>
      </Result>
    </saveMultipleFilesResponse>
```

</div>

</div>

  

</div>

<div id="seealso_xmlstoragesystem.savemultiplefiles" class="refsect1">

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

<a href="fn_xmlstoragesystem.deletemultiplefiles.html" class="link"
title="xmlStorageSystem.deleteMultipleFiles"><code
class="function">xmlStorageSystem.deleteMultipleFiles() </code></a>

</div>

</div>
<div>

<div>

</div>

<div>

## Name

tmp_file_name — returns the unique file name within temporary directory
of the operating system

</div>

<div>

## Synopsis

<div>

|                                   |                           |
|-----------------------------------|---------------------------|
| `varchar `**`tmp_file_name`**` (` | in `prefix ` varchar ,    |
|                                   | in `suffix ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The following function is used to obtain unique name of a file, which is
located in temporary directory on file system. The two optional
parameters can be supplied: prefix of the file and extension for it.
These will be prepended and appended (dot MUST be omitted) to the unique
string. The directory where this file is located depends of \$TMPDIR or
%TMP% environment settings for UNIX's and Windows platforms
respectively. If these environment settings are not available or empty,
the defaults will be used for the operation system. (in practice for
most UNIX's it's /tmp or /var/tmp directory). Note that this function do
NOT open the file, it only give us a name.

</div>

<div>

## Parameters

<div>

### prefix

prefix to the file name to be added. MUST be at most five characters.

</div>

<div>

### suffix

extension to the file to be added, the leading dot MUST be omitted.

</div>

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

<div>

## Examples

<div>

**Example 24.418. Getting a unique file name**

<div>

``` programlisting
      SQL> select tmp_file_name('FOO', 'EXT');
      callret
      VARCHAR
      ________________________________________

      /tmp/FOOFoCnq5.EXT

      1 Rows. -- 7 msec.
      
```

</div>

</div>

  

</div>

</div>

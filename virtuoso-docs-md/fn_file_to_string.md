<div>

<div>

</div>

<div>

## Name

file_to_string — returns the contents of a file as a varchar

</div>

<div>

## Synopsis

<div>

|                                    |                         |
|------------------------------------|-------------------------|
| `varchar `**`file_to_string`**` (` | in `path ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

Returns the contents of a file as a varchar value. The file's length is
limited to 16 MB. The path is relative to the working directory of the
database server.

</div>

<div>

## Parameters

<div>

### path

Path name of the file to read.

</div>

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

</div>

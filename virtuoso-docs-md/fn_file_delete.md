<div>

<div>

</div>

<div>

## Name

file_delete — Delete a file from the file system

</div>

<div>

## Synopsis

<div>

|                                 |                           |
|---------------------------------|---------------------------|
| `integer `**`file_delete`**` (` | in `path ` varchar ,      |
|                                 | in `silent ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function is used to delete a file from file system. This function
has a silent mode, where no errors will be signalled upon failure.

</div>

<div>

## Parameters

<div>

### path

Path name of the file to delete.

</div>

<div>

### silent

Flag which if true (integer 1) will suppress signalling file system
errors.

</div>

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

</div>

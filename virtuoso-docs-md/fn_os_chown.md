<div>

<div>

</div>

<div>

## Name

os_chown — changes the owning group/user of a file

</div>

<div>

## Synopsis

<div>

|                       |                              |
|-----------------------|------------------------------|
| ` `**`os_chown`**` (` | in `path ` varchar ,         |
|                       | in `username ` varchar ,     |
|                       | in `groupname ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

`os_chown ` set the owning user/group of an OS file by calling the
system function chown() with the arguments supplied.

Not all the host OSes support the concept of owner users and groups.
That's why the function will not throw an SQL error if it fails.

It will return DB NULL value when the function was executed successfully
and the error message as a string if it failed.

The function first looks up the user and group name supplied into the OS
database to get the user and group IDs. it then calls the system
function chown().

The DirsAllowed and DirsDenied lists in Parameters section of the
virtuoso configuration file (virtuoso.ini by default) are used to
control disk access.

</div>

<div>

## Parameters

<div>

### path

<span class="type">varchar </span> relative path.

</div>

<div>

### username

<span class="type">varchar </span> the name of the OS user to own the
file.

</div>

<div>

### groupname

<span class="type">varchar </span> the name of the OS group to own the
file.

</div>

</div>

<div>

## Examples

<div>

**Example 24.243. Simple example**

<div>

Sets the ownership of the virtuoso INI file to virtuoso user and group

``` screen
SQL>select os_chown (virtuoso_ini_path(), 'virtuoso', 'virtuoso');
callret
VARCHAR
_______________________________________________________________________________

NULL
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete </code></a>

<a href="fn_file_stat.html" class="link" title="file_stat"><code
class="function">file_stat </code></a>

<a href="fn_os_chown.html" class="link" title="os_chown"><code
class="function">os_chown </code></a>

<a href="fn_virtuoso_ini_path.html" class="link"
title="virtuoso_ini_path"><code
class="function">virtuoso_ini_path </code></a>

</div>

</div>

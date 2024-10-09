<div>

<div>

</div>

<div>

## Name

VHOST_REMOVE — remove a virtual host or virtual directory

</div>

<div>

## Synopsis

<div>

|                                       |                             |
|---------------------------------------|-----------------------------|
| `Void DB.DBA. `**`VHOST_REMOVE`**` (` | in `vhost ` varchar ,       |
|                                       | in `lhost ` varchar ,       |
|                                       | in `lpath ` varchar ,       |
|                                       | in `del_vsps ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`vhost_remove ` is used to remove virtual hosts and virtual paths on the
Virtuoso HTTP server. Effectively this procedure deletes a row in the
table `DB.DBA.HTTP_PATH ` . Virtuoso supports both flavours of virtual
hosting: IP-based and name-based.

</div>

<div>

## Parameters

<div>

### *`vhost `*

A <span class="type">string </span> containing the virtual host name
that the browser presents as Host: entry in the request headers. i.e.
Name-based virtual hosting. Default value as defined in the Virtuoso INI
file.

</div>

<div>

### *`lhost `*

A <span class="type">string </span> containing the address of the
network interface the Virtuoso HTTP server uses to listen and accept
connections. Default value as defined in the Virtuoso INI file.

</div>

<div>

### *`lpath `*

A <span class="type">string </span> containing the path component of the
URI for the logical path.

</div>

<div>

### *`del_vsps `*

if a positive number will indicate to the server to drop all
compilations of VSP files in this domain. Default value is 0.

</div>

</div>

<div>

## Return Types

The return is VOID.

</div>

<div>

## Examples

<div>

**Example 24.443. Removing Virtual Host Definitions**

<div>

``` screen
SQL> VHOST_REMOVE (vhost=>'www.foo.com:8889',
  lhost=>'host.foo.com:8889',
  lpath=>'/appsimple');
```

Now, attempts to retrieve http://www.foo.com:8889/ will be rejected.

</div>

</div>

  

</div>

<div>

## See Also

The <a href="ch-webappdevelopment.html#webserver" class="link"
title="14.1. The HTTP Server">Virtuoso Web Server</a> Chapter in the
Virtuoso Manual for discussion on this topic.

<a href="fn_vhost_remove.html" class="link"
title="VHOST_REMOVE">vhost_remove</a> .

</div>

</div>

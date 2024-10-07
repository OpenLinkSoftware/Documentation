<div id="fn_vhost_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VHOST_REMOVE — remove a virtual host or virtual directory

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vhost_remove" class="funcsynopsis">

|                                       |                             |
|---------------------------------------|-----------------------------|
| `Void DB.DBA. `**`VHOST_REMOVE`**` (` | in `vhost ` varchar ,       |
|                                       | in `lhost ` varchar ,       |
|                                       | in `lpath ` varchar ,       |
|                                       | in `del_vsps ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vhost_remove" class="refsect1">

## Description

`vhost_remove ` is used to remove virtual hosts and virtual paths on the
Virtuoso HTTP server. Effectively this procedure deletes a row in the
table `DB.DBA.HTTP_PATH ` . Virtuoso supports both flavours of virtual
hosting: IP-based and name-based.

</div>

<div id="params_vhost_remove" class="refsect1">

## Parameters

<div id="id118547" class="refsect2">

### *`vhost `*

A <span class="type">string </span> containing the virtual host name
that the browser presents as Host: entry in the request headers. i.e.
Name-based virtual hosting. Default value as defined in the Virtuoso INI
file.

</div>

<div id="id118552" class="refsect2">

### *`lhost `*

A <span class="type">string </span> containing the address of the
network interface the Virtuoso HTTP server uses to listen and accept
connections. Default value as defined in the Virtuoso INI file.

</div>

<div id="id118557" class="refsect2">

### *`lpath `*

A <span class="type">string </span> containing the path component of the
URI for the logical path.

</div>

<div id="id118562" class="refsect2">

### *`del_vsps `*

if a positive number will indicate to the server to drop all
compilations of VSP files in this domain. Default value is 0.

</div>

</div>

<div id="ret_vhost_remove" class="refsect1">

## Return Types

The return is VOID.

</div>

<div id="examples_vhost_remove" class="refsect1">

## Examples

<div id="ex_vhost_remove" class="example">

**Example 24.443. Removing Virtual Host Definitions**

<div class="example-contents">

``` screen
SQL> VHOST_REMOVE (vhost=>'www.foo.com:8889',
  lhost=>'host.foo.com:8889',
  lpath=>'/appsimple');
```

Now, attempts to retrieve http://www.foo.com:8889/ will be rejected.

</div>

</div>

  

</div>

<div id="seealso_vhost_remove" class="refsect1">

## See Also

The <a href="ch-webappdevelopment.html#webserver" class="link"
title="14.1. The HTTP Server">Virtuoso Web Server</a> Chapter in the
Virtuoso Manual for discussion on this topic.

<a href="fn_vhost_remove.html" class="link"
title="VHOST_REMOVE">vhost_remove</a> .

</div>

</div>

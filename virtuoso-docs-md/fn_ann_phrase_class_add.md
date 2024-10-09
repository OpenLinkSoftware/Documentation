<div>

<div>

</div>

<div>

## Name

DB.DBA.ANN_PHRASE_CLASS_ADD — Returns APC_ID of a phrase class.

</div>

<div>

## Synopsis

<div>

|                                          |                             |
|------------------------------------------|-----------------------------|
| ` `**`DB.DBA.ANN_PHRASE_CLASS_ADD`**` (` | in `_name ` varchar ,       |
|                                          | in `_owner_uid ` integer ,  |
|                                          | in `_reader_gid ` integer , |
|                                          | in `_callback ` varchar ,   |
|                                          | in `_app_env ` any ,        |
|                                          | in `mode ` varchar ,        |
|                                          | in `auth_uname ` varchar ,  |
|                                          | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The returned value is APC_ID of a class if positive or an error code if
negative. To update phrase class, no special
DB.DBA.ANN_PHRASE_CLASS_UPDATE() exists, use
DB.DBA.ANN_PHRASE_CLASS_ADD() with parameter "mode" equal to
'replacing'.

</div>

<div>

## Parameters

<div>

### \_name

a name of new phrase class

</div>

<div>

### \_owner_uid

owner UID, will be stored as APC_OWNER_UID, can be NULL for public

</div>

<div>

### \_reader_gid

reader GID, will be stored as APC_READER_GID, can be NULL for public

</div>

<div>

### \_callback

value for APC_CALLBACK field

</div>

<div>

### \_app_env

value for APC_APP_ENV field

</div>

<div>

### mode

Instructs what to do on attempt of writing over existing class: 'into'
will signal, 'soft' return APC_ID of (unchanged) existing class,
'replacing' will continue with update.

</div>

<div>

### auth_uname

Authentication name

</div>

<div>

### auth_pwd

Authentication password

</div>

</div>

<div>

## Examples

<div>

**Example 24.292. ANN_PHRASE_CLASS_ADD**

<div>

``` programlisting
SQL>select ANN_PHRASE_CLASS_ADD ('My check', null, null, null, 'My check visa', '', 'dba', 'dba');
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.

SQL>select ANN_PHRASE_CLASS_ADD ('Paid ads', null, null, null, 'Paid ads env', 'replacing', 'dba', 'dba');
callret
VARCHAR
_______________________________________________________________________________

2

1 Rows. -- 261 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_ann_phrase_class_del.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_DEL"><code
class="function">DB.DBA.ANN_PHRASE_CLASS_DEL </code></a>

<a href="fn_ap_build_match_list.html" class="link"
title="AP_BUILD_MATCH_LIST"><code
class="function">AP_BUILD_MATCH_LIST </code></a>

</div>

</div>

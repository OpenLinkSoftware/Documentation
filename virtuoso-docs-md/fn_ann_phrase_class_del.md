<div id="fn_ann_phrase_class_del" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.ANN_PHRASE_CLASS_DEL — Deletes phrase set.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ann_phrase_class_del" class="funcsynopsis">

|                                          |                             |
|------------------------------------------|-----------------------------|
| ` `**`DB.DBA.ANN_PHRASE_CLASS_DEL`**` (` | in `_name ` varchar ,       |
|                                          | in `auth_uname ` varchar ,  |
|                                          | in `auth_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ann_phrase_class_del" class="refsect1">

## Description

The returned value is APS_ID of a deleted phrase set if positive or an
error code if negative. A phrase set can not be deleted while used by
some advertiser (as described
<a href="sqlreffastphrasematchsadv.html" class="link"
title="9.33.3. Advertisers and Advertisement Rules">here</a> ).

</div>

<div id="params_ann_phrase_class_del" class="refsect1">

## Parameters

<div id="id103082" class="refsect2">

### \_name

a name of phrase set to delete

</div>

<div id="id103085" class="refsect2">

### auth_uname

Authentication name

</div>

<div id="id103088" class="refsect2">

### auth_pwd

Authentication password

</div>

</div>

<div id="examples_ann_phrase_class_del" class="refsect1">

## Examples

<div id="ex_ann_phrase_class_del" class="example">

**Example 24.293. ANN_PHRASE_CLASS_DEL**

<div class="example-contents">

``` programlisting
SQL>select ANN_PHRASE_CLASS_ADD ('simple test', null, null, null, '123', '', 'dba', 'dba');
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.

SQL>select ANN_PHRASE_CLASS_DEL ('simple test', 'dba', 'dba');
callret
VARCHAR
_______________________________________________________________________________

1

1 Rows. -- 70 msec.
```

</div>

</div>

  

</div>

<div id="seealso_ann_phrase_class_del" class="refsect1">

## See Also

<a href="fn_ann_phrase_class_add.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_ADD"><code
class="function">DB.DBA.ANN_PHRASE_CLASS_ADD </code></a>

<a href="fn_ap_build_match_list.html" class="link"
title="AP_BUILD_MATCH_LIST"><code
class="function">AP_BUILD_MATCH_LIST </code></a>

</div>

</div>

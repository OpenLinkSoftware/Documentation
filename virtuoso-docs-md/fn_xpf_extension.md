<div id="fn_xpf_extension" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xpf_extension — declare an XPath extension function

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xpf_extension" class="funcsynopsis">

|                                |                                   |
|--------------------------------|-----------------------------------|
| `void `**`xpf_extension`**` (` | in `fname ` varchar ,             |
|                                | in `procedure_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xpf_extension" class="refsect1">

## Description

This function is used to declare a new XPath extension function or
redefine an existing function. It can be used in XPath queries and XSLT
stylesheets. You should use QNames for extension functions. Note that
the standard XPath functions cannot be redefined.

`xpf_extension()` stores the functions into the SYS_XPF_EXTENSIONS
system table.

``` programlisting
      CREATE TABLE
        DB.DBA.SYS_XPF_EXTENSIONS (
        XPE_NAME VARCHAR PRIMARY KEY,
        XPE_PNAME VARCHAR
        )
    
```

The input parameters will be retrieved as a strings and then will be
converted to the datatype of the corresponding argument of the stored
procedure.

</div>

<div id="params_xpf_extension" class="refsect1">

## Parameters

<div id="id124400" class="refsect2">

### fname

The name of the extension function, which must be the expanded QName of
the extension function

</div>

<div id="id124403" class="refsect2">

### procedure_name

The fully qualified name of the PL procedure which acts as the extension
function. The procedure in question must be granted to PUBLIC, otherwise
it will not be registered and error will be signalled.

</div>

</div>

<div id="ret_xpf_extension" class="refsect1">

## Return Types

None (void).

</div>

<div id="errors_xpf_extension" class="refsect1">

## Errors

<div id="id124411" class="table">

**Table 24.136. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                   | Description                                                               |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| <span class="errorcode">42001 </span> | <span class="errorcode">XPE01 </span> | <span class="errortext">The function \<procedure_name\> does not exists </span>                              | if procedure to define as a XPATH extension function is not existing one. |
| <span class="errorcode">42001 </span> | <span class="errorcode">XPE02 </span> | <span class="errortext">The \<built-in XPATH\|XQUERY\> function " \<func name\>" cannot be re-defined</span> | if XPATH or XQUERY function to be registered is a core function.          |

</div>

</div>

  

</div>

<div id="examples_xpf_extension" class="refsect1">

## Examples

<div id="ex_xpf_extension" class="example">

**Example 24.531. Declaring a New XSLT Function**

<div class="example-contents">

First define a PL procedure, then declare an XPath extension function
and to represent it.

``` programlisting
SQL> create procedure DB.DBA.str_concat (in a varchar, in b varchar)
     {
       return concat (a, ':', b);
     };

SQL> xpf_extension ('http://example.com/virtuoso/xslt:concat_strings', 'DB.DBA.str_concat');
```

The source of the (\[http_root\]/ext.xsl) XSLT stylesheet

``` programlisting
<?xml version='1.0'?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/TR/WD-xsl"
  xmlns:virt="http://example.com/virtuoso/xslt">

  <xsl:template match="/doc">
    <HTML>
     <BODY>
     <xsl:if test="function-available('virt:concat_strings')">
      <xsl:value-of select="virt:concat_strings ('foo', 'bar')"/>
     </xsl:if>
     </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
```

The source of the

``` programlisting
([http_root]/ext.vsp)
```

VSP page:

``` programlisting
<?vsp
  http_xslt ('file:/ext.xsl');
?>
<doc>
<a/>
</doc>
```

This will produce the following HTML page:

``` programlisting
<HTML><BODY>foo:bar</BODY></HTML>
```

Using the definition of the XPath extension function, we can include it
in XPath expressions.

``` programlisting
SQL> select p from ws..sys_dav_res
where xpath_contains (RES_CONTENT,
'[xmlns:virt=''http://example.com/virtuoso/xslt'']
virt:concat_strings (''Title '', string(/chapter/title))', p);
```

This will return the contents of any '/chapter/title' nodes, prefixed
with constant string 'Title'.

</div>

</div>

  

</div>

<div id="seealso_xpf_extension" class="refsect1">

## See Also

<a href="fn_xpf_extension_remove.html" class="link"
title="xpf_extension_remove"><code
class="function">xpf_extension_remove </code></a>

</div>

</div>

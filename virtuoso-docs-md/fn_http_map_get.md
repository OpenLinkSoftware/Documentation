<div id="fn_http_map_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_map_get — get values from HTTP virtual host path mapping table

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_map_get" class="funcsynopsis">

|                           |                                 |
|---------------------------|---------------------------------|
| ` `**`http_map_get`**` (` | in `element_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_map_get" class="refsect1">

## Description

Retrieves information associated with the virtual host / HTTP path
mapping in effect for the VSP page being processed. Values valid in
current connection or URL context may be retrieved by *`element_name`* .

Calling `http_map_get` has no use outside of http context. In this case
an error will be signalled.

</div>

<div id="params_http_map_get" class="refsect1">

## Parameters

<div id="id93074" class="refsect2">

### element_name

The possible values for element_name are: 'vsp_uid', 'soap_uid',
'persist_ses_vars', 'default_page', 'browseable', 'security_level' ,
'auth_opts', 'soap_opts', 'domain', 'mounted'.

</div>

</div>

<div id="ret_http_map_get" class="refsect1">

## Return Types

Value returned depends of *`element_name `* :

<div id="id93081" class="table">

**Table 24.42. Values returned by http_map_get**

<div class="table-contents">

| element_name     | Datatype                           | Return value                                                       |
|------------------|------------------------------------|--------------------------------------------------------------------|
| vsp_uid          | <span class="type">VARCHAR </span> | Which SQL user active content will execute as                      |
| soap_uid         | <span class="type">VARCHAR </span> | Which SQL user SOAP calls will be executed as                      |
| persist_ses_vars | <span class="type">INTEGER </span> | Is persisting of session variables enabled?                        |
| default_page     | <span class="type">VARCHAR </span> | Default page for current mapping                                   |
| browseable       | <span class="type">INTEGER </span> | Is directory browsing enabled?                                     |
| security_level   | <span class="type">VARCHAR </span> | Security level ('DIGEST', 'SSL', 'BASIC')                          |
| auth_opts        | <span class="type">ANY </span>     | Application-specific authentication options                        |
| soap_opts        | <span class="type">ANY </span>     | Application-specific SOAP options                                  |
| domain           | <span class="type">VARCHAR </span> | Directory path that is the logical start point of current mapping. |
| mounted          | <span class="type">VARCHAR </span> | Physical path that is the physical start point of current mapping  |

</div>

</div>

  

</div>

<div id="examples_http_map_get" class="refsect1">

## Examples

<div id="ex_http_map_get" class="example">

**Example 24.170. Retrieving Mapping Details**

<div class="example-contents">

``` screen
<?vsp
declare def_page varchar;
def_page := http_map_get ('default_page');
http (sprintf ('<p>The default page for this path is: %s </p>', def_page));
?>
```

</div>

</div>

  

<div id="ex_http_map_get_2" class="example">

**Example 24.171. Warn users if non-SSL connection**

<div class="example-contents">

``` screen
<HTML>
  <HEAD>
    <TITLE>TEST</TITLE>
  </HEAD>
  <BODY>
    <P>We're executing as <?= http_map_get ('vsp_uid') ?></P>
<?vsp
    if (http_map_get ('security_level') <> 'SSL')
      {
?>
    Warning: This page is not protected by transport level encryption
    and may be viewable by anybody in the middle with a network
    sniffer.
<?vsp
      }
?>
  </BODY>
</HTML>
```

</div>

</div>

  

</div>

</div>

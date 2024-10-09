<div>

<div>

</div>

<div>

## Name

http_map_get — get values from HTTP virtual host path mapping table

</div>

<div>

## Synopsis

<div>

|                           |                                 |
|---------------------------|---------------------------------|
| ` `**`http_map_get`**` (` | in `element_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Retrieves information associated with the virtual host / HTTP path
mapping in effect for the VSP page being processed. Values valid in
current connection or URL context may be retrieved by *`element_name`* .

Calling `http_map_get` has no use outside of http context. In this case
an error will be signalled.

</div>

<div>

## Parameters

<div>

### element_name

The possible values for element_name are: 'vsp_uid', 'soap_uid',
'persist_ses_vars', 'default_page', 'browseable', 'security_level' ,
'auth_opts', 'soap_opts', 'domain', 'mounted'.

</div>

</div>

<div>

## Return Types

Value returned depends of *`element_name `* :

<div>

**Table 24.41. Values returned by http_map_get**

<div>

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

<div>

## Examples

<div>

**Example 24.170. Retrieving Mapping Details**

<div>

``` screen
<?vsp
declare def_page varchar;
def_page := http_map_get ('default_page');
http (sprintf ('<p>The default page for this path is: %s </p>', def_page));
?>
```

</div>

</div>

  

<div>

**Example 24.171. Warn users if non-SSL connection**

<div>

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

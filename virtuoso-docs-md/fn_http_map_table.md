<div>

<div>

</div>

<div>

## Name

http_map_table — Update internal HTTP mapping table

</div>

<div>

## Synopsis

<div>

|                             |                                                   |
|-----------------------------|---------------------------------------------------|
| ` `**`http_map_table`**` (` | in `logical_path ` varchar ,                      |
|                             | in `physical_path ` varchar ,                     |
|                             | in `vhost ` varchar ,                             |
|                             | in `listen_host ` varchar ,                       |
|                             | in `stored_in_dav ` integer ,                     |
|                             | in `is_browseable ` integer ,                     |
|                             | in `default_page ` varchar ,                      |
|                             | in `security_restriction ` varchar ,              |
|                             | in `authentication ` varchar ,                    |
|                             | in `auth_function ` varchar ,                     |
|                             | in `postprocess_function ` varchar ,              |
|                             | in `execute_vsp_as ` varchar ,                    |
|                             | in `execute_soap_as ` varchar ,                   |
|                             | in `have_persistent_session_variables ` integer , |
|                             | in `soap_options ` any ,                          |
|                             | in `auth_options ` any `)`;                       |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function inserts an entry defining a virtual directory into the
HTTP maps table.

</div>

<div>

## Parameters

<div>

### logical_path

The absolute path string which the user agent will pass to the server in
path part of URI

</div>

<div>

### physical_path

The absolute path of the real content. For directories or WebDAV
collections physical_path MUST end with a slash '/' character, otherwise
the point will be treated as a file (or resource).

</div>

<div>

### vhost

The host name that will be sent to the user-agent in HTTP request. This
MUST be valid fully-qualified host name or alias and port separated with
semi-column ':' character. This parameter accept special value '\*ini\*'
which will be replaced with hostname and port from INI file.

</div>

<div>

### listen_host

The fully-qualified host name or IP address and port which will be
listened on. Warning: This is only used to make an in-memory mapping,
and will not start listening (for starting and stopping a listener see
<a href="fn_http_listen_host.html" class="link"
title="http_listen_host"><code
class="function">http_listen_host </code></a> ).

</div>

<div>

### stored_in_dav

Determine if the physical location is a WebDAV resource or collection.
Can accept zero or one (1) integer values.

</div>

<div>

### is_browseable

Determine if directory browsing is allowed for this location. Accepts
integer values 0 or 1, treated as false and true respectively. If true
(1) enabled and a default page is not specified, a GET request of an URL
pointing to this location will generate a directory listing as a
response to the user-agent.

</div>

<div>

### default_page

File name of default page that will be sent to the user-agent if
*`physical_path `* is a directory.

</div>

<div>

### security_restriction

A keyword that denotes security type controlling access to the location.
Can be 'Digest', 'SSL' or NULL. This value can be used in the
`auth_function` hook using
<a href="fn_http_map_get.html" class="link" title="http_map_get"><code
class="function">http_map_get </code></a> .

</div>

<div>

### authentication

A string value that will be passed as a parameter to the
`auth_function ` hook

</div>

<div>

### auth_function

Fully qualified name of a PL procedure that will perform HTTP
authentication. The function must accept one input parameter of type
<span class="type">VARCHAR</span> and MUST return integer 0 or 1 as
false or true, respectively. A zero return value from the authentication
function will cause the HTTP request to be rejected.

</div>

<div>

### postprocess_function

Fully qualified name of a PL procedure that will be called every time
after page processing. Usual purpose is to store session variables in a
session table.

</div>

<div>

### execute_vsp_as

The name of DB user, as whom VSP pages will be executed. If the user is
not specified (is null), execution is forbidden.

</div>

<div>

### execute_soap_as

The name of DB user, as whom SOAP calls will be executed. If null,
execution of SOAP calls is forbidden.

</div>

<div>

### have_persistent_session_variables

Flag that determines if the location has persistent session variables.
The value of this flag can be retrieved with
<a href="fn_http_map_get.html" class="link" title="http_map_get"><code
class="function">http_map_get </code></a> .

</div>

<div>

### soap_options

A vector with keyword/value pairs. Currently, valid keywords are
'Namespace' and 'ServiceName'. Namespace is a string defining the
namespace for the SOAP service. ServiceName is a string containing name
of the SOAP service. See example.

</div>

<div>

### auth_options

The value of this parameter can be used in the authentication hook. In
practice an array of keyword/value pairs would be the input but a single
string could be supplied. The user-specific authentication hook can
retrieve the options by calling the
<a href="fn_http_map_get.html" class="link" title="http_map_get"><code
class="function">http_map_get('auth_opts')</code></a> function.

</div>

</div>

<div>

## Examples

<div>

**Example 24.168. Inserting A Map Entry**

<div>

``` screen
http_map_table ('/vdir', '/admin/', 'www.foo.com', 'host.foo.com');
```

</div>

</div>

  

<div>

**Example 24.169. Create entry for a SOAP service**

<div>

``` screen
http_map_table ('/soapapp', '/soapapp/', 'www.foo.com', 'host.foo.com', NULL,
                 NULL, NULL, 'SSL', 'SOAP_APP', 'mysoapapp_auth_hook', 'mysoapapp_post_processor',
                 NULL, 'mysoapapp_user', 1, vector ('NameSpace', 'http://example.com/soap/v11/',
                                                  'ServiceName','soapApp'));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_map_get.html" class="link" title="http_map_get"><code
class="function">http_map_get </code></a>

<a href="fn_http_listen_host.html" class="link"
title="http_listen_host"><code
class="function">http_listen_host </code></a>

<a href="ch-webappdevelopment.html#wsauth" class="link"
title="14.1.3. Authentication">HTTP Authentication in main
documentation</a>

<a href="ch-webappdevelopment.html#wssessman" class="link"
title="14.1.4. Session Management">HTTP Session Management</a> in main
documentation .

</div>

</div>

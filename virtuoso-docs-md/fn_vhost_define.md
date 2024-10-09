<div>

<div>

</div>

<div>

## Name

VHOST_DEFINE — define a virtual host or virtual directory

</div>

<div>

## Synopsis

<div>

|                                       |                                    |
|---------------------------------------|------------------------------------|
| `Void DB.DBA. `**`VHOST_DEFINE`**` (` | in `vhost ` varchar ,              |
|                                       | in `lhost ` varchar ,              |
|                                       | in `lpath ` varchar ,              |
|                                       | in `ppath ` varchar ,              |
|                                       | in `is_dav ` boolean ,             |
|                                       | in `is_brws ` boolean ,            |
|                                       | in `def_page ` varchar ,           |
|                                       | in `auth_fn ` varchar ,            |
|                                       | in `realm ` varchar ,              |
|                                       | in `ppr_fn ` varchar ,             |
|                                       | in `vsp_user ` varchar ,           |
|                                       | in `soap_user ` varchar ,          |
|                                       | in `sec ` varchar ,                |
|                                       | in `ses_vars ` boolean ,           |
|                                       | in `soap_opts ` any ,              |
|                                       | in `auth_opts ` any ,              |
|                                       | in `opts ` any ,                   |
|                                       | in `is_default_host ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`VHOST_DEFINE ` is used to define virtual hosts and virtual paths on the
Virtuoso HTTP server. Effectively this procedure inserts a row in table
`DB.DBA.HTTP_PATH` Virtuoso supports both flavours of virtual hosting:
IP-based and name-based.

</div>

<div>

## Parameters

<div>

### *`vhost `*

A <span class="type">string </span> containing the virtual host name
that the browser presents as Host: entry in the request headers. i.e.
Name-based virtual hosting. The default value is taken from the Virtuoso
INI file.

</div>

<div>

### *`lhost `*

A <span class="type">string </span> containing the address of the
network interface the Virtuoso HTTP server uses to listen and accept
connections. The default value is taken from the Virtuoso INI file.

</div>

<div>

### *`lpath `*

A <span class="type">string </span> containing the path component of the
URI for the logical path.

</div>

<div>

### *`ppath `*

A string containing the physical path that the logical path points to.
i.e. a directory or a path to dav collection on server.

</div>

<div>

### *`is_dav `*

An <span class="type">integer </span> . If non-zero, it indicates that
the *`physical_path`* points to a collection in DAV repository. Default
value is 0.

</div>

<div>

### *`is_brws `*

An <span class="type">integer </span> . If non-zero, it indicates that
the server will generate a directory listing in case a default page is
absent. Default value is 0.

</div>

<div>

### *`def_page `*

A <span class="type">string </span> containing the file name of the
default page. Default value is NULL.

</div>

<div>

### *`auth_fn `*

A <span class="type">string </span> that contains the fully qualified
Virtuoso/PL procedure name of authentication hook function that will
check and perform authentication for this virtual host or directory. If
NULL, Virtuoso will not attempt authentication. The default value is
NULL.

</div>

<div>

### *`realm `*

A <span class="type">string </span> with the realm to be passed to the
authentication function *`auth_func`* . The default value is NULL.

</div>

<div>

### *`ppr_fn `*

A <span class="type">string </span> containing the fully qualified name
of the Virtuoso/PL stored procedure used for post-processing of the
page. The default values is NULL.

</div>

<div>

### *`vsp_user `*

A <span class="type">string </span> containing a valid DB user name. The
VSP pages contained in the virtual directory shall be run with the
grants effective for this user at time of execution. The default values
is NULL.

</div>

<div>

### *`soap_user `*

A <span class="type">string </span> containing a valid SOAP user for
SOAP calls. The default values is NULL.

</div>

<div>

### *`sec `*

Security restrictions (SSL, Digest). The default values is NULL.

</div>

<div>

### *`ses_vars `*

An <span class="type">integer </span> . If non-zero, indicates that
session variables are persistent. The default values is 0.

</div>

<div>

### *`soap_opts `*

Options for SOAP service. The default values is NULL. The SOAP options
are name-value pairs contained in a vector: i.e. vector ('name1',
'value1', ....). The SOAP server accepts the optional parameters as
described in <a href="ch-webservices.html#soapoptions" class="link"
title="17.1.20. SOAP Endpoint Options">Optional parameters to the SOAP
endpoint</a> .

</div>

<div>

### *`auth_opts `*

Options for the authentication hook and HTTPS listen hosts. The default
values is NULL. If the sec_method (security method) defined as 'SSL' the
following auth_options must be supplied: https_cert - HTTPS server
certificate file path, https_key - HTTPS server private key file path.
In addition to check X509 certificate of clients, the https_cv option
with path to the file containing trusted certificate authorities must be
supplied and https_cv_depth - integer to set depth of client certificate
checking.

</div>

<div>

### *`opts`*

Extension options to the virtual directory itself. The default is NULL.
When it's used the value MUST be a vector of name and value pairs. The
supported extension options are: "noinherit" - denotes that all paths
requested and matched this directory will be treated only as physical
location (no expansion, no inheritance). It may used with a single page
to the directory mapping. "xml_templates" - This denotes that .xml files
under that directory and indirect children will be treated as a XML
Template files (i.e. they will be executed). "executable" - this flag is
used to override the execution permissions of the active pages stored
within WebDAV repository (i.e. if it's set the active pages will be
executed no matter what are their execution permission flag)

</div>

<div>

### *`is_default_host`*

</div>

</div>

<div>

## Return Types

The Return is VOID.

</div>

<div>

## Examples

<div>

**Example 24.442. Define Virtual Hosts**

<div>

The following command will:

|                                                                      |
|----------------------------------------------------------------------|
| listen on port 8889 of the interface corresponding with host.foo.com |
| maps /appsimple -\> /samples/appsimple/                              |
| can get a directory listing                                          |
| SQL user which will perform VSP execution is WS                      |
| the persistent session variables flag is on, so can be used in VSPs  |

``` programlisting
SQL> VHOST_DEFINE (vhost=>'www.foo.com:8889',
  lhost=>'host.foo.com:8889',
  lpath=>'/appsimple',
  ppath=>'/samples/appsimple/',
  is_brws=>1,
  vsp_user=>'WS',
  ses_vars=>1);
```

|                                                                   |
|-------------------------------------------------------------------|
| listen on standard HTTP port (80)                                 |
| maps /appurl -\> /samples/appurl/                                 |
| can get a directory listing                                       |
| SQL user which will perform VSP execution is WS                   |
| the persistent session variables flag is on , can be used in VSPs |

``` programlisting
SQL> VHOST_DEFINE (vhost=>'www.foo.com',
  lhost=>'host.foo.com',
  lpath=>'/appurl',
  ppath=>'/samples/appurl/',
  is_brws=>1,
  vsp_user=>'WS',
  ses_vars=>1);
```

|                                                                        |
|------------------------------------------------------------------------|
| HTTPS server listen on 443 port (will accept HTTP connections via SSL) |
| maps /secure -\> /samples/appurl/                                      |
| SQL user which will perform VSP execution is DBA                       |
| The server certificate is in the ./server.cert file                    |
| and server private key is in the ./server.key file                     |

``` programlisting
SQL> VHOST_DEFINE (vhost=>'www.foo.com:443',
  lhost=>'host.foo.com:443',
  lpath=>'/secure',
  ppath=>'/samples/appurl/',
  sec=>'SSL',
  vsp_user=>'dba',
  auth_opts=>vector ('https_key','./server.key','https_cert','./server.cert'));
```

If a browser points to the URL http://www.foo.com/ it will get a
directory listing of /samples/appurl/, or if a browser points to
http://www.foo.com:8889/ it will will get a directory listing of
/samples/appsimple/.

The following example demonstrates the use of SOAP options used in
<a href="soapwsdlinterop.html" class="link"
title="17.2.6. SOAP/WSDL Interoperability">Interop</a> testing.

``` programlisting
  VHOST_DEFINE (lpath=>'/Interop',
                ppath=>'/SOAP/',
        soap_user=>'INTEROP',
        soap_opts=> vector(
                   'SchemaNS','http://soapinterop.org/xsd',
                   'Namespace','http://soapinterop.org/',
                   'MethodInSoapAction','no',
                   'ServiceName', 'InteropTests',
                   'HeaderNS', 'http://soapinterop.org/echoheader/',
                   'CR-escape', 'yes'));
```

</div>

</div>

  

Example that covers TLS mutual authentication and custom re-write rules
handlers for 403 and 401 HTTP Status responses:

``` programlisting
DB.DBA.VHOST_DEFINE (
      lhost=>':443',
      vhost=>'example.com',
      lpath=>'/DAV',
      ppath=>'/DAV/',
      is_dav=>1,
      vsp_user=>'dba',
      ses_vars=>0,
      opts=>vector ('url_rewrite', 'rdf_sink_rule_list', '401_page', 
'demo/authenticate.vsp', '403_page', 'demo/authenticate.vsp'),
      sec=>'SSL',
      auth_opts=>vector ('https_cert', 'db:john_smith_CA2', 'https_key', 
'db:john_smith_CA2', 'https_verify', 3, 'https_cv_depth', 10),
      is_default_host=>0
```

</div>

<div>

## See Also

Chapter Virtuoso Web and XML Support in the Virtuoso Manual for
discussion on this topic. <a href="fn_vhost_remove.html" class="link"
title="VHOST_REMOVE">vhost_remove</a> .

</div>

</div>

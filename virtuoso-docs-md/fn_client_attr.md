<div>

<div>

</div>

<div>

## Name

client_attr — returns a varchar containing the requested information
from the connection

</div>

<div>

## Synopsis

<div>

|                                 |                         |
|---------------------------------|-------------------------|
| `varchar `**`client_attr`**` (` | in `attr ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### attr

can by one of the following:

|                                                                                                                                                                                                                |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*client_protocol* </span> - returns connection protocol (HTTP/1.0, HTTP/1.1, SQL -- SQL corresponds to ODBC, JDBC, .net, OLEDB).                                                        |
| <span class="emphasis">*client_ip* </span> - returns the IP where the invoking connection originates. 127.0.0.1 for unix domain socket or internal scheduled task, otherwise the ip of the http or sql client. |
| <span class="emphasis">*accepting_ip*</span> - returns the local listener through which the call came. If unix domain socket or internal scheduled operation, this is 127.0.0.1                                |
| <span class="emphasis">*client_application* </span> - returns the application name as sent by the driver. Empty string if unknown or internal.                                                                 |
| <span class="emphasis">*client_ssl* </span> - returns one if SSL encrypted connection either for SQL or HTTPS. False if internal or unix domain socket.                                                        |
| <span class="emphasis">*client_certificate* </span> - If certificate based login, returns the certificate, null otherwise.                                                                                     |
| <span class="emphasis">*transaction_log* </span> - 0 if the transaction log is off (turned on/off by <a href="fn_log_enable.html" class="link" title="log_enable">log_enable                                   
 ()</a> ); 1 if on (default) .                                                                                                                                                                                   |

</div>

</div>

<div>

## Errors

<div>

**Table 24.10. Errors signalled by `client_attr `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                  |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|
| <span class="errorcode">22005 </span> | <span class="errorcode">SR401 </span> | <span class="errortext">Server address not known. </span>                   |
| <span class="errorcode">22005 </span> | <span class="errorcode">SR402 </span> | <span class="errortext">Cannot allocate temp space. SSL error : xxx </span> |
| <span class="errorcode">22005 </span> | <span class="errorcode">SR403 </span> | <span class="errortext">xxx is not valid client_attr option. </span>        |

</div>

</div>

  

</div>

</div>

<div id="vwssaccounting" class="section">

<div class="titlepage">

<div>

<div>

### 17.5.4. Accounting & Accounting Hook

</div>

</div>

</div>

If an X.509 certificate is used to sign an incoming message, the
following connection variables will be available to the SOAP processing
function and accounting hook:

|                                                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*wss-token-owner* </span> owner of certificate, an example is "C=US/ST=MA/CN=User Name".                 |
| <span class="emphasis">*wss-token-issuer* </span> issued by , it's like above , but it's name of who is issued the certificate. |
| <span class="emphasis">*wss-token-serial* </span> serial number, an integer specific to certificate issuer.                     |
| <span class="emphasis">*wss-token-start* </span> valid from, a string containing a data of validity.                            |
| <span class="emphasis">*wss-token-end* </span> valid to, a string containing data of end of validity.                           |

These can be accessed by invoking connection_get(\[name-of-info\]) when
processing the SOAP request, i.e. in the procedure being invoked or from
a user defined accounting hook.

A user defined procedure hook named DB.DBA.WS_SOAP_ACCOUNTING can be
used for accounting purposes. If it exists it will be invoked after the
connection information is set. This PL hook should return 0 when an
error occurs or 1 upon success. Hence, a SOAP request may be rejected
based on some custom condition.

The procedure prototype is :

``` programlisting
create procedure DB.DBA.WS_SOAP_ACCOUNTING ()
{
  -- custom logic
  return 1; -- on success
  return 0; -- on failure
}
;
```

Note that the usage of this functionality is global to the Virtuoso
server, To get similar functionality for each SOAP method, the developer
will need to include account checking within the PL procedures that are
exposed as SOAP methods.

</div>

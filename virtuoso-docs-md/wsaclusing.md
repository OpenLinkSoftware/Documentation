<div id="wsaclusing" class="section">

<div class="titlepage">

<div>

<div>

### 14.2.3. Using ACL's Within Application Logic

</div>

</div>

</div>

The
<a href="fn_http_acl_get.html" class="link" title="http_acl_get"><code
class="function">http_acl_get()</code></a> function can be used to test
an address against an ACL. The
<a href="fn_http_client_ip.html" class="link"
title="http_client_ip"><code
class="function">http_client_ip()</code></a> function can be used to
determine the IP address or DNS name of a client machine.

<div id="ex_wsaclwithapps" class="example">

**Example 14.4. Using ACL's with Application Logic**

<div class="example-contents">

To restrict a 'foo.bar' (network 333.333.333.0) from accessing a SOAP
service one could use the following:

``` programlisting
-- deny access from '333.333.333.*'
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip) values ('MY_SOAP', 1, 1, '333.333.333.*');
-- allow
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip) values ('MY_SOAP', 2, 0, '*');

-- a procedure exposed as SOAP service

create procedure SumService (in a int, in b int) returns int
{
  if (0 <> http_acl_get ('MY_SOAP', http_client_ip ()))
    signal ('42000', 'Access denied');
  return (a + b);
}
```

</div>

</div>

  

</div>

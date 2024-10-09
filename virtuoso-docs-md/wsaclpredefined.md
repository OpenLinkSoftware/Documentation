<div>

<div>

<div>

<div>

### 14.2.4. Predefined ACLs

</div>

</div>

</div>

The following ACLs are predefined and have special treatment in Web
Server processing:

**HTTP. ** General Web server ACL, applying rules to it controls access
to the Web server. Thus if this ACL is managed via web UI one must pay
attention not to disable the current connection and render the
administration UI inaccessible. The ACL rules for 'HTTP' must contain
HA_ORDER, HA_CLIENT_IP (pattern) and HA_FLAG (access flag) only. The
rest of column values are ignored. To add or remove rules to that list
see 'ACL definition/removal' where HA_LIST must be equal to 'HTTP'. The
value of client's IP address will be tested against rules.

**NEWS. ** controls access to the separate Internet News groups,
restricting POST or READ access to them.

All valid rules for 'HTTP' are also valid for 'NEWS' with following
difference:

|                                                                                             |
|---------------------------------------------------------------------------------------------|
| HA_OBJECT must be specified as ID of News group to control                                  |
| HA_RW must be specified as 0/1 to designate which action on group to control: read or post. |

The HA_LIST must be equal to 'NEWS' if control is managed with SQL
statements. The HA_LIST must be equal to 'NEWS'.

**PROXY. ** This controls access to the Web Proxy Server. Note that
Proxy service is disabled by default and can be enabled with
'HTTPProxyEnabled' INI setting. This ACL is similar to the HTTP ACL.
Additionally, the pattern in HA_DEST_PATTERN must match the destination
server. In this way certain destinations can be restricted.

<div>

|                              |                                                                                                                                                     |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                               |
|                              | HTTP ACLs affect PROXY rules. Therefore if HTTP list rejects a request from a particular client, the proxy access from there also will be rejected. |

</div>

<div>

**Example 14.5. Adding/removing ACL's**

<div>

To allow access from localhost only:

``` programlisting
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip) values ('HTTP', 1, 0, '127.0.0.1');
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip) values ('HTTP', 2, 1, '*');
```

To allow only local addresses (private.net/192.168.0.0) to access proxy
server.

``` programlisting
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip, ha_dest_ip)
              values ('PROXY', 1, 0, '192.168.1.*', '*');
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip, ha_dest_ip)
              values ('PROXY', 2, 1, '*', '*');
```

To deny web access from some domain (bad.domain/333.333.333.0)

``` programlisting
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip) values ('HTTP', 1, 0, '*');
insert into http_acl (ha_list, ha_order, ha_flag, ha_client_ip) values ('HTTP', 2, 1, '333.333.333.*');
```

</div>

</div>

  

</div>

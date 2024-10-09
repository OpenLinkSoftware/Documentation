<div>

<div>

<div>

<div>

## 14.2. Web Services ACL (Access Control List)

</div>

</div>

</div>

Virtuoso provides a generic access control list for HTTP and other
Internet protocol clients. This mechanism uses wildcard expressions to
selectively block and allow ranges of IP addresses. An ordered set of
patterns is matched against the origin of the request. The first
matching pattern's allow/deny flag determines whether the client is
approved or not.

The patterns for designating a range of IP addresses follow the syntax
of the SQL 'LIKE' predicate; i.e. '%.foo.bar' or '\*.foo.bar' for
example.

<div>

|                            |                                                                     |
|:--------------------------:|:--------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                           |
|                            | The <a href="likepredicate.html" class="link"                       
                              title="9.19.9. LIKE Predicate &amp; Search Patterns">LIKE Predicate  
                              &amp; Search Patterns</a> section.                                   |

</div>

The following mechanisms for services access restriction are defined by
default:

|                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Web Server ACL*</span> - controls access to the Web server (basic fire wall)               |
| <span class="emphasis">*Web Proxy server ACL*</span> - controls access to the Web proxy server                     |
| <span class="emphasis">*News Server ACL*</span> - controls access to the Internet news groups (reading or posting) |

<div>

<div>

<div>

<div>

### 14.2.1. General purpose ACLs

</div>

</div>

</div>

The system table `DB.DBA.HTTP_ACL` is used to persist ACL definitions,
which can be managed with simple INSERT/UPDATE/DELETE statements. The
table has the following layout:

Columns for DB.DBA.HTTP_ACL:

|                                                                                                 |
|-------------------------------------------------------------------------------------------------|
| <span class="emphasis">*HA_LIST*</span> - ACL name                                              |
| <span class="emphasis">*HA_ORDER*</span> - Position in the list                                 |
| <span class="emphasis">*HA_OBJECT*</span> - Object ID (applicable to news groups also)          |
| <span class="emphasis">*HA_CLIENT_IP*</span> - \*PATTERN\*                                      |
| <span class="emphasis">*HA_FLAG*</span> - Allow/Deny flag, 0 - allow, 1 - deny                  |
| <span class="emphasis">*HA_RW*</span> - Read/Write flag, 0 - read, 1 - post                     |
| <span class="emphasis">*HA_DEST_IP*</span> - Destination IP/Host (applicable to the proxy also) |
| <span class="emphasis">*HA_RATE*</span> - Rate Limit                                            |

The primary key covers columns HA_LIST, HA_ORDER, HA_CLIENT_IP and
HA_FLAG.

<div>

|                            |                                                                                                                 |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                                                        |
|                            | The full schema is listed in the Appendix under <a href="davsystables.html#tables.db.dba.http_acl" class="link" 
                              title="HTTP Access Control List">System Tables</a> .                                                             |

</div>

**HA_LIST (required). ** Name of the ACL, This is a label to designate a
group of rules applicable to a specific service. There are three
pre-defined groups which are: HTTP, NEWS, PROXY. Please note that name
of group is treated as case-insensitive string. In other words we can
think about HA_LIST as domain of the ACL. Developers can use that table
to add their own ACLs , and use them with API functions which are
discussed in the next section.

**HA_ORDER (required). ** Ordinal number of the rule within its list.
This number should be unique within a specific group to have a well
defined order of rule matching. Please note that if order is equal the
one with allow flag equal to zero (HA_FLAG value see below) takes
precedence. The order for applying rules for particular list is in
ascending order i.e. first will be applied the rule with the smallest
value of HA_ORDER.

**HA_CLIENT_IP (required). ** A pattern to designate separate IP address
or group of addresses. This is a string value as for 'LIKE' operator.
Some example is: 192.168.\*; will match all hosts from local private
network.

**HA_FLAG (required). ** A boolean; zero or positive number designating
a rule to be applied for matching address/host. The default option is
zero (false) for allowed action; positive (true) for denied action. So
application may use it in reverse; but in that case it needs to take in
account the order precedence (see HA_ORDER).

**HA_OBJECT (optional). ** An integer designating an ID used in
predefined ACL for Internet News groups to designate ID of the group.
This can be used also in other applications where one desires to apply
different rules for different objects. We can think of it as a sub list
inside an ACL.

**HA_RW (optional). ** An integer designating a action to be restricted
(read/write); used in predefined Internet News groups ACL.

**HA_DEST_IP (optional). ** A string containing pattern to match another
IP number; this is used in Web Proxy server ACL. This can also be used
in custom application logic.

**HA_RATE (optional). ** An float for Rate Limit. The filter calculates
hit rate average and compares with limit for http acl rule. If it is
larger then will drop connection. Once per day the statistics will be
reset.

<div>

- Regular expressions are not supported.

- Can be used patterns, for ex:

  ``` programlisting
  -- like '%something' or
  -- something*
  ```

</div>

The Rate Limit UI can be configured from Conductor-\>System
Admin-\>Security-\>Access Control where:

Rate limit is hits/per second from one IP address.

For search engine optimization statistics, for example can be set rate
limit 10 (or even 100 so to start to collect statistics), and then to
check with http_acl_stats () what values are returned.

</div>

</div>

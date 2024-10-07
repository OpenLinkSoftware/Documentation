<div id="mt_udauserrac" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 13. Real Application Cluster (RAC) / TAF Support

</div>

<div>

<div class="abstract">

**Abstract**

Transparent Application Failover (TAF) is a protocol within Oracle
whereby, if a connection to a database node fails, it can be
re-established against an alternative node.

<div id="id32461" class="figure">

**Figure 13.1. ora_rac.png**

<div class="figure-contents">

<div class="mediaobject">

![ora_rac.png](images/ora_rac.png)

</div>

</div>

</div>

  

Once a broken connection has failed-over, an application can continue
without any special action on its part. However, TAF does not restore
all facets of a connection. For instance, TAF does not:

<div class="itemizedlist">

- restore active transactions - any active transactions are rolled back
  at the time of failure because TAF cannot preserve active transactions
  after failover: the application instead receives an error message
  until a ROLLBACK is submitted;

- restore session properties set using 'ALTER SESSION';

- maintain the state of server-side program variables, such as PL/SQL
  package states.

</div>

If any of these situations apply to a failed connection, an application
may need to take action following failover to return the connection
fully to the desired state. In order to do this, the application may
request to be notified when failover has occurred. The OpenLink Lite
Driver for Oracle 10g and the OpenLink Generic Multi-Tier Client provide
this facility through TAF event notifications.

The Oracle 10g Lite Driver and Multi-Tier Agent also allow configuration
of the failover retry interval and the maximum number of failover
retries, in the event that failover is not successful on the first
attempt.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">13.1. [What you have to do to use
it](mt_udauserrachowtouse.html)</span>

<span class="section">13.1.1.
[Configuration](mt_udauserrachowtouse.html#id1354)</span>

<span class="section">13.1.2. [Programmatic
Considerations](mt_udauserrachowtouse.html#id1357)</span>

<span class="section">13.2. [Related
Links](mt_udauserracrelatedlinks.html)</span>

</div>

</div>

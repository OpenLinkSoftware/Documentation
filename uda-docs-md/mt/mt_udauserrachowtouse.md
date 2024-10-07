<div id="mt_udauserrachowtouse" class="section">

<div class="titlepage">

<div>

<div>

## 13.1. What you have to do to use it

</div>

</div>

</div>

<div id="id1354" class="section">

<div class="titlepage">

<div>

<div>

### 13.1.1. Configuration

</div>

</div>

</div>

<div id="mt_udauserracmt" class="section">

<div class="titlepage">

<div>

<div>

#### Multi-Tier

</div>

</div>

</div>

To use OpenLink's TAF event notification features or configure the
failover retry parameters, you must enable OpenLink's TAF support. For
the Oracle 10g Multi-Tier Agent, you must set the environment variable
OPL_TAF_ENABLE to 'Y' or 'y'. With the agent, this is done by creating
an entry in the appropriate 'Environment' section of the OpenLink
Request Broker's rulebook, or by navigating through the web-based
Administrative Assistant (normally running on
\<http://servername:8000/\>) to configure an agent by form or wizard.

</div>

<div id="id1353" class="section">

<div class="titlepage">

<div>

<div>

#### TAF Retry Configuration

</div>

</div>

</div>

When OpenLink's TAF support is enabled, in the event that a failover
attempt fails, the Lite driver or Multi-Tier agent will instruct Oracle
to retry. By default, the maximum number of failover attempts is 10 and
the interval between retry attempts is 10 seconds. The default values
can be overridden.

If using the Oracle 10g Lite Driver for Windows, enter the new values in
the 'Max. Retries' and 'Retry Interval' text fields. For the Oracle 10g
Lite Driver for Unix or the Multi-Tier Oracle 10g agent, override the
defaults by setting the environment variables OPL_TAF_MAX_RETRIES and
OPL_TAF_RETRY_INTERVAL. The retry settings operate independently of TAF
event call-backs. When OpenLink's TAF support is enabled, they are
effective irrespective of whether an application registers an event
call-back.

</div>

</div>

<div id="id1357" class="section">

<div class="titlepage">

<div>

<div>

### 13.1.2. Programmatic Considerations

</div>

</div>

</div>

OpenLink ODBC drivers notify ODBC applications that failover has
occurred using two mechanisms: event call-backs and SQLSTATEs.

<div id="id1355" class="section">

<div class="titlepage">

<div>

<div>

#### TAF Event Notification: Call-backs

</div>

</div>

</div>

An application can register a failover call-back routine by setting the
proprietary connection attribute SQL_ATTR_EVENT_CALL-BACK (1280) on an
open connection. The routine's address is supplied as the value of
SQLSetConnectAttr ?'s <span class="emphasis">*ValuePtr*</span> argument.
The same call-back routine can be registered for more than one
connection. The call-back routine's signature must take the form:

``` programlisting
  void (*call-back) (oplevent_t oplEvent, SQLHANDLE handle, SQLUSMALLINT
  eventInfo) 
```

where:

<div class="itemizedlist">

- <span class="emphasis">*oplEvent:*</span> is an integer indicating the
  type of event which took place.

- <span class="emphasis">*context:*</span> is an application-supplied
  ODBC handle identifying the context the event is taking place in.

- <span class="emphasis">*eventInfo:*</span> is an unsigned integer code
  providing more information about the event. The values returned depend
  on the type of event. 0 signifies 'no further information available'

</div>

<span class="emphasis">*oplEvent*</span> is of type oplevent_t, an
enumerated type enumerating the types of events reported to event
call-backs. oplevent_t is defined as follows:

``` programlisting
 typedef enum {
  OPL_EV_NONE = 0, OPL_EV_FAILOVER_SUCCESS = 16, OPL_EV_FAILOVER_ABORT = 17 }
  oplevent_t; 
```

At the moment, only failover events are supported through the
OPL_EV_FAILOVER_xxx event class. Other types of event may be supported
in the future using this call-back mechanism. OPL_EV_FAILOVER_SUCCESS
indicates that failover was successful, OPL_EV_FAILOVER_ABORT that
failover was aborted.

<span class="emphasis">*context*</span> is the ODBC handle (HDBC) of the
connection for which the application wishes to receive event
notifications. This handle should be supplied to the ODBC driver when
the call-back is registered, using another Oracle-specific connection
attribute, SQL_ATTR_EVENT_CONTEXT (1281). If this attribute is not set,
the call-back receives SQL_NULL_HANDLE for the
<span class="emphasis">*handle*</span> argument. (If other event types
are supported in the future, this attribute may accept other types of
ODBC handle, e.g. handles of type SQL_HANDLE_STMT, depending on the
scope of the event.)

<span class="emphasis">*eventInfo*</span> is reserved for future use.
All failover events currently return 0.

</div>

<div id="id1356" class="section">

<div class="titlepage">

<div>

<div>

#### TAF Event Notification: SQLSTATEs

</div>

</div>

</div>

As well as an ODBC application being informed of failover through a
call-back routine, it also receives notification through SQLSTATEs.
After failover completes, the first ODBC call to return, on the affected
connection, can return one of two proprietary SQLSTATES, IM500 or IM501:

<div class="itemizedlist">

- IM500 denotes successful failover completion. If the ODBC call
  generated no other errors, the call returns SQL_SUCCESS_WITH_INFO with
  SQLSTATE IM500 and is accompanied by the informational message
  "Failover completed". As usual, the SQLSTATE and diagnostic message
  can be retrieved using SQLGetDiagRec ?();

</div>

<div class="itemizedlist">

- IM501 ("Failover aborted") indicates failover was unsuccessful. A
  function returning this SQLSTATE returns with return code SQL_ERROR.

</div>

If the ODBC call returning the failover SQLSTATE fails for some reason,
a diagnostic record holding the failover SQLSTATE and message is
appended to any diagnostic records already generated by the failing
call. In this case, even if failover was successful, a SQLSTATE IM500
may be accompanied by a function return code of SQL_ERROR. For instance,
if a transaction was open at the time failover took place, SQLExecute
may return SQL_ERROR with two diagnostic records, for example:

<div class="itemizedlist">

- DiagRec ? \#1 Native error: 25402 SQLSTATE: HY000 Message:
  \[OpenLink\]\[ODBC\]\[Oracle Server\]ORA-25402: transaction must roll
  back

- DiagRec ? \#2 Native error: 0 SQLSTATE: IM500 Message:
  \[OpenLink\]\[ODBC\]\[Oracle Server\]Failover completed.

</div>

<span class="emphasis">*Note*</span>: Failover notification using
TAF-specific SQLSTATEs cannot be used independently of failover
call-backs. The use of these SQLSTATEs is only triggered when an
application registers a failover call-back.

</div>

</div>

</div>

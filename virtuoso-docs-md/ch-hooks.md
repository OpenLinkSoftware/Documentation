<div id="ch-hooks" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 12. Database Event Hooks

</div>

<div>

<div class="abstract">

**Abstract**

Virtuoso provides a number of hooks that enable you to traps events
within the database such as startup, shutdown, connection, disconnection
and SQL compilation events.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">12.1. [Database
Startup](ch-hooks.html#fn_dbev_startup)</span>

<span class="section">12.2. [Database
Connections](fn_dbev_connect.html)</span>

<span class="section">12.3. [Database Logins](fn_logins.html)</span>

<span class="section">12.4. [Database
Disconnections](fn_disconnect.html)</span>

<span class="section">12.5. [Database
Shutdown](fn_dbev_shutdown.html)</span>

<span class="section">12.6. [SQL Statement
Preparation](fn_dbev_prepare.html)</span>

<span class="section">12.7. [SQL Parse Tree](sqlparsetree.html)</span>

<span class="section">12.7.1. [Notes on Special Features of the Parse
Tree](sqlparsetree.html#notesonspecialparsetree)</span>

<span class="section">12.7.2. [SQL Security and Parse
Trees](sqlsecandparsetrees.html)</span>

<span class="section">12.7.3. [Debugging with Parse
Trees](debuggingparsetree.html)</span>

<span class="section">12.8. [WebDAV Logins](fn_davlogins.html)</span>

<span class="section">12.9. [Associating Auxiliary Data With A
Connection](assocauxdata.html)</span>

</div>

Virtuoso allows the dba to set hooks for various events, such as:

|                                        |
|----------------------------------------|
| Startup                                |
| Shutdown                               |
| Client Connect                         |
| Client Disconnect                      |
| Compilation of a Dynamic SQL Statement |

These events are intercepted by calling a SQL procedure if one is
defined.

In the following we will examine each hook in the context of a
simplified database security system. The system will record all logins
and logouts and will enforce custom security rules on reading a specific
application table.

<div id="fn_dbev_startup" class="section">

<div class="titlepage">

<div>

<div>

## 12.1. Database Startup

</div>

</div>

</div>

`DB.DBA.DBEV_STARTUP()`

If defined, this is called after the server initialization, including
roll forward of transaction logs, compilation of stored procedures,
etc..., but before starting to listen for clients. Hence this is
guaranteed to run before any clients connect or any HTTP messages are
serviced.

The procedure will run in its own transaction, which will be
automatically committed upon return, regardless of run time errors.
Result sets are not allowed and return values are discarded. All custom
Virtuoso Server Extensions (VSEs) will be defined when calling this
procedure.

<div id="id36444" class="example">

**Example 12.1. Sample Startup Procedure Hook**

<div class="example-contents">

``` programlisting
create procedure DB.DBA.DBEV_STARTUP ()
{
  dbg_obj_print (' server started ');
}
```

</div>

</div>

  

</div>

</div>

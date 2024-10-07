<div id="mt_orainstantclient" class="section">

<div class="titlepage">

<div>

<div>

## 3.8. Oracle 10g Instant Client: Connection String Formats

</div>

</div>

</div>

The Oracle 10g Instant Client can be used in OpenLink single-tier and
multi-tier environments. In a three-tier configuration, an OpenLink
Oracle 10g agent residing on the middle-tier can use the Instant Client
to connect to an Oracle instance on the third tier.

Instant Client allows you to run applications
<span class="emphasis">*without installing the standard Oracle
client*</span> (SQL\*Net or Net8) or having an ORACLE_HOME. It supports
two basic connection string formats:

<div class="itemizedlist">

- //host:\[port\]\[/service name\]

  <div class="itemizedlist">

  - e.g. //dbase-server-5:4321/ORDERS

  </div>

- an Oracle Net keyword-value pair such as

  ``` programlisting
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp) (HOST=dlsun242)
      (PORT=5521)) (CONNECT_DATA=(SERVICE_NAME=bjava21)))
  ```

</div>

Naming methods that require a configuration file (such as tnsnames.ora
or sqlnet.ora) for name translation can also be used if the environment
variable TNS_ADMIN is set to point to the directory containing the file.

<div id="mt_orainstclientmt" class="section">

<div class="titlepage">

<div>

<div>

### 3.8.1. OpenLink Multi-Tier Connections using Instant Client

</div>

</div>

</div>

In this scenario, the Instant Client need only be installed on the
machine hosting the OpenLink Oracle agent. The valid combinations of
connection parameters (NET 10 Service Name, Login ID and Password)
accepted by the OpenLink Multi-Tier DSN Configuration Wizard are the
same as detailed above for the Single-Tier driver, with the 'NET 10
Service Name' field in the multi-tier wizard taking the same values as
the 'Connection String' field in the single-tier wizard. The environment
variables ORACLE_HOME and ORACLE_SID need not be set in the rulebook.
However, TNS_ADMIN must be set in the rulebook if translation of a local
NET service name is required.

</div>

<div id="mt_orainstclientrelatedlinks" class="section">

<div class="titlepage">

<div>

<div>

### 3.8.2. Oracle Client Installation related links

</div>

</div>

</div>

|                                                                                   |
|-----------------------------------------------------------------------------------|
| Oracle documentation: <a                                                          
 href="http://www.oracle.com/technology/tech/oci/instantclient/ic-faq.html#A4428"   
 class="ulink" target="_top">connection string formats</a>                          |
| <a                                                                                
 href="http://www.oracle.com/technology/tech/oci/instantclient/instantclient.html"  
 class="ulink" target="_top">Oracle 10g Instant Client</a>                          |

</div>

</div>

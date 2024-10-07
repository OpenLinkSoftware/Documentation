<div id="lite_orainstantclient" class="section">

<div class="titlepage">

<div>

<div>

## 4.7. Oracle 10g Instant Client: Connection String Formats

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

<div id="lite_orainstclientlite" class="section">

<div class="titlepage">

<div>

<div>

### 4.7.1. OpenLink Single-Tier Connections using Instant Client

</div>

</div>

</div>

Examples of accepted connection parameters settings are shown below.

<div id="lite_orainstclientlitedsnwiz" class="section">

<div class="titlepage">

<div>

<div>

#### Defining a DSN using the OpenLink Single Tier DSN Configuration Wizard

</div>

</div>

</div>

<span class="emphasis">*1) Using a local NET service name*</span>
TNS_ADMIN must point a directory containing to a tnsnames.ora file to
allow translation of the local NET service name to an Oracle connect
descriptor.

<div id="id41159" class="table">

**Table 4.1. **

<div class="table-contents">

|                    |
|--------------------|
|                    |
|                    |
| Connection String: |
| Login ID:          |
| Password:          |
|                    |

</div>

</div>

  

<span class="emphasis">*2) Using a connect URL string*</span>

<div id="id41183" class="table">

**Table 4.2. **

<div class="table-contents">

|                    |
|--------------------|
| Connection String: |
| Login ID:          |
| Password:          |
|                    |

</div>

</div>

  

<span class="emphasis">*3) Using an Oracle NET connect
descriptor*</span>

<div id="id41203" class="table">

**Table 4.3. **

<div class="table-contents">

|                    |
|--------------------|
| Connection String: |
| Login ID:          |
| Password:          |

</div>

</div>

  

All the above forms for the 'Connection String' field can also be
appended to the Login ID using an '@' separator. The password can be
supplied separately, or appended to the Login ID string using '/' as a
separator.

<span class="emphasis">*4) Using a local NET service name appended to
Login ID*</span> TNS_ADMIN must point a directory containing to a
tnsnames.ora file to allow translation of the local NET service name to
an Oracle connect descriptor.

<div id="id41222" class="table">

**Table 4.4. **

<div class="table-contents">

|           |
|-----------|
|           |
| Login ID: |
| Password: |
|           |

</div>

</div>

  

<span class="emphasis">*5) Using a connect URL string appended to Login
ID*</span>

<div id="id41240" class="table">

**Table 4.5. **

<div class="table-contents">

|           |
|-----------|
| Login ID: |
| Password: |
|           |

</div>

</div>

  

<span class="emphasis">*6) Using an Oracle NET connect descriptor
appended to Login ID*</span>

<div id="id41256" class="table">

**Table 4.6. **

<div class="table-contents">

|           |
|-----------|
| Login ID: |
| Password: |

</div>

</div>

  

</div>

</div>

<div id="lite_orainstclientrelatedlinks" class="section">

<div class="titlepage">

<div>

<div>

### 4.7.2. Oracle Instant Client Related Links

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

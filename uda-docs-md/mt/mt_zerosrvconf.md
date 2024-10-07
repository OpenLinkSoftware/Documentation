<div id="mt_zerosrvconf" class="section">

<div class="titlepage">

<div>

<div>

## 10.2. Server Configuration

</div>

</div>

</div>

The OpenLink Multi-Tier Request Broker now has the ability to Broadcast
ZeroConf services of available Database agent connections on the
network. These can be discovered by the the OpenLink Multi-Tier ODBC
client.

<div id="mt_zeroconfini" class="section">

<div class="titlepage">

<div>

<div>

### 10.2.1. Configuration by Rule Book Edit

</div>

</div>

</div>

ZeroConf Support in the Request Broker is configured via the Rule Book.
The Rule Book now contains a new section called \[Zero Config\]. This
section contains a list of DSN="Connect String" pairs. The DSN is the
name that will be presented to clients listing available ZeroConf data
source, the Connect String is a string of connection attributes
necessary for making a connection to a Database Agent as the example
below shows:

``` programlisting
[Zero Config]
ZJDBC3= "ServerType=JDBC13;Database=virtuoso.jdbc2.Driver;UID=dba"
ZSQL2K = "ServerType=SQLServer 2000;Database=pubs;UID=sa"
SQLServer 2000="Database=pubs;UID=sa"
```

The syntax is:

``` programlisting
<Service_name>="Connect String"
```

or:

``` programlisting
<Server Type>="Connect String"
```

In this second case, there is no Server Type defined within the connect
string itself.

<div class="itemizedlist">

- **\<Service_name\>. ** This is the service name you want this specific
  ZeroConf service to be known as when discovered by any Multi-Tier
  ZeroConf clients on the network.

- **Connect String. ** A semi-colon (;) separated list of connection
  attributes that the Request Broker will supply to clients for
  automatically connecting the the requested DSN. Note that these
  attributes can be any of those used by a normal Multi-Tier client,
  since this is effectively making DSN-less connection string for
  clients to use. Host and Port cannot be specified, these are
  automatically supplied by the broker when the service is requested.

  <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
  |:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
  |                              | The Host and Port number of the Request Broker are not specifiable, the Broker will supply these to the services broadcasted automatically. This brings a huge saving on administration overhead; if the circumstances of the networking infrastructure change, the installation is simply moved to another machine or a backup server activated, no modifications to the ZeroConf details are required, and the new host:port will be automatically supplied from then on. |

  </div>

  The Connect String must be enclosed in double-quotes.

  The list of available attributes are:

  <div class="itemizedlist">

  - **ServerType \[SVT\]. ** Specify agent domain. This is used by the
    broker to determine which agent section to connect the client
    request to using mapping rules.

  - **ServerOptions. ** Server startup options specific to
    agent/database.

  - **Database \[DATABASE\]. ** Database to use. Agent/database
    specific.

  - **Options \[OPTIONS\]. ** Database connect options. Agent/database
    specific.

  - **UserName \[UID\]. ** Username to connect as.

  - **Password \[PWD\]. ** Password for user.

  - **ReadOnly \[READONLY\]. ** Specify Y(es) for read-only (ro) or N(o)
    for read-write (rw) connections. Read only connections are sometimes
    faster, but can never modify any database.

  - **FetchBufferSize \[FBS\]. ** Number of rows (records) to be fetched
    per call from database agent. Values range from 1 to 99

  - **Persist. ** Controls whether the Zero Config DSN should be
    persisted on the client when select. If set to Yes/Y/T then it will,
    and if for set to No/N/F then it will only be used at connect time
    and not stored in the client which may be deemed a securty breach.

  </div>

</div>

</div>

<div id="mt_zeroconfwiz" class="section">

<div class="titlepage">

<div>

<div>

### 10.2.2. Configuration by Wizard

</div>

</div>

</div>

The OpenLink Universal Data Access Admin Assistant provides a graphical
remote access interface to the server settings such as those found in
the Rule Book. This interface has been extended to support configuration
of the ZeroConf settings in the Server Component Administration Section,
called Zero Config Administration.

The Zero Config Administration pages are very much like Client Data
Source configuration pages, they have the same layout and descriptions
as they are essentially data sources stored on the server.

To make a new Zero Configuration entry, follow this sequence:

<div class="orderedlist">

1.  From the Server Components Administration menu, chose the Zero
    Config Administration sub menu, and then Zero Config Administration
    by Wizard. A list of current confirguations is shown:

    <div class="figure-float">

    <div id="mt_zerowiz01" class="figure">

    **Figure 10.1. Zero Config by Wizard - Admin Assistant
    Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Zero Config by Wizard - Admin Assistant
    Configuration](images/zerowiz01.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Press the Add button. Enter a suitable name for the configuration:

    <div class="figure-float">

    <div id="mt_zerowiz02" class="figure">

    **Figure 10.2. Zero Config by Wizard - Admin Assistant
    Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Zero Config by Wizard - Admin Assistant
    Configuration](images/zerowiz02.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Enter the database details. The parameters are identical to those in
    the <a href="mt_occunix.html#mt_WizardBasedDSNs" class="link"
    title="Wizard Based Data Source Management">ODBC DSN configuration
    wizard</a>.

    For each parameter you wish to configure, you need to enable it by
    checking the box on the left side. Each field is disabled until the
    check box is marked.

    <div class="figure-float">

    <div id="mt_zerowiz03" class="figure">

    **Figure 10.3. Zero Config by Wizard - Admin Assistant
    Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Zero Config by Wizard - Admin Assistant
    Configuration](images/zerowiz03.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Enter the additional connection parameters. In same way as previous
    page, each parameter field needs to be enabled by the check mark on
    the left side.

    <div class="figure-float">

    <div id="mt_zerowiz04" class="figure">

    **Figure 10.4. Zero Config by Wizard - Admin Assistant
    Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Zero Config by Wizard - Admin Assistant
    Configuration](images/zerowiz04.png)

    </div>

    </div>

    </div>

      

    </div>

5.  The complete configuration parameters are now shown:

    <div class="figure-float">

    <div id="mt_zerowiz05" class="figure">

    **Figure 10.5. Zero Config by Wizard - Admin Assistant
    Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Zero Config by Wizard - Admin Assistant
    Configuration](images/zerowiz05.png)

    </div>

    </div>

    </div>

      

    </div>

6.  The Zero Config entry now appears in the list:

    <div class="figure-float">

    <div id="mt_zerowiz07" class="figure">

    **Figure 10.6. Zero Config by Wizard - Admin Assistant
    Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Zero Config by Wizard - Admin Assistant
    Configuration](images/zerowiz07.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="mt_zeroconfform" class="section">

<div class="titlepage">

<div>

<div>

### 10.2.3. Configuration by Form

</div>

</div>

</div>

From the Server Components Administration menu, chose the Zero Config
Administration sub menu, and then Zero Config Administration by Form.
The list of current configurations is shown. Chose one to edit or
delete, or select "add" to make a new configuration.

<div class="figure-float">

<div id="mt_zeroform01" class="figure">

**Figure 10.7. Zero Config by Forms - Admin Assistant Configuration**

<div class="figure-contents">

<div class="mediaobject">

![Zero Config by Forms - Admin Assistant
Configuration](images/zeroform01.png)

</div>

</div>

</div>

  

</div>

The parameters required in the form are the same as those detailed in
the previous section on Rule Book Configuration. The Host and Port
fields are not available since this information is supplied by the
Request Broker hosting the service.

</div>

</div>

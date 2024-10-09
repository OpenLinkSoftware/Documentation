<div>

<div>

<div>

<div>

## 7.3. Virtuoso Driver for ODBC

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 7.3.1. Windows ODBC Driver Configuration

</div>

</div>

</div>

At installation time two ODBC data source names (DSN's) are created with
default values by the Virtuoso installer, the first DSN named "Local
Virtuoso" provides a link to a local default Virtuoso database server
instance, while the other named "Local Virtuoso Demo" provides a link to
a local Virtuoso server for the Virtuoso demonstration database.

The process of creating additional ODBC DSN's for you Virtuoso drivers
for ODBC is explained in the steps that follow:

<div>

1.  Go to the Windows <span class="emphasis">*Control panel*</span> .

2.  Double click on the <span class="emphasis">*ODBC
    Administrator*</span> applet. On Windows 2000 / XP the ODBC
    Administrator applet may be called <span class="emphasis">*Data
    Source (ODBC)*</span> and may be found under Administrative tools
    icon of the Control Panel.

3.  Once the ODBC Administrator has been loaded choose by selecting the
    appropriate panel whether you want a new User or System Data Source.
    User Data Sources will only be available to the user that created
    them. System Data Sources will be available to all users and
    applications on the system.

4.  Click on the <span class="emphasis">*Add*</span> Data Source Name
    button

5.  Select the Driver named <span class="emphasis">*OpenLink Virtuoso
    Driver*</span>

6.  Enter values into the fields presented by the Virtuoso Driver's DSN
    configuration dialog:

    <div>

    <div>

    **Figure 7.30. Virtuoso ODBC Driver Setup Dialogue for Windows**

    <div>

    <div>

    ![Virtuoso ODBC Driver Setup Dialogue for
    Windows](images/virtdsn001.png)

    </div>

    </div>

    </div>

      

    </div>

    <span class="emphasis">*Name:*</span> provide a name that will act
    as a logical reference to the Virtuoso database server that you will
    be connecting to. Subsequent references to this database will be
    made to this value when ODBC compliant applications interact with
    your Virtuoso driver.

    <span class="emphasis">*Description:*</span> allows you to provide a
    short description about the nature of the connection. This is
    optional.

    <span class="emphasis">*Server:*</span> enter the hostname or IP
    address of the machine hosting your Virtuoso server and enter the
    port number that Virtuoso is listening at. This is configured in the
    <a href="ch-server.html#virtini" class="link"
    title="Virtuoso Configuration File">Virtuoso ini</a> file on the
    server.

7.  Press the <span class="emphasis">*Next*</span> button to configure
    more details about the connection

    <div>

    <div>

    **Figure 7.31. Virtuoso ODBC Driver Setup Dialogue for Windows**

    <div>

    <div>

    ![Virtuoso ODBC Driver Setup Dialogue for
    Windows](images/virtdsn002.ong)

    </div>

    </div>

    </div>

      

    </div>

    <span class="emphasis">*Connect to the Virtuoso Servet to obtain
    default settings for the additional configuration options:*</span>
    allows you to specify the default username and password for the
    connection.

    Press the <span class="emphasis">*Next*</span> button

    <span class="emphasis">*Database:*</span> allows you to select the
    default database for the connection. You will need to check the box
    above and supply a password to refresh this list. Objects created or
    selected without an explicit catalogue/database qualifier will
    automatically be sought from this select database.

    <span class="emphasis">*Charset:*</span> lets you choose the default
    character set for the connection.

    <div>

    <div>

    **Figure 7.32. Virtuoso ODBC Driver Setup Dialogue for Windows**

    <div>

    <div>

    ![Virtuoso ODBC Driver Setup Dialogue for
    Windows](images/virtdsn003.png)

    </div>

    </div>

    </div>

      

    </div>

8.  When the configuration is complete, and indeed at any time you are
    satisfied with the configuration press the
    <span class="emphasis">*Finish*</span> button to save the DSN.

</div>

</div>

</div>

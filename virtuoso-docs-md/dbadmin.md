<div>

<div>

<div>

<div>

### 6.2.9. Database Administration

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Users & Group Accounts

</div>

</div>

</div>

From System Admin / user Accounts you can alter the users that can
access the Virtuoso database. You may add a new user by clicking the
"Create New Account" link, edit an existing user, or delete users. You
can associate users with groups or make new groups.

Groups are created and function like normal user accounts. To define a
group you simply create a new user, and then to make use of the group
you assign users to that group from the drop down which will contain
available groups.

To create a new user or group you must enter a username, password and
confirm the password by retyping it in the fields provided. You may
optionally specify a group and default qualifier. You can use groups to
control access to a set of users by maintaining the permissions granted
to the group for which they are members. Specifying a default qualifier
allows you to specify the catalog or database for which queries will be
run against that do not explicitly refer to a particular catalog or
database.

You can import users by adding LDAP Servers(s) from the "LDAP Servers"
tab, and then from the "LDAP Import" to specify from which LDAP server
the import should be done:

<div>

<div>

**Figure 6.117. Users Accounts**

<div>

<div>

![Users Accounts](images/ui/admtables_01a.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

##### Configuring and import from LDAP server

</div>

</div>

</div>

The following steps describe how to configure LDAP server and then
import user(s) using the Conducor UI:

<div>

1.  Go to http://cname:port/conductor

2.  Enter user dba credentials

3.  Go to System Admin -\> User Accounts -\> LDAP Servers

    <div>

    <div>

    **Figure 6.118. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Enter in the LDAP servers form respectively:

    <div>

    1.  Host Name: for ex.: ldap.example.com

        Note: you can also use ldap:// or ldaps:// in front of Host name

    2.  Base: for ex.: o=MyCompany,c=DE

    3.  Base DN: for ex: ou=Accounts,o=MyCompany,c=DE

    4.  UID field: uid

    5.  Account: for ex: joe

    6.  Password: \*\*\*\*\*\*\*

    7.  LDAP version: choose for ex. 3

    </div>

5.  Check the connection by pressing "Test":

    <div>

    <div>

    **Figure 6.119. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  If the test connection is successful, click "Add".

    <div>

    <div>

    **Figure 6.120. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Next you can import various data from your LDAP server.

8.  Go to System Admin -\> User Accounts -\> LDAP Import

    <div>

    <div>

    **Figure 6.121. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap3a.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the LDAP server added from above:

    <div>

    <div>

    **Figure 6.122. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap4.png)

    </div>

    </div>

    </div>

      

    </div>

10. Click "Search".

    <div>

    <div>

    **Figure 6.123. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap5.png)

    </div>

    </div>

    </div>

      

    </div>

11. Click "Next".

    <div>

    <div>

    **Figure 6.124. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap6.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select the desired profiles to be imported and set prefered "LDAP
    Authentication" for selected user:

    <div>

    - If set to "enabled", then on an attempt to log in into Virtuoso,
      the system tries to log in into the LDAP server with the given
      username and password. If this succeeds, then the user logs in
      successfully in Virtuoso.

    - If set to "account check", then on an attempt to log in into
      Virtuoso, the system performs a check if there is such an user on
      the LDAP server. If yes, then the user logs in successfully in
      Virtuoso.

    </div>

    <div>

    <div>

    **Figure 6.125. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap7.png)

    </div>

    </div>

    </div>

      

    </div>

13. Click "Import".

    Note: By default an importing LDAP user has "User type" set to
    "WebDAV". To log in into iSQL with an imported LDAP user credentials
    you should:

    <div>

    1.  Make sure you have set in Virtuoso ini the
        SQL_ENCRYPTION_ON_PASSWORD parameter to 1 in the \[Client\]
        section, i.e.:

        ``` programlisting
        ;virtuoso.ini
        ....
        [Client]
        SQL_ENCRYPTION_ON_PASSWORD  = 1
        ...
        ```

    2.  Set the "User type" of the imported LDAP user to be "SQL/ODBC"
        by going to Virtuoso Conductor -\> System Admin -\> User
        Accounts -\> user -\> Edit -\> field "User type".

    3.  Log in into iSQL:

        ``` programlisting
        isql host:port ldap-user-name ldap-user-password
        ```

    </div>

14. Click "Finish".

15. The imported profile(s) should be displayed in the Users tab:

    <div>

    <div>

    **Figure 6.126. LDAP Servers Configure and Import**

    <div>

    <div>

    ![LDAP Servers Configure and Import](images/ui/ldap8.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Databases

</div>

</div>

</div>

Each catalog (database) within Virtuoso will be listed under the
Databases /Schema Objects. For each catalog you will be able to view and
in some cases edit details about the tables, views, triggers, and store
procedures stored within that catalog.

<div>

<div>

**Figure 6.127. Viewing Tables details for the Demo catalogue in the
Demo Database**

<div>

<div>

![Viewing Tables details for the Demo catalogue in the Demo
Database](images/ui/admtables_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.128. Viewing Views details for the Demo catalogue in the Demo
Database**

<div>

<div>

![Viewing Views details for the Demo catalogue in the Demo
Database](images/ui/admviews_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

##### Demo Database Installation

</div>

</div>

</div>

The Virtuoso Demonstration database can be installed with the Conductor
by navigating to the "System Admin" -\> "Packages" tab where a list of
available Virtuoso applications are displayed, one of which is for the
"Demo" database package as shown below:

<div>

<div>

**Figure 6.129. Install Demo db using Conductor UI: "System Admin" -\>
"Packages"**

<div>

<div>

![Install Demo db using Conductor UI: "System Admin" -\>
"Packages"](images/ui/demodbinstall_01.png)

</div>

</div>

</div>

  

</div>

Select the "Demo" package and click on the "Install" button to commence
the installation process:

<div>

<div>

**Figure 6.130. Install Demo db: confirmation**

<div>

<div>

![Install Demo db: confirmation](images/ui/demodbinstall_02.png)

</div>

</div>

</div>

  

</div>

Click on the "proceed" button to install the indicated "Demo Database"
application package:

<div>

<div>

**Figure 6.131. Install Demo db: proceed**

<div>

<div>

![Install Demo db: proceed](images/ui/demodbinstall_03.png)

</div>

</div>

</div>

  

</div>

Once installed the demo database schema can be viewed from the
"Database" -\> "Schema Objects" tab of the Conductor:

<div>

<div>

**Figure 6.132. Install Demo db: view schema objects**

<div>

<div>

![Install Demo db: view schema objects](images/ui/demodbinstall_04.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Editing Triggers

</div>

</div>

</div>

For each table, Virtuoso gives you the ability to edit the triggers
linked to that table, as well as adding new triggers. The link text
"Triggers" is followed by a number in parentheses that tells you how
many triggers exist associated with that table. If no number is shown,
there are no triggers. Clicking on the text takes you to the trigger
edit page.

The triggers page shows you the name of each trigger, an excerpt from
the text of the trigger, and permits you to edit or drop the triggers.
In the last column of the shown form there is a "New Trigger" link for
creation of a new trigger.

</div>

<div>

<div>

<div>

<div>

##### Editing Stored Procedures

</div>

</div>

</div>

The stored procedures link shows a page of information about existing
stored procedures for the database you are viewing. If there are stored
procedures, you can see their names and text excerpts, and you may edit
or drop them. Adding new stored procedures can be done via the ISQL
command-line interface or from the "Create Procedure" link shown above
the list of objects for the relevant database.

<div>

<div>

**Figure 6.133. Viewing Stored Procedures details for the DB catalogue**

<div>

<div>

![Viewing Stored Procedures details for the DB
catalogue](images/ui/admprocedures_01.png)

</div>

</div>

</div>

  

</div>

Stored procedures may also refer to modules that contain a group of
related stored procedures. These are created and edited as a group,
rather than individually. An example of this is the module
DB.DBA.AmazonSearchService, which contains procedures such as
KeywordSearchRequest() and BrowseNodeSearchRequest().

</div>

</div>

<div>

<div>

<div>

<div>

#### External Data Sources

</div>

</div>

</div>

From Database / External Data Sources you will be able to manage the
Virtual Database feature of Virtuoso. You are able to administer ODBC
Data Sources, how to link remote tables and view, and already linked
remote connections.

<div>

<div>

<div>

<div>

##### Data Sources

</div>

</div>

</div>

This tab shows you the available Data Sources. For these one, to which
there is no connection, will be shown the link"Connect". For the
datasource for which there is already established connection, will be
shown the links "Link objects", "Change Credentials" and "Disconnect".

<div>

<div>

**Figure 6.134. Remote Datasources connected to Virtuoso**

<div>

<div>

![Remote Datasources connected to
Virtuoso](images/ui/rmtconnected_01.png)

</div>

</div>

</div>

  

</div>

If you need to alter the authentication details of a particular Data
Source then select the "Change Credentials" link. If you want to link
new objects, select the "Link objects" link.

</div>

<div>

<div>

<div>

<div>

##### Configure Data Sources

</div>

</div>

</div>

This section will allow you to configure the data sources themselves on
the remote machine. The table that will be presented to you will contain
both User and System data sources. You will be able to edit and create
either User or System data sources, however, Virtuoso will only be able
to use the User data sources that belong to the user that started the
Virtuoso Server.

<div>

<div>

**Figure 6.135. Configuring ODBC Datasources**

<div>

<div>

![Configuring ODBC Datasources](images/ui/odbcadm_01.png)

</div>

</div>

</div>

  

</div>

Follow the buttons on the screen as to how you want to manage a data
source. You can create new, edit or remove existing data sources.

<div>

<div>

**Figure 6.136. Configuring A Virtuoso ODBC Datasources**

<div>

<div>

![Configuring A Virtuoso ODBC Datasources](images/ui/virtdsn_01.png)

</div>

</div>

</div>

  

</div>

The Virtuoso Server can make use of File Data Sources too. This provides
the usual associated conveniences. These enable you to migrate a
Virtuoso database to another machine hosting the same ODBC Driver,
Virtuoso then has enough information to connect using the installed
driver to a remote data source, the tables would not need to be
relinked. File DSN's are read from server's root directory. File DSN's
can only be read if this directory is contained in the Virtuoso INI file
parameter DirsAllows.

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                    |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                              |
|                              | Windows NT or 2000 services by default start as the LocalSystem special user account. This account will not contain the same User DSNs as your own user. The Virtuoso service can be started with other users but you must be aware of any possible system permission problems. It is recommended that Virtuoso make use of System or File DSNs wherever possible. |

</div>

</div>

<div>

<div>

<div>

<div>

##### External Linked Objects

</div>

</div>

</div>

This page will allow you to manage the remote objects that are linked
into Virtuoso. You can unlink objects by selecting them and pressing the
"Unlink selected" button.

<div>

<div>

**Figure 6.137. Linking Tables from Remote Datasources**

<div>

<div>

![Linking Tables from Remote Datasources](images/ui/admrmttbls_01.png)

</div>

</div>

</div>

  

</div>

To link new tables into Virtuoso select "Link objects" link or go to the
"Data Sources" tab. Click the "Connect" link for a data source. If this
data source has been used before then the existing authentication
details will automatically be provided. Otherwise you will have to
provide these details in the username and password fields provided. When
you are ready press the "Link objects" link.

As results you should be presented with list of available remote tables
and optionally views and procedures. If the connection fails then an
error will be returned to the top of the page instead. You should be
able to link any of the listed tables or views into Virtuoso. In order
for Virtuoso to be able to correctly query the underlying table it needs
to be able to uniquely identify each row (record) within the table or
view. Tables should always be created with a primary key, and details of
which should be available from the data source. With a primary key
available Virtuoso will be able to link the table in to the server
easily. In some cases and certainly in the case of views Virtuoso may
not be able to determine a primary key or what constitutes uniqueness in
the table. On the right most column will be an action link to a page
that allows you to alter the primary key information about the table or
view that is to be linked. Some primary key information is italized to
indicate the explicit definition of a primary key.

You will be required to enter primary key information for views before
they can be linked.

Select the tables that you want to link into the Virtuoso Server by
checking the check box on the left most column of the list for table or
view in question. When you are ready press the
<span class="emphasis">*Link ...* </span> button at the bottom of the
page.

As result the selected tables will be linked and listed in the first
list as Currently Linked.

</div>

<div>

<div>

<div>

<div>

##### Remote Procedures

</div>

</div>

</div>

In order to view the list of remote procedures, you should check the
"Stored Procedures" check-box and click the button "Apply". As result
the procedures that are already connected to Virtuoso will be shown with
checked check-box. You can unlink these by selecting them and pressing
the <span class="emphasis">*Unlink*</span> button.

To link new procedures into Virtuoso select the Data Source from the
list of available n t ab "Data Sources". If this data source has been
used before then the existing authentication details will automatically
be provided. Otherwise you will have to provide these details in the
username and password fields provided. When you are ready press the
<span class="emphasis">*Link Objects*</span> link. The page will next
require you to select the catalog/owner combination to refine the search
list of procedures on the remote datasource. Check the check-box "Stored
procedures" and click the "Apply" button to list the available stored
procedures.

<div>

<div>

**Figure 6.138. Linking Procedures from Remote Datasources**

<div>

<div>

![Linking Procedures from Remote
Datasources](images/ui/admrmtprocs002.png)

</div>

</div>

</div>

  

</div>

When the page returns you will be presented with a list of available
remote procedures. You should be able to link any of the listed
procedures into Virtuoso.

<div>

<div>

**Figure 6.139. Linking Procedures from Remote Datasources**

<div>

<div>

![Linking Procedures from Remote
Datasources](images/ui/admrmtprocs003.png)

</div>

</div>

</div>

  

</div>

Select the procedures that you want to link into the Virtuoso Server by
checking the check box on the left most column of the list for the
procedure in question. When you are ready press the
<span class="emphasis">*Link ...* </span> button at the bottom of the
page.

You will be presented with a new page that lists the procedures chosen
and the data type information regarding them. This gives you an
opportunity to alter the data type mappings that Virtuoso will use both
internally and for any future interactions with the SOAP server. If you
do not want to specify any special type information the details can be
left as default.

<div>

<div>

**Figure 6.140. Linking Procedures from Remote Datasources**

<div>

<div>

![Linking Procedures from Remote
Datasources](images/ui/admrmtprocs004.png)

</div>

</div>

</div>

  

</div>

For each remote procedure you have the option to change how they will be
referenced within Virtuoso by making changes to the fields for
<span class="emphasis">*Local Name*</span> ,
<span class="emphasis">*Database*</span> , and
<span class="emphasis">*Schema*</span> . These fields define how you
will find the linked procedure locally to Virtuoso only and do not
affect the remote data source.

For each procedure there are radio buttons for selecting the
<span class="emphasis">*PL Wrapper Requirements*</span> . This option is
of particular importance for remote procedures capable of returning a
resultset. Remote procedures can be linked using a Virtuoso PL wrapper
meaning that Virtuoso procedure language code provides a mechanism for
negotiating the result set. The available options are:

|                                                                                                                           |
|---------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Soap Execution*</span> - Generates a PL wrapper that can be published to Web Services.            |
| <span class="emphasis">*SQL Execution*</span> - Generates a PL Wrapper that is more suitable for general SQL use.         |
| <span class="emphasis">*None*</span> - Does not generate and PL Wrapper code and simply links the procedure by reference. |

There is a description input box for you to write a description or
comment for the linked procedure. This comment will only be applicable
to procedures that are linked using a PL Wrapper, and is only directly
applicable for PL Wrappers for SOAP execution.

</div>

</div>

<div>

<div>

<div>

<div>

#### Event Scheduler

</div>

</div>

</div>

The System Admin / Scheduler tab allows you to view, edit and remove
events that can be scheduled to run from a particular time at a defined
interval.

<div>

<div>

**Figure 6.141. Event Scheduler**

<div>

<div>

![Event Scheduler](images/ui/admevt_01.png)

</div>

</div>

</div>

  

</div>

To add a new scheduled event click the "Create New Event" link in tha
last column of the shown form. The Event Name is a unique name required
to uniquely identify each event. Start Time is when the event will be
run for the first time and takes the form of a normal SQL timestamp
value. Interval(minutes) is the length of time in minutes to wait to run
the event again. SQL is a valid piece of SQL that you want to schedule
to run. You can also check for "Enable Error Notification" and enter
E-Mail for error notification.

<div>

<div>

**Figure 6.142. Event Scheduler**

<div>

<div>

![Event Scheduler](images/ui/admevt_01a.png)

</div>

</div>

</div>

  

</div>

Events write possible error messages into the Virtuoso log file.

</div>

<div>

<div>

<div>

<div>

#### Virtuoso Configuration Editor

</div>

</div>

</div>

From System Admin/Parameters you can change the Virtuoso Configuration
settings:

<div>

<div>

**Figure 6.143. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.144. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_02.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.145. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_03.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.146. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_04.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.147. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_05.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.148. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_06.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.149. Virtuoso (virtuoso.ini) Configuration File Editor**

<div>

<div>

![Virtuoso (virtuoso.ini) Configuration File
Editor](images/ui/db_strtp_07.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Dashboard and Monitor

</div>

</div>

</div>

The System Admin/Dashboard consists of a collection of statistical
information about your Virtuoso server. This includes general licensing
information, locking, webserver hits statistics and more.

<div>

<div>

**Figure 6.150. Dashboard**

<div>

<div>

![Dashboard](images/ui/sts_dsk_01.png)

</div>

</div>

</div>

  

</div>

The System Admin/Monitor shows in details statistical information about
your server.

<div>

<div>

**Figure 6.151. Monitor - General Information**

<div>

<div>

![Monitor - General Information](images/ui/sts_gen_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.152. Monitor - HTTP Usage**

<div>

<div>

![Monitor - HTTP Usage](images/ui/sts_httpsvr_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.153. Monitor - Index Usage**

<div>

<div>

![Monitor - Index Usage](images/ui/sts_idx_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.154. Monitor - Profiling**

<div>

<div>

![Monitor - Profiling](images/ui/sts_profile_01.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

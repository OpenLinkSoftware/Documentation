<div id="mt_JDBCDemos" class="section">

<div class="titlepage">

<div>

<div>

## 11.9. OpenLink Demonstration Programs

</div>

</div>

</div>

To assist you further during your utilization or evaluation of
OpenLink's Drivers for JDBC a number of demonstration JDBC compliant
Applets and Applications are bundled with your OpenLink Driver for JDBC
installation, these programs are provided in both binary and source code
format for your free use. The sections that follow guide you through the
process of using these programs

<div id="mt_JDBCAppletDemos" class="section">

<div class="titlepage">

<div>

<div>

### 11.9.1. JDBC Compliant Applet Demos

</div>

</div>

</div>

Three JDBC applet samples are bundled with your OpenLink Driver for JDBC
installation, each one of these demonstrating practical use of JDBC
applets and highlighting OpenLink specific functionality. Each of these
demos reside in the "samples\jdbc\jdk\[10 or 11 or 12\]" sub-directory
below the directory into which you installed your OpenLink software.
Each applet is accessible from the OpenLink Admin Assistant (an OpenLink
agent that provides HTTP services like any Web Server does). The
programs are:

<div class="orderedlist">

1.  **JDBCDemo. ** demonstrates basic JDBC functionality via an Applet

2.  **ScrollDemo. ** demonstrates JDBC functionality via an Applet. It
    also demonstrates the additional Resultset navigation functionality
    provided by OpenLink's Scrollable Resultset & RowSet Extensions for
    JDBC on a Record by Record Basis.

3.  **ScrollDemo2. ** demonstrates JDBC functionality via an Applet. It
    also demonstrates the additional Resultset navigation functionality
    provided by JDBC 2.0

4.  **RowSetDemo. ** demonstrates JDBC functionality via an Applet. It
    also demonstrates the additional Resultset navigation functionality
    provided by OpenLink's Scrollable Resultset & RowSet Extensions for
    JDBC on a RowSet by RowSet Basis.

</div>

</div>

<div id="mt_SimpleJDBCDemo" class="section">

<div class="titlepage">

<div>

<div>

### 11.9.2. JDBCDemo

</div>

</div>

</div>

This applet demonstrates basic JDBC functionality via an Applet.

Utilization Steps:

<div class="orderedlist">

1.  Start the OpenLink Request Broker

2.  Start up your Web Browser

3.  Enter one of the following URLs into your browser depending on the
    location of your OpenLink Request Broker:

    Local To you:

    ``` programlisting
    http://localhost:8000
    ```

    Remote Server:

    ``` programlisting
    http://<hostname or IP address of remote server>:8000
    ```

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                    |
    |:----------------------------:|:-------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                              |
    |                              | Port "8000" presumes that you provide this value when prompted during your OpenLink Sever components installation. |

    </div>

4.  Follow the Admin Assistant's Menu tree to the location of the
    "Sample Applications-\>JDBC Applet Demos" menu item. The graphic
    below depicts this process.

    <div class="figure-float">

    <div id="mt_fg-001" class="figure">

    **Figure 11.7. JDBC Applet Demos**

    <div class="figure-contents">

    <div class="mediaobject">

    ![JDBC Applet Demos](images/clicls0x.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Click on the hyperlink that reads "Applet demonstration with
    OpenLink Software JDBC Driver"

6.  Use the Applet's File-\>Set Connection URL menu item to enter a URL
    to the data source. If uncertain follows the instructions laid out
    in the section covering OpenLink JDBC URL formats which shows you
    how to construct Type 1, 2, and 3 URL formats for your OpenLink
    Drivers for JDBC. This applet will run with non OpenLink Drivers for
    JDBC but you will need to obtain URL construction information from
    the relevant driver vendor.

    The line below depicts the URL construction dialog presented:

    ``` programlisting
    jdbc:openlink://localhost/SVT=Oracle 7/DATABASE=ORCL/UID=scott/PWD=tiger
    ```

7.  Enter a valid SQL statement for the backend database that you are
    connecting to via JDBC and then click on the "Query" button. The
    screen shot below depicts this process:

    <div class="figure-float">

    <div id="mt_fg-002" class="figure">

    **Figure 11.8. WebJDBC Applet Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebJDBC Applet Demo](images/clicls09.gif)

    </div>

    </div>

    </div>

      

    </div>

8.  Basic JDBC 1.1 functionality provides Forward-Only as opposed to
    Bi-Directional record Scrolling, this is why the basic JDBC applet
    on has a "Next" button. When you click on the "Next" button you are
    moved to the next record in your JDBC resultset, unfortunately you
    have to hit the "Query" button again and re-start the Forward-Only
    resultset navigation if you need to see the First or Prior resultset
    records from your current position. The examples that follow show
    how OpenLink and the new release of JDBC (version 2.0) address the
    Bi-Directional Scrolling Limitation demonstrated by this Applet.

</div>

</div>

<div id="mt_ScrollDemo" class="section">

<div class="titlepage">

<div>

<div>

### 11.9.3. ScrollDemo

</div>

</div>

</div>

This program demonstrates JDBC functionality via an Applet. It also
demonstrates the additional Resultset navigation functionality provided
by OpenLink's Scrollable Resultset & RowSet Extensions for JDBC on a
Record by Record Basis.

Utilization Steps:

<div class="orderedlist">

1.  Start the OpenLink Request Broker.

2.  Start up your Web Browser

3.  Enter one of the following URLs into your browser depending on the
    location of your OpenLink Request Broker:

    Local To you:

    http://localhost:8000

    Remote Server:

    http://\<hostname or IP address of remote server\>:8000

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                    |
    |:----------------------------:|:-------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                              |
    |                              | Port "8000" presumes that you provide this value when prompted during your OpenLink Sever components installation. |

    </div>

4.  Follow the Admin Assistant's Menu tree to the location of the "JDBC
    Applet Demos" menu item. The graphic below depicts this process.

    <div class="figure-float">

    <div id="mt_fg-003" class="figure">

    **Figure 11.9. WebJDBC Applet Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebJDBC Applet Demo](images/clicls0x.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Click on the hyperlink that reads "Applet demonstration with
    OpenLink Software JDBC Scrollable Cursor extensions"

6.  Use the Applet's File-\>Set Connection URL menu item to enter a URL
    to the data source. If uncertain follows the instructions laid out
    in the section covering OpenLink JDBC URL formats which shows you
    how to construct Type 1, 2, and 3 URL formats for your OpenLink
    Drivers for JDBC.

    The line below depicts the URL construction dialog presented:

    ``` programlisting
    jdbc:openlink://localhost/SVT=Oracle 7/DATABASE=ORCL/UID=scott/PWD=tiger
    ```

7.  Enter a valid SQL statement for the backend database that you are
    connecting to via JDBC and then click on the "Query" button. The
    screen shot below depicts this process:

    <div class="figure-float">

    <div id="mt_fg-004" class="figure">

    **Figure 11.10. WebScroll Applet Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebScroll Applet Demo](images/clicls12.gif)

    </div>

    </div>

    </div>

      

    </div>

8.  JDBC 1.1 functionality provides Forward-Only as opposed to
    Bi-Directional Resultset Scrolling, OpenLink's Scrollable Resultset
    Extensions for JDBC enable Bi-Directional Resultset Scrolling. This
    is why this applet has an additional set of Resultset Navigation
    buttons: "First","Next", "Prior","Last", "Lock", "Unlock", "Add",
    "Update", "Get Bookmark", "Set Bookmark", "and Go To" . The
    existence of Bi-directional Scrollable Resultsets (or Cursors) is
    often presumed by end-users and developers alike, its importance
    rarely understood prior to embarking upon JDBC application
    development or product selection, the unfortunate consequence being
    complex application re-writes or implementation of sub par JDBC
    solutions. Each of the button in the applet demo is explained below
    so as to understand the magnitude of this issue:

    <div id="id11900" class="table">

    **Table 11.15. Scroll Demo Keys Explained**

    <div class="table-contents">

    | Button       | Explanation                                                                  |
    |:-------------|------------------------------------------------------------------------------|
    | First        | takes you to first record in the Resultset                                   |
    | Next         | takes you to the next record in the Resultset from your current position     |
    | Prior        | takes you to the previous record in the Resultset from your current position |
    | Last         | takes you to the last record in the Resultset                                |
    | Lock         | locks the current record                                                     |
    | Unlock       | unlocks the current record                                                   |
    | Add          | add a new record to database                                                 |
    | Update       | change current record                                                        |
    | Delete       | remove current record from database                                          |
    | Get Bookmark | mark current record position for future revisit                              |
    | Set Bookmark | revisit previous marked position in current ResultSet                        |
    | Go To        | go directly to a specific record number within the current ResultSet         |
    | Refresh      | Reopen current resultset                                                     |

    </div>

    </div>

      

</div>

</div>

<div id="mt_Scroll2Demo" class="section">

<div class="titlepage">

<div>

<div>

### 11.9.4. ScrollDemo2

</div>

</div>

</div>

This applet demonstrates JDBC functionality via an Applet. It also
demonstrates the additional Resultset navigation functionality provided
by JDBC 2.0

This Applet require a browser that is Java Virtual Machine version 1.2.x
or 2.x compliant. If you do not have such a Browser, you can simply run
the JDBC Application version of this program.

Utilization Steps:

<div class="orderedlist">

1.  Start the OpenLink Request Broker

2.  Start up your Web Browser

3.  Enter one of the following URLs into your browser depending on the
    location of your OpenLink Request Broker:

    Local To you:

    http://localhost:8000/

    Remote Server:

    http://\<hostname or IP address of remote server\>:8000

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                    |
    |:----------------------------:|:-------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                              |
    |                              | Port "8000" presumes that you provide this value when prompted during your OpenLink Sever components installation. |

    </div>

4.  Follow the Admin Assistant's Menu tree to the location of the
    "Sample Applications-\>JDBC Applet Demos" menu item. The graphic
    below depicts this process.

    <div class="figure-float">

    <div id="mt_fg-005" class="figure">

    **Figure 11.11. Scroll2 Applet Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Scroll2 Applet Demo](images/clicls0x.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Click on the hyperlink that reads "Applet demonstration with
    OpenLink Software JDBC 2.0 Scrollable Cursors"

6.  Use the Applet's File-\>Set Connection URL menu item set register
    your Driver for JDBC 2.0 and then enter a URL pointing to an ODBC
    DSN. If uncertain follow the instructions laid out in the section
    covering OpenLink JDBC URL formats which shows you how to construct
    Type 1, and 3 URL formats for your OpenLink Drivers for JDBC. This
    applet will run with non OpenLink Drivers for JDBC but you will need
    to obtain Driver registration and JDBC URL construction information
    from the relevant Driver vendor.

    The screen shot below depicts the URL construction dialog presented:

    <div class="figure-float">

    <div id="mt_fg-006" class="figure">

    **Figure 11.12. Connection dialog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection dialog](images/clicls08.gif)

    </div>

    </div>

    </div>

      

    </div>

7.  Enter a valid SQL statement for the backend database that you are
    connecting to via JDBC and then click on the "Query" button.

8.  JDBC 1.1 functionality provides Forward-Only as opposed to
    Bi-Directional Resultset Scrolling, JDBC 2.0 on the other hand
    supports Bi-Directional Resultset Scrolling. As a result this applet
    has an additional set of Resultset Navigation buttons:
    "First","Next", "Previous","Last", "Insert", "Update", "Absolute",
    "Relative". Unfortunately JDBC 2.0 does not provide Bookmarking or
    Row Level concurrency control hence the exclusion of the "Lock",
    "UnLock", "Go To", "Set Bookmark", "Get Bookmark" navigation buttons
    provided in the "ScrollDemo" applet. To use this functionality in a
    JDBC 2.0 environment you simply make use of the OpenLink Scrollable
    ResultSet & RowSet Extensions.

    Each navigation button is described below so as to shed more light
    on the Scrollable ResultSet functionality provided by JDBC 2.0.

    <div id="id11989" class="table">

    **Table 11.16. Scroll Demo Keys Explained**

    <div class="table-contents">

    | Button   | Explanation                                                                                                                                                                                                                                       |
    |:---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | First    | takes you to first record in the Resultset                                                                                                                                                                                                        |
    | Next     | takes you to the next record in the Resultset from your current position                                                                                                                                                                          |
    | Previous | takes you to the previous record in the Resultset from your current position                                                                                                                                                                      |
    | Last     | takes you to the last record in the Resultset                                                                                                                                                                                                     |
    | Add      | add a new record to database                                                                                                                                                                                                                      |
    | Update   | change current record                                                                                                                                                                                                                             |
    | Delete   | remove current record from database                                                                                                                                                                                                               |
    | Relative | moves N number of records forward from the current record where N represents a value entered into the field beside the "Relative" button. IF the field contains a negative number then it indicates a backwards move.                             |
    | Absolute | go directly to record number N within the current ResultSet where N represents a value entered into the field beside the "Relative" button, the actual direction of Resultset navigation depends on the actual location of the record in question |
    | Refresh  | Reopen current resultset                                                                                                                                                                                                                          |

    </div>

    </div>

      

</div>

</div>

<div id="mt_RowSetDemo" class="section">

<div class="titlepage">

<div>

<div>

### 11.9.5. RowSetDemo

</div>

</div>

</div>

This applet demonstrates JDBC functionality via an Applet. It also
demonstrates the additional Resultset navigation functionality provided
by OpenLink's Scrollable Resultset & RowSet Extensions for JDBC on a
RowSet by RowSet Basis.

Utilization Steps:

<div class="orderedlist">

1.  Start the OpenLink Request Broker

2.  Start up your Web Browser

3.  Enter one of the following URLs into your browser depending on the
    location of your OpenLink Request Broker:

    Local To you:

    ``` programlisting
    http://localhost:8000
    ```

    Remote Server:

    ``` programlisting
    http://<hostname or IP address of remote server>:8000
    ```

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                    |
    |:----------------------------:|:-------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                              |
    |                              | Port "8000" presumes that you provide this value when prompted during your OpenLink Sever components installation. |

    </div>

4.  Follow the Admin Assistant's Menu tree to the location of the
    "Sample Applications-\>JDBC Applet Demos" menu item. The graphic
    below depicts this process.

    <div class="figure-float">

    <div id="mt_fg-007" class="figure">

    **Figure 11.13. Connection dialog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection dialog](images/clicls0x.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Click on the hyperlink that reads "Applet demonstration with
    OpenLink Software JDBC Scrollable Cursor RowSet Extensions"

6.  Use the Applet's File-\>Set Connection URL menu item set a URL
    pointing to an ODBC DSN. If uncertain follows the instructions laid
    out in the section covering OpenLink JDBC URL formats which shows
    you how to construct Type 1 and 3 URL formats for your OpenLink
    Drivers for JDBC. This applet will run with non OpenLink Drivers for
    JDBC but you will need to obtain URL construction information from
    the relevant driver vendor.

    The screen shot below depicts the URL construction dialog presented:

    <div class="figure-float">

    <div id="mt_fg-008" class="figure">

    **Figure 11.14. URL Construction**

    <div class="figure-contents">

    <div class="mediaobject">

    ![URL Construction](images/clicls08.gif)

    </div>

    </div>

    </div>

      

    </div>

7.  Enter a valid SQL statement for the backend database that you are
    connecting to via JDBC and then click on the "Query" button. The
    screen shot below depicts this process:

    <div class="figure-float">

    <div id="mt_fg-009" class="figure">

    **Figure 11.15. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/clicls15.gif)

    </div>

    </div>

    </div>

      

    </div>

8.  JDBC 1.1 functionality provides Forward-Only as opposed to
    Bi-Directional Resultset Scrolling, JDBC 2.0 provides Scrollable
    Resultsets but does not provide Bookmarking or Attached RowSets
    (transient RowSets located in the same process space as the
    ResultSet). OpenLink's Scrollable Resultset Extensions for JDBC
    address these issues irrespective of JDBC version. As a result this
    applet has an additional set of Resultset Navigation buttons when
    compared to the basic JDBC 2.0 Applet in the prior section, the
    buttons are: "First","Next", "Prior","Last", "Lock", "Unlock",
    "Add", "Update", "Get Bookmark", "Set Bookmark", "and Go To" . The
    existence of transient RowSets due to Bi-directional Scrollable
    Resultsets (or Cursors) in JDBC 2.0 is more than likely presumed to
    exist by end-users and developers alike, it is important that you
    take note of this before embarking upon JDBC 2.0 application
    development or product selection. Each of the buttons in the Applet
    demo is explained below so as to assist in the understanding of
    these matters:

    <div id="id12072" class="table">

    **Table 11.17. Scroll Demo Keys Explained**

    <div class="table-contents">

    | Button       | Explanation                                                                  |
    |:-------------|------------------------------------------------------------------------------|
    | First        | takes you to first RowSet in the Resultset                                   |
    | Next         | takes you to the next RowSet in the Resultset from your current position     |
    | Prior        | takes you to the previous RowSet in the Resultset from your current position |
    | Last         | takes you to the last RowSet in the Resultset                                |
    | Lock         | locks the current RowSet                                                     |
    | Unlock       | unlocks the current RowSet                                                   |
    | Add          | add a new record to database                                                 |
    | Update       | change current record with the current RowSet of                             |
    | Delete       | remove current record from within the current RowSet from the database       |
    | Get Bookmark | mark current RowSet within Resultset for future revisit                      |
    | Set Bookmark | revisit previous marked RowSet position in current ResultSet                 |
    | Go To        | go directly to a specific record number within the current ResultSet         |
    | Refresh      | Reopen current resultset                                                     |

    </div>

    </div>

      

</div>

</div>

<div id="mt_JDBCDemoApplications" class="section">

<div class="titlepage">

<div>

<div>

### 11.9.6. JDBC compliant Application Demos

</div>

</div>

</div>

All the JDBC compliant Applet demos described in the previous sections
have also been implemented as JDBC compliant Applications Demos, you can
run these programs in a number of ways depending on operating system
hosting your Java Virtual Machine.

<div id="mt_WindowsJDBCAppDemos" class="section">

<div class="titlepage">

<div>

<div>

#### Windows 95/98/NT/2000

</div>

</div>

</div>

<div class="orderedlist">

1.  Click on your Windows Start Menu Button

2.  Select the "OpenLink Data Access Drivers" Start Menu Group

3.  Locate the "JDBC Samples" Menu Item

4.  Choose from the list of JDBC Applications presented

</div>

</div>

<div id="mt_LinuxJDBCAppDemos" class="section">

<div class="titlepage">

<div>

<div>

#### Linux or UNIX

</div>

</div>

</div>

<div class="orderedlist">

1.  Move into your OpenLink base installation directory

2.  The move to the following directory listing output maps out the
    location of the various JDBC Application demos by Java Virtual
    Machine version:

    ``` screen
    JDBC/jdk1.1.x/Applications:
    JDBCDemo RowSetDemo ScrollDemo
    JDBC/jdk1.1.x/Applications/JDBCDemo:
    DialogConnection.class JDBCDemo.class
    DialogConnection.java JDBCDemo.java
    JDBC/jdk1.1.x/Applications/RowSetDemo:
    DataTextField.class DialogConnection.java readme.txt
    DataTextField.java RowSetDemo.class
    DialogConnection.class RowSetDemo.java
    JDBC/jdk1.1.x/Applications/ScrollDemo:
    DialogConnection.class ScrollDemo.class readme.txt
    DialogConnection.java ScrollDemo.java
    JDBC/jdk1.2.x/Applications:
    JDBCDemo RowSetDemo ScrollDemo ScrollDemo2
    JDBC/jdk1.2.x/Applications/JDBCDemo:
    DialogConnection.class JDBCDemo.class
    DialogConnection.java JDBCDemo.java
    JDBC/jdk1.2.x/Applications/RowSetDemo:
    DataTextField.class DialogConnection.java readme.txt
    DataTextField.java RowSetDemo.class
    DialogConnection.class RowSetDemo.java
    JDBC/jdk1.2.x/Applications/ScrollDemo:
    DialogConnection.class ScrollDemo.class readme.txt
    DialogConnection.java ScrollDemo.java
    JDBC/jdk1.2.x/Applications/ScrollDemo2:
    DialogConnection.class ScrollDemo2.class
    DialogConnection.java ScrollDemo2.java
    JDBC/jdk1.3.x/Applications:
    JDBCDemo RowSetDemo ScrollDemo ScrollDemo2
    JDBC/jdk1.3.x/Applications/JDBCDemo:
    DialogConnection.class JDBCDemo.class
    DialogConnection.java JDBCDemo.java
    JDBC/jdk1.3.x/Applications/RowSetDemo:
    DataTextField.class DialogConnection.java readme.txt
    DataTextField.java RowSetDemo.class
    DialogConnection.class RowSetDemo.java
    JDBC/jdk1.3.x/Applications/ScrollDemo:
    DialogConnection.class ScrollDemo.class readme.txt
    DialogConnection.java ScrollDemo.java
    JDBC/jdk1.3.x/Applications/ScrollDemo2:
    DialogConnection.class ScrollDemo2.class
    DialogConnection.java ScrollDemo2.java
    ```

3.  Move into the appropriate directory and then execute the following
    command:

    ``` programlisting
    java <classname>
    ```

    where "\<classname\>" represents the JDBC class file hosting your
    JDBC application demo. For instance if you wanted to run the
    "RowSetDemo" JDBC application you would type the following:

    ``` programlisting
    java RowSetDemo
    ```

</div>

</div>

</div>

</div>

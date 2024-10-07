<div id="mt_relinkdb" class="section">

<div class="titlepage">

<div>

<div>

## 8.5. Linking OpenLink DB Agents

</div>

</div>

</div>

<div id="mt_relinkgeneral" class="section">

<div class="titlepage">

<div>

<div>

### 8.5.1. General Linking Approach

</div>

</div>

</div>

To relink Progress database Agents, see the next section.

It is sometimes necessary to link or re-link your OpenLink database
agents when one of the following situations arise:

<div class="itemizedlist">

- No database agent executable was supplied with the OpenLink server
  components installed on your OpenLink server machine

- A database agent executable file exists but is unable to converse with
  your database server due to version incompatibility

</div>

OpenLink provides a database agent relink script for each supported
database engine, this script is named using the following convention:

<div class="itemizedlist">

- ld - indicates a link script

- XXX - first three letters (perhaps 4) of database name

- NN - major and perhaps minor release number

- mv - If the agent is multhreaded

</div>

Examples: ldora81mv is Oracle 8i mulithreaded agent. ldoig2 is for
Ingres II.

<div id="mt_relinksteps" class="section">

<div class="titlepage">

<div>

<div>

#### Relink Steps

</div>

</div>

</div>

<div class="orderedlist">

1.  Move to the "lib" sub-directory of your OpenLink server components
    installation directory e.g: "/usr/openlink/lib"

2.  Setup key OpenLink link script environment variables which create a
    reference to key database environment variables required for making
    a native connections to your database engine:

    ``` programlisting
                  DB2
                  DB2DIR=$DB2INST
                  Informix
                  INFORMIX5DIR=$INFORMIXDIR
                  INFORMIX6DIR=$INFORMIXDIR
                  INFORMIX7DIR=$INFORMIXDIR
                  Ingres
                  INGRES6DIR=$II_SYSTEM/ingres
                  INGRES7DIR=$II_SYSTEM/ingres
                  Oracle
                  ORACLE6DIR=$ORACLE_HOME
                  ORACLE7DIR=$ORACLE_HOME
                  ORACLE8DIR=$ORACLE_HOME
                  Solid
                  SOLIDDIR=$SOLID                                             
                  Sybase
                  SYBASE10DIR=$SYBASE
                  SYBASE11DIR=$SYBASE
                  SYBASE4DIR=$SYBASE
                  Unify
                  UNIFYDIR=$UNIFY../lib
                  Velocis
                  VELOCISDIR=$VELOCIS
                  Virtuoso
                  VIRTUOSODIR=$VIRTUOSO
                
    ```

    You can also opt to manually configure these values in the "dbpaths"
    file situated in the same directory as your database agent link
    script.

3.  Ensure that the "lib" subdirectory that your are working within is
    also part of your system PATH, if this isn't the case add this
    directory to the system PATH.

4.  Run the appropriate link script (ldXXXNN) which will attempt to
    build a new database agent (XXX_sv or XXX_mv). Once the relink
    process is completed the new database agent executable is placed in
    the "bin" subdirectory directory of your OpenLink server components
    installation using. The new database agent binary will be named
    accordingly using the "XXX_sv" or "XXX_mv" database agent naming
    convention.

</div>

</div>

</div>

<div id="mt_relinkpro" class="section">

<div class="titlepage">

<div>

<div>

### 8.5.2. Relinking Progress Agents

</div>

</div>

</div>

The files described below should all be part of current agent
installations.

We have attempted to provide a set of generic link scripts for the
versions of Progress we support, to enable you to relink if necessary.

Please note that to relink against Progress 6 you require a HLI/C
license from Progress in order to do so. For Progress 7, 8, 9 this is
not required.

Remember to back up OpenLink files before you begin.

Follow the instructions below to relink an OpenLink Progress Database
agent:

<div class="orderedlist">

1.  Change directory to the 'openlink/lib' directory.

2.  Ensure the Progress environment variable DLC is set correctly.

3.  Set the Progress PROLOAD environment variable to \$DLC/probuild.

4.  Run the 'mkdlcX' script which will produce a file called 'dlcX.o',
    where X represent Progress version 6, 7, 8, 9 depending on the major
    version number of your Progress installation.

5.  If you receive an error stating that any of the Progress libraries
    cannot be found, edit the "mkdlcX" script and then remove the
    reference to the named file. Then rerun it "mkdlcX".

6.  Run the script 'ldproX' which will build a new OpenLink Progress X
    agent (proX_sv or proX_mv), and place it directly in the
    'openlink/bin' directory.

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                          |
|                              | Relinking is only necessary if you are running a different version of Progress to the one used for linking the agents provided |

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                             |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                       |
|                              | If you cannot find the files described above with your installation then you may have an older version of the software. Please contact OpenLink Support for assistance at: http://www.openlinksw.com/support/suppindx.htm . |

</div>

</div>

</div>

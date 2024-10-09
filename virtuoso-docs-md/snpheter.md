<div>

<div>

<div>

<div>

### 13.2.6. Heterogeneous snapshot replication

</div>

</div>

</div>

Virtuoso allows incremental and bi-directional snapshot replication
flavors to be used with non-Virtuoso databases.

The following databases are supported in incremental snapshot
replication:

|                             |
|-----------------------------|
| SQL Server 2000 and later   |
| Oracle 8i and later         |
| IBM DB2 8.1 and later       |
| Informix IDS 9.40 and later |

The following databases are supported in bi-directional snapshot
replication:

|                           |
|---------------------------|
| SQL Server 2000 and later |
| Oracle 8i and later       |
| IBM DB2 8.1 and later     |

DBMS-specific notes:

<div>

1.  <span class="emphasis">*SQL Server 2000 and later* </span>
    Bi-directional snapshot triggers for SQL Server require "nested
    triggers" server option to be "On" (which is "On" by default).

2.  <span class="emphasis">*Oracle 8i* </span>

    <div>

    1.  Oracle 8i does not have support for "localtimestamp" data type
        out of box. Required functionality can be enabled by editing
        \$ORACLE_HOME/rdbms/admin/standard.sql script. The following
        statement

        ``` programlisting
        pragma new_names('8.1.6',
                         dbtimezone, sessiontimezone, localtimestamp,
                         localtime, to_local_tz, to_db_tz,
                         cube, rollup, grouping, "TIMESTAMP WITH LOCAL TIME ZONE");
        ```

        should be changed to

        ``` programlisting
        --pragma new_names('8.1.6',
        --                 dbtimezone, sessiontimezone, localtimestamp,
        --                 localtime, to_local_tz, to_db_tz,
        --                 cube, rollup, grouping, "TIMESTAMP WITH LOCAL TIME ZONE");
        ```

        After \$ORACLE_HOME/rdbms/admin/standard.sql is edited it should
        be executed with SYS user privileges:

        ``` programlisting
        $sqlplus SYS/CHANGE_ON_INSTALL @$ORACLE_HOME/rdbms/admin/standard.sql
        ```

        where "CHANGE_ON_INSTALL" is password for user SYS.Oracle 9i and
        later has this type in the default installation and this step is
        not necessary.

    2.  ODBC driver from Oracle 8.1.6 (and earlier versions) is known to
        be buggy and may cause Virtuoso server to crash when snapshot
        replication with Oracle database is set up. ODBC driver from
        Oracle 8.1.7 and later is recommended.

    3.  Oracle ODBC driver uses Oracle NLS settings by default for
        determining decimal separator. If decimal separator in the
        locale is not '.' (period) there will be interoperability errors
        with Virtuoso. Oracle ODBC driver can be forced to use US
        Settings for numerics: open Oracle ODBC driver configuration
        dialog, select "Application" tab and set "Numeric Settings" to
        "Use US Settings".

    </div>

3.  <span class="emphasis">*DB2 8.1 ESE* </span>

    <div>

    1.  FixPak 3 is recommended because ODBC driver from earlier DB2 8
        versions may cause Virtuoso server to crash when BLOB columns
        exist in replicated tables.

    2.  DB2 CLI/ODBC driver uses default locale's decimal separator. If
        decimal separator in the locale is not '.' (period) Virtuoso
        fails to parse numeric values. The default behavior of the DB2
        CLI/ODBC driver can be modified by specifying PATCH2 CLI/ODBC
        configuration keyword in the db2cli.ini initialization file. Add
        the following line to your DSN config in db2cli.ini:

        ``` programlisting
        PATCH2=15
        ```

        This will force DB2 CLI/ODBC driver to always use period ('.')
        as decimal separator.

    </div>

4.  <span class="emphasis">*Informix IDS 9.40* </span> Informix IDS
    can't report current time in UTC. This may cause snapshot
    replication to fail when timezone change occurs. In order to set up
    snapshot replication with Informix server properly any of the
    following steps must be taken:

    |                                                                                  |
    |----------------------------------------------------------------------------------|
    | Informix server must be run in UTC time zone.                                    |
    | "snp_repl_time_offset" registry variable should be set to value greater than 60. |

    The second method may cause additional system load on updates and
    will cause transactions to be replayed out of order when timezone
    change occurs.

</div>

</div>

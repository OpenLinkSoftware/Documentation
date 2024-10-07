<div id="grant" class="section">

<div class="titlepage">

<div>

<div>

## 9.23. GRANT, REVOKE Statement

</div>

</div>

</div>

``` programlisting
privilege_def
    : GRANT ALL PRIVILEGES TO grantee
    | GRANT privileges ON table TO grantee_commalist opt_with_grant_option
    | GRANT grantee_commalist TO grantee_commalist opt_with_admin_option
    ;

privilege_revoke
    : REVOKE ALL PRIVILEGES FROM grantee_commalist
    | REVOKE privileges ON table FROM grantee_commalist
    | REVOKE grantee_commalist FROM grantee_commalist
    ;

opt_with_grant_option
    : /* empty */
    | WITH GRANT OPTION
    ;

opt_with_admin_option
    : /* empty */
        | WITH ADMIN OPTION
    ;

privileges
    : ALL PRIVILEGES
    | ALL
    | operation_commalist
    ;

operation_commalist
    : operation
    | operation_commalist ',' operation
    ;

operation
    : SELECT priv_opt_column_commalist
    | INSERT
    | DELETE
    | UPDATE priv_opt_column_commalist
    | REFERENCES opt_column_commalist
    | EXECUTE
    | REXECUTE
    | role_name
    ;

grantee_commalist
    : grantee
    | grantee_commalist ',' grantee

    ;

grantee
    : PUBLIC
    | user
    ;

user
    : IDENTIFIER

role_name
    : IDENTIFIER
```

The GRANT and REVOKE statements are used to define privileges on
resources to users and user groups (roles). A resource is a table, view
or stored procedure. A grantee can be PUBLIC, meaning any present or
future user accounts or a user name. Granting a privilege to a user name
means that this user AND any users which have this user as their user
group have the privilege.

Only a granted privilege can be revoked. The sequence:

``` programlisting
grant select on employee to public;
revoke select (e_review) from joe;
```

Is invalid because the privilege being revoked was not granted, instead
it was implied by the select on all column to public.

Any role name created by the CREATE ROLE statement is a valid grantee
and a valid grantable operation.

The term 'effective privilege of a user' means the set of privileges
given to a user by virtue of 1. granting them to public 2. granting them
to a role which is granted to the user or to a role either directly or
indirectly granted to the user or 3. granting them, to the specific
user. The dba user and all users whose group is 'dba' have all
privileges.

The phrase

``` programlisting
GRANT ALL PRIVILEGES TO user;
```

is synonymous with setting the user's group to 'dba'.

The effective privileges inside a trigger are those of the owner of the
table whose trigger is executing. The privilege of executing a trigger
is derived from the privilege of performing the trigger action, e.g.
update of a specific column.

The effective privilege inside a stored procedure is that of the owner
of the procedure. The privilege to execute a given procedure is granted
with the EXECUTE clause.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                             |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                       |
|                              | The grantee names are identifiers. This means that their case can be converted to upper case unless they are quoted. The identifier case conversion depends on the global CaseMode setting. |

</div>

A user may grant or revoke privileges on resources of which he/she is
the owner. A user with effective dba privileges may manipulate any
privileges.

<div id="id34164" class="example">

**Example 9.40. Examples:**

<div class="example-contents">

``` programlisting
grant update ("Salary") on "Employees" to "Manager";

grant execute on "SalesReport" to "Accounting";
```

</div>

</div>

  

<span class="emphasis">*GRANT REFERENCES*</span> is a privilege required
by a user on a table so that this user can create new tables referencing
such tables in foreign keys where he/she would otherwise be restricted.

**Remote SQL Data Sources. ** To provide further consistent security to
remote data, only the DBA group is permitted to use the `rexecute()` ,
unless explicitly granted. Caution is required here since any user
granted use of `rexecute()` has full control of the remote data source
set-up by the DBA, however limited to the overall abilities of the
remote user on the remote data source.

Users can be granted and denied access to `rexecute()` using the
following syntax:

``` programlisting
GRANT REXECUTE ON '<attached_dsn_name>' TO <user_name>
REVOKE REXECUTE ON '<attached_dsn_name>' FROM <user_name>
```

**UDTs. ** Security of UDTs is maintained through normal SQL GRANT and
REVOKE statements via a simple extension. You can define the level of
access to both native and externally hosted UDTs. Grants for persistent
user defined types are persisted into the SYS_GRANTS table. Grants on
temporary user defined types are in-memory only and are lost (together
with the temporary user defined type definition) when the server is
restarted.

There are two GRANT/REVOKE types for UDTs as follows:

|                                                                                                             |
|-------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*EXECUTE*</span> - all methods and members of a class are accessible to the grantee. |
| <span class="emphasis">*UNDER*</span> - the grantee can create subclasses of the class.                     |

``` programlisting
GRANT/REVOKE EXECUTE on <user_defined_type>
GRANT/REVOKE UNDER on <user_defined_type>
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                              |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                        |
|                              | SQL modules, user defined types and SQL stored procedures are exposed to GRANT/REVOKE in the same namespace, therefore care must be taken avoid inadvertently granting to multiple objects at the same time. |

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                |
|:--------------------------:|:---------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                      |
|                            | <a href="ch-server.html#vdbstoredprocs" class="link"           
                              title="VDB Stored Procedures &amp; Functions">Virtual Database  
                              Procedures &amp; Functions</a>                                  |

</div>

</div>

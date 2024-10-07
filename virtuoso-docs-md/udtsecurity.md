<div id="udtsecurity" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.17. UDT Security

</div>

</div>

</div>

Security of UDTs is maintained through normal SQL GRANT and REVOKE
statements via a simple extension. You can define the level of access to
both native and externally hosted UDTs.

Grants for persistent user defined types are persisted into the
SYS_GRANTS table. Grants on temporary user defined types are in-memory
only and are lost (together with the temporary user defined type
definition) when the server is restarted.

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

</div>

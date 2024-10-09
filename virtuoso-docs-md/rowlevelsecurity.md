<div>

<div>

<div>

<div>

## 11.22. Row Level Security

</div>

</div>

</div>

Organizations often need to compartmentalize access to data. This may be
implemented at the level of physically segregating systems, building
specific application logic or within the database.

Physically disconnected systems can be troublesome in an increasingly
integrated corporate IS environment. Building access rules into
application logic, typically in a middle tier is possible and flexible
but the protection runs the risk of being circumvented by direct access
to the database, through business intelligence tools for example.

For these reasons some database level security enforcement is needed in
most applications. SQL provides table and column level privileges which
can be granted to users and roles. These do not address issues where one
department's data should be accessible when another department's data
should not. Such segregation within a table is usually done with views
which hard-code selection criteria. The table itself will not be granted
but views to specific ranges of rows will be granted to users.

This has the inconvenience of requiring administration of views and
requiring applications to use different views for different end users.

Row level security or policy based security allows the SQL compiler to
make choices according to which user is accessing any given table. Extra
conditions will be introduced into a SQL statement at compile time in
order to limit the user to a specific range of rows. This will apply
equally to reading and modifying the table.

A policy is a SQL function that will be called by the SQL compiler each
time a table having the policy is accessed in a user's query or stored
procedure. The policy can return extra conditions which will be and'ed
to the conditions in the query. After this is done, the new query is
optimized and compiled. This mechanism makes it possible to
transparently customize which information a user account sees without
having to maintain a multiplicity of static views. This mechanism cannot
be subverted by a user and will work no matter what application is used
against the database.

Let us consider the example of a table of classified documents. To
access a document, the user needs to have a record in a need-to-know
table which forms a many-to-many between classifications and users. If
the user is a member of the security_auditor role, all documents will be
accessible. Users themselves may neither read nor update the
need-to-know table.

``` programlisting
create role staff;
create role security_auditor;
grant staff to security_auditor;

create table document (d_id varchar, d_changed datetime, d_author varchar, d_classification int, d_text long varchar, primary key (d_id));

create table document_access (da_classification int, da_user  varchar,
primary key (da_d_id, da_user));

grant all privileges on document to staff;
grant all privileges on document_access to security_auditor;

create procedure d_policy (in tb varchar, in op varchar)
{
  if (user_has_role (user, 'security_auditor')) return '';
   if (user_has_role (user, 'staff'))
    return 'exists (select 1 from document_access where da_user = user and da_classification = d_classification)';
  return '1=2';
}

table_set_policy ('document', 'd_policy', 'IDUS');
```

These operations first define two roles, staff and security_auditor. The
staff is not granted access to document_access, which is configured by
security_auditor.

The policy function will, for each query accessing document, check if
the user is a member of security_auditor. If so, there will be no extra
conditions and all rows will appear. If the user is a member of staff,
an extra condition checking the existence of a need to know is added.
This will check that there is an entry in the document_access where the
accessing user is granted access to the document's classification. If
the user is neither member of staff nor of security_auditor, no rows
will be returned since the always false condition of 1=2 is added.

Besides selects, the policy rule will apply to inserts, updates and
deletes. This is caused by the 'IDUS' parameter to table_set_policy.
Different policies may be defined for select, insert, update and delete.
Most often these will be the same. Only one policy function is allowed
per table and operation. In order to set a policy, one must either be
the table's owner or dba. Policies do not apply to dba users.

We note that the need to know check accesses a table which is not
granted to staff, even for reading. This is OK, since the predicate
coming from the policy function has access rights of the owner of the
policy function. The predicate is treated like a view body that were
granted to the user making the query without requiring that component
tables of the view were granted.

Since policies are processed at the level of SQL compilation, these will
equally apply to local and remote tables.

Queries inside stored procedures are subject to policy. The user whose
policies are consulted is the owner of the stored procedure. The policy
conditions are fixed at the time of compiling the procedure. Reassigning
a policy counts as a change to the table, causing recompilation of all
concerned procedures, triggers and client statements.

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Conclusions                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                              | Policies are an effective way of implementing a 'virtual private database,' providing for isolation between classes of users of the same application. The maintenance overhead is small compared to the trouble of maintaining views for each class of users. The table concerned remains one schema object with one name. Policies can be set and maintained without modification to applications and existing applications can be made to use policy based access control at no additional cost. |

</div>

<div>

<div>

<div>

<div>

### 11.22.1. Row Level Security Functions

</div>

</div>

</div>

<a href="fn_table_set_policy.html" class="link"
title="table_set_policy"><code
class="function">table_set_policy()</code></a>

<a href="fn_table_drop_policy.html" class="link"
title="table_drop_policy"><code
class="function">table_drop_policy()</code></a>

</div>

</div>

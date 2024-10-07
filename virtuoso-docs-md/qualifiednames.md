<div id="qualifiednames" class="section">

<div class="titlepage">

<div>

<div>

## 9.6. Qualified Names

</div>

</div>

</div>

<div id="qual_owners" class="section">

<div class="titlepage">

<div>

<div>

### 9.6.1. Qualifiers and Owners

</div>

</div>

</div>

Virtuoso supports multiple namespaces for tables and procedures. A table
or procedure is uniquely identified by a three part name consisting of
qualifier, owner and name separated by dots.

Each connection has a current qualifier which is used as the default
qualifier for if a name does not specify a qualifier. The owner can be
omitted from a name if the qualifier and name uniquely identify the
object, e.g. DB..SYS_KEYS.

Initially, all system objects have the qualifier DB and owner DBA.

The default current qualifier of all connections is DB unless otherwise
specified using db.dba.user_set_qualifier.

A user can be assigned a default qualifier set as current qualifier upon
login. This is done with the stored procedure db.dba.user_set_qualifier.

``` screen
user_set_qualifier  (in user varchar, in qualifier varchar)
```

</div>

</div>

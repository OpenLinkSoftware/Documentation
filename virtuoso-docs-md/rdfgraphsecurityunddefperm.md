<div id="rdfgraphsecurityunddefperm" class="section">

<div class="titlepage">

<div>

<div>

### 16.4.5. Understanding Default Permissions

</div>

</div>

</div>

In relational database, default permissions are trivial. DBA is usually
the only account that can access any table for both read and write.
Making some table public or private does not affect applications that do
not refer that table in the code. Tables are always created before
making security restrictions on them.

Chances are very low that an application will unintentionally create
some table and fill in with confidential data. There are no
unauthenticated users, any client has some user ID and no one user is
"default user" so permissions of any two users are always independent.

SPARQL access can be anonymous and graphs can be created during routine
data manipulation. For anonymous user, only public resources are
available. Thus "default permissions" on some or all graphs are actually
permissions of "nobody" user, (the numeric ID of this user can be
obtained by http_nobody_uid() function call). As a consequence, there's
a strong need in "default permission" for a user, this is the only way
to specify what to do with all graphs that does not exist now it might
exist in some future.

An attempt to make default permissions wider than specific is always
potential security hole in SPARQL, so this is strictly prohibited.

Four sorts of access are specified by four bits of an integer
"permission bit-mask", plain old UNIX style:

<div class="itemizedlist">

- Bit 1 permits read access.

- Bit 2 permits write access via SPARUL and it's basically useless
  without bit 1 set.

- Bit 4 permits write access via "RDF sponge" methods and it's basically
  useless without bits 1 and 2 set.

- Bit 8 allows to obtain list of members of graph group; an IRI can be
  used as graph IRI and as graph group IRI at the same time so bit 8 can
  be freely combined with any of bits 1, 2 or 4.

</div>

Note that obtaining the list of members of a graph group does not grant
any access permissions to triples from member graphs. It is quite safe
to mix secure and public graphs in one graph group.

When a SPARQL query should check whether a given user have permission to
access a given graph then the order of checks is as follows:

<div class="orderedlist">

1.  permissions of the user on the specific graph;

2.  default permissions of the user on all graphs;

3.  public permissions on the specific graph;

4.  public permissions on all graphs

</div>

If no one above mentioned permission is set then the access is
"read/write/sponge/list".

For "nobody" user, steps 3 and 4 become exact copies of steps 1 and 2 so
they are skipped.

</div>

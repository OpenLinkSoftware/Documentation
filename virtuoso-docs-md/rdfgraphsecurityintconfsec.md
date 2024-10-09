<div>

<div>

<div>

<div>

### 16.4.6. Initial Configuration of SPARQL Security

</div>

</div>

</div>

It is convenient to configure the RDF storage security by adding
restrictions in the order inverse to the order of checks:

<div>

1.  Step 1: Set public permissions on all graphs to the most restricted
    level of any application that will be installed. So if any single
    graph will be unreadable for public, then public permissions on all
    graphs should be set to 0 or 8.

2.  Step 2: Public permissions on "insecure" graphs should be set. So if
    the database contains DBpedia or WordNet or some other data of
    Linking Open Data project then public permissions for that graphs
    may be set to 1.

3.  Step3: Configure trusted users, such as administrative DBA-like
    accounts, and to specify their permissions on all graphs.

4.  Step 4: Some additional right can be granted to some specific users
    on some specific graphs.

</div>

Note that there's no need to permit something to DBA itself, because
DBA's default permissions are set automatically.

<div>

<div>

<div>

<div>

#### Configuring New User

</div>

</div>

</div>

<div>

1.  Step 1: Grant SPARQL_SELECT, SPARQL_SPONGE or SPARQL_UPDATE to the
    user.

2.  Step 2: Set user's permissions on all graphs.

3.  Step 3: Grant rights on some specific graphs.

</div>

</div>

<div>

<div>

<div>

<div>

#### Example: Blogs and Resource Sharing

</div>

</div>

</div>

The following example demonstrates usage of the following functions:

<div>

- <a href="fn_rdf_default_user_perms_set.html" class="link"
  title="DB.DBA.RDF_DEFAULT_USER_PERMS_SET"><code
  class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_SET (uname, permissions, set_private)</code></a>
  ;

- <a href="fn_rdf_default_user_perms_del.html" class="link"
  title="DB.DBA.RDF_DEFAULT_USER_PERMS_DEL"><code
  class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_DEL (uname, set_private)</code></a>
  ;

- <a href="fn_rdf_graph_user_perms_set.html" class="link"
  title="DB.DBA.RDF_GRAPH_USER_PERMS_SET"><code
  class="function">DB.DBA.RDF_GRAPH_USER_PERMS_SET (graph_iri, uname, permissions)</code></a>
  ;

- <a href="fn_rdf_graph_user_perms_del.html" class="link"
  title="DB.DBA.RDF_GRAPH_USER_PERMS_DEL"><code
  class="function">DB.DBA.RDF_GRAPH_USER_PERMS_DEL (graph_iri, uname)</code></a>
  ;

- <a href="fn_rdf_all_user_perms_del.html" class="link"
  title="DB.DBA.RDF_ALL_USER_PERMS_DEL"><code
  class="function">DB.DBA.RDF_ALL_USER_PERMS_DEL (uname, uid)</code></a>
  ;

</div>

Consider a "groupware" application that let users create personal
resources with access policies.

``` programlisting
-- First, create few users, in alphabetical order.
SQL> DB.DBA.USER_CREATE ('Anna', 'Anna');
Done. -- 0 msec.
SQL> DB.DBA.USER_CREATE ('Brad', 'Brad');
Done. -- 0 msec.
SQL> DB.DBA.USER_CREATE ('Carl', 'Carl');
Done. -- 16 msec.
SQL> GRANT SPARQL_UPDATE to "Anna";
Done. -- 0 msec.
SQL> GRANT SPARQL_UPDATE to "Brad";
Done. -- 0 msec.
SQL> GRANT SPARQL_UPDATE to "Carl";
Done. -- 0 msec.

-- At least some data are supposed to be confidential, thus the whole storage becomes confidential.
SQL> DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('nobody', 0);
Done. -- 16 msec.

-- Moreover, no one of created users have access to all graphs (even for reading).
SQL> DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Anna', 0);
Done. -- 0 msec.
SQL> DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Brad', 0);
Done. -- 0 msec.
SQL> DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Carl', 0);
Done. -- 0 msec.

-- Add Anna's and Brad's private graph to the group http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs:
SQL> DB.DBA.RDF_GRAPH_GROUP_INS ('http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs', 'http://example.com/Anna/private');
SQL> DB.DBA.RDF_GRAPH_GROUP_INS ('http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs', 'http://example.com/Brad/private');

-- Anna's graphs:
--insert simple data in Anna's personal system graph:
SQL> SPARQL INSERT IN <http://example.com/Anna/system> { <Anna-system> a <secret> };
Done. -- 31 msec.

--insert simple data in Anna's private graph:
SQL> SPARQL INSERT IN <http://example.com/Anna/private> { <Anna-private> a <secret> };
Done. -- 0 msec.

-- Anna can only read her personal system data graph.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Anna/system', 'Anna', 1);
Done. -- 0 msec

-- Anna can read and write her private data graph.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Anna/private', 'Anna', 3);
Done. -- 0 msec

-- Brad's graphs:
-- insert simple data in Brad's personal system graph:
SQL> SPARQL INSERT IN <http://example.com/Brad/system> { <Brad-system> a <secret> };
Done. -- 0 msec

-- insert simple data in Brad's private graph:
SQL> SPARQL INSERT IN <http://example.com/Brad/private> { <Brad-private> a <secret> };
Done. -- 0 msec

-- Brad can only read his personal system data graph.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Brad/system', 'Brad', 1);
Done. -- 0 msec

-- Brad can read and write his private data graph.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Brad/private', 'Brad', 3);
Done. -- 0 msec

-- Friends graphs:
SQL> SPARQL INSERT IN <http://example.com/Anna/friends> { <Anna-friends> foaf:knows 'Brad' };
Done. -- 14 msec
SQL> SPARQL INSERT IN <http://example.com/Brad/friends> { <Brad-friends> foaf:knows 'Anna' };
Done. -- 15 msec

-- Anna and Brad are friends and can read each others notes for friends.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Anna/friends', 'Anna', 3);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Anna/friends', 'Brad', 1);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Brad/friends', 'Brad', 3);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Brad/friends', 'Anna', 1);

-- BubbleSortingServicesInc graph
SQL> SPARQL INSERT IN <http://example.com/BubbleSortingServicesInc> { <BubbleSortingServicesInc-info> a <info> };
Done. -- 31 msec

-- Brad and Carl share write access to graph of his company.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/BubbleSortingServicesInc', 'Brad', 3);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/BubbleSortingServicesInc', 'Carl', 3);

-- Anna's blog
SQL> SPARQL INSERT IN <http://example.com/Anna/blog> { <Anna-blog> a <my-blog> };

-- Anna writes a blog for public.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Anna/blog', 'Anna', 3);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Anna/blog', 'nobody', 1);

-- DBpedia is public read and local discussion wiki is readable and writable.
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://dbpedia.org/', 'nobody', 1);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/wiki', 'nobody', 3);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/public', 'nobody', 3);

-- Graph groups have its own security.
SQL> DB.DBA.RDF_GRAPH_GROUP_CREATE ('http://example.com/Personal', 1);
SQL> DB.DBA.RDF_GRAPH_GROUP_INS ('http://example.com/Personal', 'http://example.com/Anna/system');
SQL> DB.DBA.RDF_GRAPH_GROUP_INS ('http://example.com/Personal', 'http://example.com/Anna/private');
SQL> DB.DBA.RDF_GRAPH_GROUP_INS ('http://example.com/Personal', 'http://example.com/Brad/system');
SQL> DB.DBA.RDF_GRAPH_GROUP_INS ('http://example.com/Personal', 'http://example.com/Brad/private');
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Personal', 'Anna', 8);
SQL> DB.DBA.RDF_GRAPH_USER_PERMS_SET ('http://example.com/Personal', 'Brad', 8);

-- See as dba user what is in the <http://example.com/Personal> graph:
SQL> SPARQL
SELECT *
FROM <http://example.com/Personal>
WHERE { ?s ?p ?o } ;
s               p                                                  o
VARCHAR         VARCHAR                                            VARCHAR
_______________________________________________________________________________

Anna-system     http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret
Anna-private    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret
Brad-system     http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret
Brad-private    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret

4 Rows. -- 32 msec.

-- See as Anna user what is in the <http://example.com/Personal> graph:
SQL> reconnect Anna;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> SPARQL
SELECT *
FROM <http://example.com/Personal>
WHERE { ?s ?p ?o };
s               p                                                  o
VARCHAR         VARCHAR                                            VARCHAR
_______________________________________________________________________________

Anna-system     http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret
Anna-private    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret

-- See as Brad user what is in the <http://example.com/Personal> graph:
SQL> reconnect Brad;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> SPARQL SELECT *
FROM <http://example.com/Personal>
WHERE { ?s ?p ?o };
s               p                                                  o
VARCHAR         VARCHAR                                            VARCHAR
_______________________________________________________________________________

Brad-system     http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret
Brad-private    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret

-- See as Anna user what is in Brad's friends graph <http://example.com/Brad/friends>:
SQL> reconnect Anna;
Connected to OpenLink Virtuoso

SQL> SPARQL SELECT *
FROM <http://example.com/Brad/friends>
WHERE { ?s ?p ?o };
s              p                                 o
VARCHAR        VARCHAR                           VARCHAR
_________________________________________________________

Brad-friends   http://xmlns.com/foaf/0.1/knows   Anna
1 Rows. -- 0 msec.

-- Remove Anna's read permissions on Brad's notes:
SQL> reconnect dba;
SQL> RDF_GRAPH_USER_PERMS_DEL('http://example.com/Brad/friends','Anna');

-- See again as Anna user what is in Brad's friends graph <http://example.com/Brad/friends>:
SQL> reconnect Anna;
Connected to OpenLink Virtuoso

SQL> SPARQL SELECT *
FROM <http://example.com/Brad/friends>
WHERE { ?s ?p ?o };
s              p                                 o
VARCHAR        VARCHAR                           VARCHAR
_________________________________________________________

0 Rows. -- 0 msec.

SQL> SPARQL
SELECT *
FROM <http://example.com/Anna/blog>
WHERE { ?s ?p ?o } ;

s             p                                                o
VARCHAR       VARCHAR                                          VARCHAR
_______________________________________________________________________________

Anna-blog     http://www.w3.org/1999/02/22-rdf-syntax-ns#type  my-blog

1 Rows. -- 16 msec.

SQL> SPARQL
SELECT *
FROM <http://example.com/Anna/friends>
WHERE { ?s ?p ?o } ;

s             p                                o
VARCHAR       VARCHAR                          VARCHAR
_______________________________________________________________________________

Anna-friends  http://xmlns.com/foaf/0.1/knows  Brad
1 Rows. -- 16 msec.

-- Remove all the setting of Brad's permissions, both default permissions and
-- permissions on specific graphs.
-- Note: 142 is example id of Brads U_ID in DB.DBA.SYS_USERS table

SQL> reconnect dba;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> DB.DBA.RDF_ALL_USER_PERMS_DEL('Brad',142);
Done. -- 0 msec.

SQL> reconnect Brad;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> SPARQL
SELECT *
FROM <http://example.com/Anna/friends>
WHERE { ?s ?p ?o } ;
s          p          o
VARCHAR    VARCHAR    VARCHAR
_______________________________________________________________________________

0 Rows. -- 16 msec.

-- Check what Carl can see --
SQL> reconnect Carl;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> SPARQL
SELECT *
FROM <http://example.com/BubbleSortingServicesInc>
WHERE { ?s ?p ?o } ;

s                              p                                                o
VARCHAR                        VARCHAR                                          VARCHAR
_______________________________________________________________________________

BubbleSortingServicesInc-info  http://www.w3.org/1999/02/22-rdf-syntax-ns#type  info

1 Rows. -- 0 msec.

SQL> SPARQL
SELECT *
FROM <http://example.com/Anna/private>
WHERE { ?s ?p ?o } ;
s               p                                                  o
VARCHAR         VARCHAR                                            VARCHAR
_______________________________________________________________________________

0 Rows. -- 16 msec.

-- let Carl read everything:
SQL> reconnect dba;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Carl', 1, 1);
Done. -- 0 msec

SQL> reconnect Carl;
Enter password for Carl :
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> SPARQL
SELECT *
FROM <http://example.com/Anna/private>
WHERE { ?s ?p ?o } ;
s               p                                                  o
VARCHAR         VARCHAR                                            VARCHAR
_______________________________________________________________________________

Anna-private    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    secret

1 Rows. -- 16 msec.

-- Remove Carl's default permissions:
SQL> reconnect dba;
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> DB.DBA.RDF_DEFAULT_USER_PERMS_DEL('Carl', 1);
Done. -- 0 msec.

SQL> reconnect Carl;
Enter password for Carl :
Connected to OpenLink Virtuoso
Driver: 06.04.3132 OpenLink Virtuoso ODBC Driver

SQL> SPARQL
SELECT *
FROM <http://example.com/Anna/private>
WHERE { ?s ?p ?o } ;
s               p                                                  o
VARCHAR         VARCHAR                                            VARCHAR
_______________________________________________________________________________

0 Rows. -- 16 msec.
```

</div>

</div>

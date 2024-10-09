<div>

<div>

<div>

<div>

### 16.4.8. Graph-level security and sponging

</div>

</div>

</div>

In some cases the sponged data contains private information for
instances cartridges like Facebook, etc. To perform private sponging,
Virtuoso offers <span class="emphasis">*get:private*</span> pragma:

``` programlisting
define get:private ""
or
define get:private <graph_group_IRI>
```

When used for sponging graph X, it adjusts graph-level security of graph
X (and of graph_group_IRI, if specified) so that X becomes a privately
accessible graph of the user who sponges the X and if graph_group_IRI is
specified then X becomes accessible to users that can access
graph_group_IRI with permissions like permissions they have on
graph_group_IRI.

The exact rules are as following:

<div>

- If graph is virtrdf: then an error is signaled.

- If graph name is an IRI of handshaked web service endpoint or "public
  IRI" of a handshaked web service endpoint then an error is signaled.

- If access is public by default even for private graphs then an error
  is signaled and sponging is not tried.

- If default is "no access" but someone (other than current user) has
  specifically granted read access to the graph in question AND current
  user is not dba AND current user has no bit 32 permission on this
  graph then an error is signaled.

- If read access is public by default for world and disabled for private
  graphs then the graph to be sponged is added to the group of private
  graphs.

- If current user is not DBA, current user gets granted
  read+write+sponge+admin access to the graph to be sponged. In
  addition, current user gets special permission bit 32, indicating that
  the graph is made by private sponge of this specific user.

- If the value of get:private is an IRI then:

  <div>

  - The IRI is supposed to be an IRI of "plain" graph group, error is
    signaled in case of nonexising graph group, group of private graphs
    or group of graphs to be replicated.

  - The graph is added to that group

  - Each non-dba user that can get list of files of the group will get
    permissions for the loaded graph equal to permissions they have on
    graph group minus "list" permission.

  </div>

</div>

<div>

<div>

<div>

<div>

#### Example Performing Sponging on a entirely confidential database using get:private pragma

</div>

</div>

</div>

The following example demonstrates how private sponging using
get:private pragma works for entirely confidential database.

<span class="emphasis">*Note*</span> : Please take in mind that the
steps from below will change the security of any existing database, thus
the example scenario should be performed on a empty db.

<div>

1.  Create few users in alphabetical order:

    ``` programlisting
    DB.DBA.USER_CREATE ('Anna', 'Anna');
    DB.DBA.USER_CREATE ('Brad', 'Brad');
    DB.DBA.USER_CREATE ('Carl', 'Carl');
    ```

2.  Set to Anna, Brad and Carl SPARQL SELECT, UPDATE and SPONGE
    permissions:

    ``` programlisting
    grant SPARQL_SELECT to "Anna";
    grant SPARQL_SELECT to "Brad";
    grant SPARQL_SELECT to "Carl";

    grant SPARQL_UPDATE to "Anna";
    grant SPARQL_UPDATE to "Brad";
    grant SPARQL_UPDATE to "Carl";

    grant SPARQL_SPONGE to "Anna";
    grant SPARQL_SPONGE to "Brad";
    grant SPARQL_SPONGE to "Carl";
    ```

3.  Set specific privileges to given graphs for specifics users:
    Catering for the fact that some datasets are supposed to be
    confidential, thus the whole quad storage is set to confidential.
    Then specific privileges can be assigned to specific graphs for
    specific users:

    ``` programlisting
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('nobody', 0);
    ```

4.  Set specific privileges: assuming for users Anna, Brad and Carl none
    of these individual has any kind of global access to graphs:

    ``` programlisting
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Anna', 0);
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Brad', 0);
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Carl', 0);
    ```

5.  Assuming the following four sorts of access that are specified by
    four bits of an integer "permission bit-mask", following plain old
    UNIX style:

    <div>

    - Bit 1 permits read access.

    - Bit 2 permits write access via SPARUL and is basically useless
      without bit 1 set.

    - Bit 4 permits write access via "RDF Network Resource Fetch"
      methods and is basically useless without bits 1 and 2 set.

    - Bit 8 allows retrieval of the list of members of a graph group. An
      IRI can be used as a graph IRI and as a graph group IRI at the
      same time, so bit 8 can be freely combined with any of bits 1, 2
      or 4.

    - In the statements from below should be considered:

      <div>

      - "15 = 8+4+2+1" -- i.e. combining all the four sorts of access
        FROM above

      - "9 = 8 + 1" -- i.e. read access + access to retrieve the list of
        members for a given graph group

      </div>

    </div>

    ``` programlisting
    -- Create Graph Group for Anna and set privileges:
    DB.DBA.RDF_GRAPH_GROUP_CREATE ('urn:Anna:Sponged:Data', 1);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Anna:Sponged:Data', 'Anna', 15);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Anna:Sponged:Data', 'Brad', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Anna:Sponged:Data', 'Carl', 9);

    -- Create Graph Group for Brad and set privileges:
    DB.DBA.RDF_GRAPH_GROUP_CREATE ('urn:Brad:Sponged:Data', 1);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Brad:Sponged:Data', 'Anna', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Brad:Sponged:Data', 'Brad', 15);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Brad:Sponged:Data', 'Carl', 9);

    -- Create Graph Group for Carl and set privileges:
    DB.DBA.RDF_GRAPH_GROUP_CREATE ('urn:Carl:Sponged:Data', 1);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Carl:Sponged:Data', 'Anna', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Carl:Sponged:Data', 'Brad', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Carl:Sponged:Data', 'Carl', 15);
    ```

6.  Examples with invalid graph group names:

    <div>

    1.  Example with Non-existing Graph Group:

        ``` programlisting
        -- An error for non-existing Graph group <http://nosuch/> will be raised.

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <http://nosuch/>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
               
        ```

    2.  Example with "virtrdf:PrivateGraphs" graph group which is
        reserved for system usage:

        ``` programlisting
        -- An error for attempt to add a graph to special
        -- graph group <http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs> will be raised.

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private virtrdf:PrivateGraphs
          SELECT * FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
               
        ```

    3.  Example with "virtrdf:rdf_repl_graph_group" graph group which is
        reserved for system usage:

        ``` programlisting

        -- An error for attempt to add a graph to special
        -- graph group <http://www.openlinksw.com/schemas/virtrdf#rdf_repl_graph_group> will be raised.

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private virtrdf:rdf_repl_graph_group
          SELECT * FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

7.  Examples to check Anna's sponging permissions on different graph
    groups:

    <div>

    1.  Example for adding graph to Anna's graph group
        \<urn:Anna:Sponged:Data\>:

        ``` programlisting

        -- No error will be raised as Anna has the efficient rights for graph group <urn:Anna:Sponged:Data>

        reconnect "Anna";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Anna:Sponged:Data>
          SELECT *
          FROM <http://example.com/anna/>
          WHERE
            { ?s ?p ?o };
        ```

    2.  Example for adding graph to Brad's graph group
        \<urn:Brad:Sponged:Data\>:

        ``` programlisting

        -- An error will be raised because "Anna" has not enough rights on that group

        reconnect "Anna";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Brad:Sponged:Data>
          SELECT * FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    3.  Example for adding graph to Carl's graph group
        \<urn:Carl:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Anna" has not enough rights on that group

        reconnect "Anna";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Carl:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

8.  Examples check Brad's sponging permissions on different graph
    groups:

    <div>

    1.  Example for adding graph to Anna's graph group
        \<urn:Anna:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Brad" has not enough rights on that group

        reconnect "Brad";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Anna:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    2.  Example for adding graph to Brad's graph group
        \<urn:Brad:Sponged:Data\>:

        ``` programlisting
        -- No error will be raised as Brad has the efficient rights for graph group <urn:Brad:Sponged:Data>

        reconnect "Brad";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Brad:Sponged:Data>
          SELECT *
          FROM <http://example.com/brad/>
          WHERE
            { ?s ?p ?o };
        ```

    3.  Example for adding graph to Carl's graph group
        \<urn:Carl:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Brad" has not enough rights on that group

        reconnect "Brad";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Carl:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

9.  Examples check Carl's sponging permissions on different graph
    groups:

    <div>

    1.  Example for adding graph to Anna's graph group
        \<urn:Anna:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Carl" has not enough rights on that group

        reconnect "Carl";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Anna:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    2.  Example for adding graph to Brad's graph group
        \<urn:Brad:Sponged:Data\>:

        ``` programlisting
        -- An error will be rased because "Carl" has not enough rights on that group

        reconnect "Carl";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Brad:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    3.  Example for adding graph to Carl's graph group
        \<urn:Carl:Sponged:Data\>:

        ``` programlisting
        -- No error will be raised as Carl has the efficient rights for graph group <urn:Brad:Sponged:Data>

        reconnect "Carl";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Carl:Sponged:Data>
          SELECT *
          FROM <http://example.com/carl/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

10. User Carl performs private sponging:

    ``` programlisting
    reconnect "Carl";

    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT *
      FROM <http://www.openlinksw.com/data/turtle/products.ttl>
      WHERE
        { ?s ?p ?o };

    -- Should return for ex. 365 rows.
    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT COUNT(*)
      FROM <http://www.openlinksw.com/data/turtle/products.ttl>
      WHERE
        { ?s ?p ?o };

    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT *
      FROM NAMED <http://www.openlinksw.com/data/turtle/software.ttl>
      FROM NAMED <http://www.openlinksw.com/data/turtle/licenses.ttl>
      WHERE
        {
          graph ?g
            { ?s ?p ?o
          }
        };

    -- Should return for ex. 1317 rows.
    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT COUNT(*)
      FROM NAMED <http://www.openlinksw.com/data/turtle/software.ttl>
      FROM NAMED <http://www.openlinksw.com/data/turtle/licenses.ttl>
      WHERE
        {
          graph ?g
            { ?s ?p ?o
          }
        };
    ```

11. Viewing Graph Groups shows Carl's graph group
    \<urn:Carl:Sponged:Data\> contains total 4 graphs:

    ``` programlisting
    SQL> SELECT id_to_iri (RGGM_GROUP_IID), id_to_iri(RGGM_MEMBER_IID)
         FROM DB.DBA.RDF_GRAPH_GROUP_MEMBER
         ORDER BY 1,2;

    id_to_iri                id_to_iri__1
    VARCHAR                  VARCHAR
    __________________________________________________________

    ....
    urn:Anna:Sponged:Data    http://example.com/anna/
    urn:Brad:Sponged:Data    http://example.com/brad/
    urn:Carl:Sponged:Data    http://example.com/carl/
    urn:Carl:Sponged:Data    http://www.openlinksw.com/data/turtle/licenses.ttl
    urn:Carl:Sponged:Data    http://www.openlinksw.com/data/turtle/products.ttl
    urn:Carl:Sponged:Data    http://www.openlinksw.com/data/turtle/software.ttl
    ```

</div>

</div>

<div>

<div>

<div>

<div>

#### Example Performing Sponging with Private Graphs Using get:private pragma

</div>

</div>

</div>

The following example demonstrates how private sponging using
get:private pragma works for database with private graphs.

<div>

1.  Create few users in alphabetical order:

    ``` programlisting
    DB.DBA.USER_CREATE ('Anna', 'Anna');
    DB.DBA.USER_CREATE ('Brad', 'Brad');
    DB.DBA.USER_CREATE ('Carl', 'Carl');
    ```

2.  Set to Anna, Brad and Carl SPARQL SELECT, UPDATE and SPONGE
    permissions:

    ``` programlisting
    grant SPARQL_SELECT to "Anna";
    grant SPARQL_SELECT to "Brad";
    grant SPARQL_SELECT to "Carl";

    grant SPARQL_UPDATE to "Anna";
    grant SPARQL_UPDATE to "Brad";
    grant SPARQL_UPDATE to "Carl";

    grant SPARQL_SPONGE to "Anna";
    grant SPARQL_SPONGE to "Brad";
    grant SPARQL_SPONGE to "Carl";
    ```

3.  Set specific privileges: Setup assuming 3 users: Anna, Brad and Carl
    where each of these individual users has read access to graphs:

    ``` programlisting
    -- Close any public access to "private" graphs
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('nobody', 0, 1);

    -- Set Read Only for public on graphs not listed as "private".
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('nobody', 1);

    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Anna', 0, 1);
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Brad', 0, 1);
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Carl', 0, 1);

    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Anna', 1);
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Brad', 1);
    DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('Carl', 1);
    ```

4.  Assuming the following four sorts of access that are specified by
    four bits of an integer "permission bit-mask", following plain old
    UNIX style:

    <div>

    - Bit 1 permits read access.

    - Bit 2 permits write access via SPARUL and is basically useless
      without bit 1 set.

    - Bit 4 permits write access via "RDF Network Resource Fetch"
      methods and is basically useless without bits 1 and 2 set.

    - Bit 8 allows retrieval of the list of members of a graph group. An
      IRI can be used as a graph IRI and as a graph group IRI at the
      same time, so bit 8 can be freely combined with any of bits 1, 2
      or 4.

    - In the statements from below should be considered:

      <div>

      - "15 = 8+4+2+1" -- i.e. combining all the four sorts of access
        FROM above

      - "9 = 8 + 1" -- i.e. read access + access to retrieve the list of
        members for a given graph group

      </div>

    </div>

    ``` programlisting
    -- Create Graph Group for Anna and set privileges:
    DB.DBA.RDF_GRAPH_GROUP_CREATE ('urn:Anna:Sponged:Data', 1);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Anna:Sponged:Data', 'Anna', 15);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Anna:Sponged:Data', 'Brad', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Anna:Sponged:Data', 'Carl', 9);

    -- Create Graph Group for Brad and set privileges:
    DB.DBA.RDF_GRAPH_GROUP_CREATE ('urn:Brad:Sponged:Data', 1);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Brad:Sponged:Data', 'Anna', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Brad:Sponged:Data', 'Brad', 15);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Brad:Sponged:Data', 'Carl', 9);

    -- Create Graph Group for Carl and set privileges:
    DB.DBA.RDF_GRAPH_GROUP_CREATE ('urn:Carl:Sponged:Data', 1);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Carl:Sponged:Data', 'Anna', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Carl:Sponged:Data', 'Brad', 9);
    DB.DBA.RDF_GRAPH_USER_PERMS_SET ('urn:Carl:Sponged:Data', 'Carl', 15);

    -- Set Anna's, Brad's and Carl's graphs by inserting them into the <b>virtrdf:PrivateGraphs</b> graph group:
    DB.DBA.RDF_GRAPH_GROUP_INS ('http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs', 'http://example.com/anna/');
    DB.DBA.RDF_GRAPH_GROUP_INS ('http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs', 'http://example.com/brad/');
    DB.DBA.RDF_GRAPH_GROUP_INS ('http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs', 'http://example.com/carl/');
    ```

5.  Examples with invalid graph group names:

    <div>

    1.  Example with Non-existing Graph Group:

        ``` programlisting
        -- An error for non-existing Graph group <http://nosuch/> will be raised.

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <http://nosuch/>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
               
        ```

    2.  Example with "virtrdf:PrivateGraphs" graph group which is
        reserved for system usage:

        ``` programlisting
        -- An error for attempt to add a graph to special
        -- graph group <http://www.openlinksw.com/schemas/virtrdf#PrivateGraphs> will be raised.

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private virtrdf:PrivateGraphs
          SELECT * FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
               
        ```

    3.  Example with "virtrdf:rdf_repl_graph_group" graph group which is
        reserved for system usage:

        ``` programlisting

        -- An error for attempt to add a graph to special
        -- graph group <http://www.openlinksw.com/schemas/virtrdf#rdf_repl_graph_group> will be raised.

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private virtrdf:rdf_repl_graph_group
          SELECT * FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

6.  Examples to check Anna's sponging permissions on different graph
    groups:

    <div>

    1.  Example for adding graph to Anna's graph group
        \<urn:Anna:Sponged:Data\>:

        ``` programlisting

        -- No error will be raised as Anna has the efficient rights for graph group <urn:Anna:Sponged:Data>

        reconnect "Anna";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Anna:Sponged:Data>
          SELECT *
          FROM <http://example.com/anna/>
          WHERE
            { ?s ?p ?o };
        ```

    2.  Example for adding graph to Brad's graph group
        \<urn:Brad:Sponged:Data\>:

        ``` programlisting

        -- An error will be raised because "Anna" has not enough rights on that group

        reconnect "Anna";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Brad:Sponged:Data>
          SELECT * FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    3.  Example for adding graph to Carl's graph group
        \<urn:Carl:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Anna" has not enough rights on that group

        reconnect "Anna";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Carl:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

7.  Examples check Brad's sponging permissions on different graph
    groups:

    <div>

    1.  Example for adding graph to Anna's graph group
        \<urn:Anna:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Brad" has not enough rights on that group

        reconnect "Brad";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Anna:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    2.  Example for adding graph to Brad's graph group
        \<urn:Brad:Sponged:Data\>:

        ``` programlisting
        -- No error will be raised as Brad has the efficient rights for graph group <urn:Brad:Sponged:Data>

        reconnect "Brad";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Brad:Sponged:Data>
          SELECT *
          FROM <http://example.com/brad/>
          WHERE
            { ?s ?p ?o };
        ```

    3.  Example for adding graph to Carl's graph group
        \<urn:Carl:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Brad" has not enough rights on that group

        reconnect "Brad";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Carl:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

8.  Examples check Carl's sponging permissions on different graph
    groups:

    <div>

    1.  Example for adding graph to Anna's graph group
        \<urn:Anna:Sponged:Data\>:

        ``` programlisting
        -- An error will be raised because "Carl" has not enough rights on that group

        reconnect "Carl";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Anna:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    2.  Example for adding graph to Brad's graph group
        \<urn:Brad:Sponged:Data\>:

        ``` programlisting
        -- An error will be rased because "Carl" has not enough rights on that group

        reconnect "Carl";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Brad:Sponged:Data>
          SELECT *
          FROM <http://example.com/>
          WHERE
            { ?s ?p ?o };
        ```

    3.  Example for adding graph to Carl's graph group
        \<urn:Carl:Sponged:Data\>:

        ``` programlisting
        -- No error will be raised as Carl has the efficient rights for graph group <urn:Brad:Sponged:Data>

        reconnect "Carl";

        SPARQL
          DEFINE get:soft "replacing"
          DEFINE get:private <urn:Carl:Sponged:Data>
          SELECT *
          FROM <http://example.com/carl/>
          WHERE
            { ?s ?p ?o };
        ```

    </div>

9.  User Carl performs private sponging:

    ``` programlisting
    reconnect "Carl";

    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT *
      FROM <http://www.openlinksw.com/data/turtle/products.ttl>
      WHERE
        { ?s ?p ?o };

    -- Should return for ex. 365 rows.
    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT COUNT(*)
      FROM <http://www.openlinksw.com/data/turtle/products.ttl>
      WHERE
        { ?s ?p ?o };

    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT *
      FROM NAMED <http://www.openlinksw.com/data/turtle/software.ttl>
      FROM NAMED <http://www.openlinksw.com/data/turtle/licenses.ttl>
      WHERE
        {
          graph ?g
            { ?s ?p ?o
          }
        };

    -- Should return for ex. 1317 rows.
    SPARQL
      DEFINE get:soft "replacing"
      DEFINE get:private <urn:Carl:Sponged:Data>
      SELECT COUNT(*)
      FROM NAMED <http://www.openlinksw.com/data/turtle/software.ttl>
      FROM NAMED <http://www.openlinksw.com/data/turtle/licenses.ttl>
      WHERE
        {
          graph ?g
            { ?s ?p ?o
          }
        };
    ```

10. User Anna reads Carl's data:

    ``` programlisting
    SQL> reconnect "Anna";
    SQL> SPARQL
      SELECT COUNT(*)
      FROM <http://www.openlinksw.com/data/turtle/products.ttl>
      WHERE
        { ?s ?p ?o };

    callret-0
    INTEGER
    _______________________________________________________________________________

    365

    1 Rows. -- 15 msec.
    ```

</div>

</div>

</div>

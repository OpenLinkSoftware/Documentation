<div>

<div>

<div>

<div>

### 16.19.2. Replication Topologies

</div>

</div>

</div>

Typical replication topologies are Chains, Stars and Bi-directional.
They can be achieved with Virtuoso, by repeating the "Publish" and/or
"Subscribe" steps on each relevant node.

<div>

<div>

<div>

<div>

#### Star Replication Topology

</div>

</div>

</div>

In a Star, there is one Publisher, and many Subscribers.

<div>

<div>

**Figure 16.202. Star Replication Topology**

<div>

<div>

![Star Replication Topology](images/ui/topo-star.png)

</div>

</div>

</div>

  

</div>

To set up a Star, follow the scenario:

<div>

1.  Configure Instance \#1 to Publish.

2.  Configure Instance \#2 to Subscribe to \#1.

3.  Repeat as necessary.

</div>

<div>

<div>

<div>

<div>

##### Star Replication Topology Example

</div>

</div>

</div>

The following How-To walks you through setting up Virtuoso RDF Graph
Replication in a Star Topology.

<div>

<div>

<div>

<div>

###### Prerequisites

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Database INI Parameters

</div>

</div>

</div>

Suppose there are 3 Virtuoso instances respectively with the following
ini parameters values:

<div>

1.  virtuoso1.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso1.db
    TransactionFile = virtuoso1.trx
    ErrorLogFile     = virtuoso1.log
    ...
    [Parameters]
    ServerPort               = 1111
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8891
    ...
    [URIQA]
    DefaultHost = example.com:8891
    ...
    [Replication]
    ServerName   = db1
    ...
    ```

2.  virtuoso2.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso2.db
    TransactionFile = virtuoso2.trx
    ErrorLogFile     = virtuoso2.log
    ...
    [Parameters]
    ServerPort               = 1112
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8892
    ...
    [URIQA]
    DefaultHost = localhost:8892
    ...
    [Replication]
    ServerName   = db2
    ...
    ```

3.  virtuoso3.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso3.db
    TransactionFile = virtuoso3.trx
    ErrorLogFile     = virtuoso3.log
    ...
    [Parameters]
    ServerPort               = 1113
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8893
    ...
    [URIQA]
    DefaultHost = example.com:8893
    ...
    [Replication]
    ServerName   = db3
    ...
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Database DSNs

</div>

</div>

</div>

Use the ODBC Administrator on your Virtuoso host (e.g., on Windows,
Start menu -\> Control Panel -\> Administrative Tools -\> Data Sources
(ODBC); on Mac OS X, /Applications/Utilities/OpenLink ODBC
Administrator.app) to create a System DSN for each of db1, db2, db3,
with names db1, db2 and db3, respectively.

</div>

<div>

<div>

<div>

<div>

###### Install Conductor package

</div>

</div>

</div>

On each of the 3 Virtuoso instances install the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
class="ulink" target="_top">conductor_dav.vad</a> package.

</div>

</div>

<div>

<div>

<div>

<div>

###### Create a Publication on the Host Virtuoso Instance db1

</div>

</div>

</div>

<div>

1.  Go to Conductor -\> Replication -\> Transactional -\> Publications

    <div>

    <div>

    **Figure 16.203. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r6.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Click Enable RDF Publishing

3.  A publication with the name RDF Publication should be created:

    <div>

    <div>

    **Figure 16.204. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r7.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click the link which is the publication name.

5.  You will be shown the publication items page:

    <div>

    <div>

    **Figure 16.205. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r8.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Enter for Graph IRI:

    ``` programlisting
    http://example.org
    ```

    <div>

    <div>

    **Figure 16.206. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r9.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click Add New

8.  The item will be created and shown in the list of items for the
    currently viewed publication.

    <div>

    <div>

    **Figure 16.207. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r10.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Insert Data into a Named Graph on the Host Virtuoso Instance

</div>

</div>

</div>

There are several ways to insert data into a Virtuoso Named Graph. In
this example, we will use the Virtuoso Conductor's Import RDF feature:

<div>

1.  In the Virtuoso Conductor, go to Linked Data -\> Quad Store Upload:

    <div>

    <div>

    **Figure 16.208. Replication Topology**

    <div>

    <div>

    ![Replication Topology](images/ui/uc1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  In the form:

    <div>

    - Tick the box for Resource URL and enter your resource URL, for
      e.g.:

      ``` programlisting
      http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
      ```

    - Enter for Named Graph IRI:

      ``` programlisting
      http://example.org
      ```

    </div>

    <div>

    <div>

    **Figure 16.209. Replication Topology**

    <div>

    <div>

    ![Replication Topology](images/ui/r2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click Upload

4.  A successful upload will result in this message:

    <div>

    <div>

    **Figure 16.210. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Check the inserted triples by executing a query like the following
    against the SPARQL endpoint, http://cname:port/sparql:

    ``` programlisting
    SELECT *
      FROM <http://example.org>
     WHERE { ?s ?p ?o }
    ```

    <div>

    <div>

    **Figure 16.211. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  See how many triples have been inserted in your graph:

    ``` programlisting
    SELECT COUNT(*)
      FROM <http://example.org>
     WHERE { ?s ?p ?o }
    ```

    <div>

    <div>

    **Figure 16.212. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Subscribe to the Publication on the a Destination Virtuoso Instance db2, db3, etc.

</div>

</div>

</div>

<div>

1.  Go to Conductor -\> Replication -\> Transactional -\> Subscriptions

    <div>

    <div>

    **Figure 16.213. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r11.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Click New Subscription

    <div>

    <div>

    **Figure 16.214. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r12.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Specify a new Data Source Enter or selected target data source from
    the available connected Data Sources:

    <div>

    <div>

    **Figure 16.215. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r13.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.216. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r13a.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click Publications list

    <div>

    <div>

    **Figure 16.217. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r15.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Select the RDF Publication and click List Items

    <div>

    <div>

    **Figure 16.218. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r16.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click Subscribe

7.  The subscription will be created

    <div>

    <div>

    **Figure 16.219. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r18.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click Sync

9.  Check the retrieved triples by executing the following query

    ``` programlisting
    SELECT *
      FROM <http://example.org>
     WHERE {?s ?p ?o}
    ```

    <div>

    <div>

    **Figure 16.220. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r19.png)

    </div>

    </div>

    </div>

      

    </div>

10. See how many triples have been inserted into your graph by executing
    the following query:

    ``` programlisting
    SELECT COUNT(*)
      FROM <http://example.org>
     WHERE {?s ?p ?o}
    ```

    <div>

    <div>

    **Figure 16.221. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

These steps may be repeated for any number of Subscriber.

</div>

<div>

<div>

<div>

<div>

###### Insert Triples into the Host Virtuoso Instance Graph and check availability at Destination Virtuoso Instance Graph

</div>

</div>

</div>

<div>

1.  To check the starting count, on the Destination Virtuoso Instance
    SPARQL Endpoint, execute:

    ``` programlisting
    SELECT COUNT(*)
      FROM <http://example.org>
     WHERE { ?s ?p ?o }
    ```

2.  On the Host Virtuoso Instance go to Conductor -\> Database -\>
    Interactive SQL and execute the following statement:

    ``` programlisting
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
         <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
         <http://xmlns.com/foaf/0.1/interest>
         <http://dbpedia.org/resource/Web_Services>
      } ;
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
        <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
        <http://xmlns.com/foaf/0.1/interest>
        <http://dbpedia.org/resource/Web_Clients>
      } ;
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
        <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
        <http://xmlns.com/foaf/0.1/interest>
        <http://dbpedia.org/resource/SPARQL>
      } ;
    ```

    <div>

    <div>

    **Figure 16.222. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r22.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.223. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r23.png)

    </div>

    </div>

    </div>

      

    </div>

3.  To confirm that the triple count has increased by the number of
    inserted triples, execute the following on the Destination Virtuoso
    Instance SPARQL Endpoint:

    ``` programlisting
    SELECT COUNT(*)
      FROM <http://example.org>
     WHERE { ?s ?p ?o }
    ```

    <div>

    <div>

    **Figure 16.224. Star Replication Topology**

    <div>

    <div>

    ![Star Replication Topology](images/ui/r24.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Chain Replication Topology

</div>

</div>

</div>

In a Chain, there is one original Publisher, to which there is only one
Subscriber. That Subscriber may also serve as a Publisher, again with
only one Subscriber. The chain ends with a Subscriber which does not
Publish.

<div>

<div>

**Figure 16.225. Chain Replication Topology**

<div>

<div>

![Chain Replication Topology](images/ui/topo-chain.png)

</div>

</div>

</div>

  

</div>

To set up a Chain, follow the scenario:

<div>

1.  Configure Instance \#1 to Publish.

2.  Configure Instance \#2 to Subscribe to \#1.

3.  Configure Instance \#2 to Publish.

4.  Configure Instance \#3 to Subscribe to \#2.

5.  Repeat as necessary.

</div>

<div>

<div>

<div>

<div>

##### Chain Replication Topology Example

</div>

</div>

</div>

The following How-To walks you through setting up Virtuoso RDF Graph
Replication in a Chain Topology.

<div>

<div>

<div>

<div>

###### Prerequisites

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Database INI Parameters

</div>

</div>

</div>

Suppose there are 3 Virtuoso instances respectively with the following
ini parameters values:

<div>

1.  virtuoso1.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso1.db
    TransactionFile = virtuoso1.trx
    ErrorLogFile     = virtuoso1.log
    ...
    [Parameters]
    ServerPort               = 1111
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8891
    ...
    [URIQA]
    DefaultHost = example.com:8891
    ...
    [Replication]
    ServerName   = db1
    ...
    ```

2.  virtuoso2.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso2.db
    TransactionFile = virtuoso2.trx
    ErrorLogFile     = virtuoso2.log
    ...
    [Parameters]
    ServerPort               = 1112
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8892
    ...
    [URIQA]
    DefaultHost = localhost:8892
    ...
    [Replication]
    ServerName   = db2
    ...
    ```

3.  virtuoso3.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso3.db
    TransactionFile = virtuoso3.trx
    ErrorLogFile     = virtuoso3.log
    ...
    [Parameters]
    ServerPort               = 1113
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8893
    ...
    [URIQA]
    DefaultHost = example.com:8893
    ...
    [Replication]
    ServerName   = db3
    ...
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Database DSNs

</div>

</div>

</div>

Use the ODBC Administrator on your Virtuoso host (e.g., on Windows,
Start menu -\> Control Panel -\> Administrative Tools -\> Data Sources
(ODBC); on Mac OS X, /Applications/Utilities/OpenLink ODBC
Administrator.app) to create a System DSN for each of db1, db2, db3,
with names db1, db2 and db3, respectively.

</div>

<div>

<div>

<div>

<div>

###### Install Conductor package

</div>

</div>

</div>

On each of the 3 Virtuoso instances install the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
class="ulink" target="_top">conductor_dav.vad</a> package.

</div>

</div>

<div>

<div>

<div>

<div>

###### Create Publication on db1

</div>

</div>

</div>

<div>

1.  Go to http://example.com:8891/conductor and log in as dba

2.  Go to Conductor - \> Replication - \> Transactional - \>
    Publications

    <div>

    <div>

    **Figure 16.226. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*Enable RDF Publishing*</span>

4.  As result publication with the name

    <span class="emphasis">*RDF Publication*</span>

    should be created

    <div>

    <div>

    **Figure 16.227. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m2.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the link which is the publication name.

6.  You will be shown the publication items page

    <div>

    <div>

    **Figure 16.228. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Enter for Graph IRI:

    ``` programlisting
    http://example.org
    ```

    <div>

    <div>

    **Figure 16.229. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click Add New

9.  The item will be created and shown in the list of items for the
    currently viewed publication.

    <div>

    <div>

    **Figure 16.230. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Create subscription from db2 to db1's Publication

</div>

</div>

</div>

<div>

1.  Log in at http://example.com:8892/conductor

2.  Go to Replication - \> Transactional - \> Subscriptions

    <div>

    <div>

    **Figure 16.231. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m6.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*New Subscription*</span>

    <div>

    <div>

    **Figure 16.232. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m7.png)

    </div>

    </div>

    </div>

      

    </div>

4.  From the list of "Specify new data source" select Data Source db1

    <div>

    <div>

    **Figure 16.233. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m8.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter for db1 dba user credentials

    <div>

    <div>

    **Figure 16.234. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m9.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click "Add Data Source"

7.  As result

    <span class="emphasis">*db1*</span>

    will be shown in the "Connected Data Sources" list.

    <div>

    <div>

    **Figure 16.235. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m10.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Select

    <span class="emphasis">*db1*</span>

    the "Connected Data Sources" list and click "Publications list"

    <div>

    <div>

    **Figure 16.236. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m11.png)

    </div>

    </div>

    </div>

      

    </div>

9.  As result will be shown the list of available publications for the
    selected data source. Select the one with name "RDF Publication" and
    click "List Items".

    <div>

    <div>

    **Figure 16.237. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m12.png)

    </div>

    </div>

    </div>

      

    </div>

10. As result will be shown the "Confirm subscription" page.

    <div>

    <div>

    **Figure 16.238. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m13.png)

    </div>

    </div>

    </div>

      

    </div>

11. The sync interval by default is 10 minutes. For the testing
    purposes, we will change it to 1 minute.

    <div>

    <div>

    **Figure 16.239. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m14.png)

    </div>

    </div>

    </div>

      

    </div>

12. Click "Subscribe"

13. The subscription will be created.

    <div>

    <div>

    **Figure 16.240. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m15.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Create Publication on db2

</div>

</div>

</div>

<div>

1.  Go to http://example.com:8892/conductor and log in as dba

2.  Go to Conductor - \> Replication - \> Transactional - \>
    Publications

    <div>

    <div>

    **Figure 16.241. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m16.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*Enable RDF Publishing*</span>

4.  As result publication with the name

    <span class="emphasis">*RDF Publication*</span>

    should be created

    <div>

    <div>

    **Figure 16.242. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m17.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the link which is the publication name.

6.  You will be shown the publication items page

    <div>

    <div>

    **Figure 16.243. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m18.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Enter for Graph IRI:

    ``` programlisting
    http://example.org
    ```

    <div>

    <div>

    **Figure 16.244. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m19.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click Add New

9.  The item will be created and shown in the list of items for the
    currently viewed publication.

    <div>

    <div>

    **Figure 16.245. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m20.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Create subscription from db3 to db2's Publication

</div>

</div>

</div>

<div>

1.  Log in at http://example.com:8893/conductor

2.  Go to Replication - \> Transactional - \> Subscriptions

    <div>

    <div>

    **Figure 16.246. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m21.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*New Subscription*</span>

    <div>

    <div>

    **Figure 16.247. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m22.png)

    </div>

    </div>

    </div>

      

    </div>

4.  From the list of "Specify new data source" select Data Source db2

    <div>

    <div>

    **Figure 16.248. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m23.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter for db2 dba user credentials

    <div>

    <div>

    **Figure 16.249. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m24.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click "Add Data Source"

    <div>

    <div>

    **Figure 16.250. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m25.png)

    </div>

    </div>

    </div>

      

    </div>

7.  As result

    <span class="emphasis">*db2*</span>

    will be shown in the "Connected Data Sources" list. Select it and
    click "Publications list"

    <div>

    <div>

    **Figure 16.251. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m26.png)

    </div>

    </div>

    </div>

      

    </div>

8.  As result will be shown the list of available publications for the
    selected data source. Select the one with name "RDF Publication" and
    click "List Items".

    <div>

    <div>

    **Figure 16.252. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m27.png)

    </div>

    </div>

    </div>

      

    </div>

9.  As result will be shown the "Confirm subscription" page.

    <div>

    <div>

    **Figure 16.253. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m28.png)

    </div>

    </div>

    </div>

      

    </div>

10. The sync interval by default is 10 minutes. For the testing
    purposes, we will change it to 1 minute.

    <div>

    <div>

    **Figure 16.254. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m29.png)

    </div>

    </div>

    </div>

      

    </div>

11. Click "Subscribe"

12. The subscription will be created.

    <div>

    <div>

    **Figure 16.255. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m30.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Insert Data into a Named Graph on the db1 Virtuoso Instance

</div>

</div>

</div>

<div>

1.  Log in at http://example.com:8891/conductor

2.  Go to Linked Data -\> Quad Store Upload:

    <div>

    <div>

    **Figure 16.256. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/uc1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  In the shown form:

    <div>

    1.  Tick the box for

        <span class="emphasis">*Resource URL*</span>

        and enter your resource URL, e.g.:

        ``` programlisting
        http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
        ```

    2.  Enter for Named Graph IRI:

        ``` programlisting
        http://example.org
        ```

        <div>

        <div>

        **Figure 16.257. Chain Replication Topology**

        <div>

        <div>

        ![Chain Replication Topology](images/ui/m32.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

4.  Click Upload

5.  A successful upload will result in a shown message.

    <div>

    <div>

    **Figure 16.258. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m33.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Check the count of the inserted triples by executing a query like
    the following against the SPARQL endpoint,
    http://example.com:8891/sparql:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

    <div>

    <div>

    **Figure 16.259. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m34.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Should return

    <span class="emphasis">*57*</span>

    as total.

    <div>

    <div>

    **Figure 16.260. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m35.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Check data on the Destination instances db2 and db3

</div>

</div>

</div>

<div>

1.  To check the starting count, on each of the Destination Virtuoso
    Instances db2 and db3 from SPARQL Endpoint execute:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

2.  Should return

    <span class="emphasis">*57*</span>

    as total.

    <div>

    <div>

    **Figure 16.261. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m35.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Add new data on db1

</div>

</div>

</div>

<div>

1.  Disconnect db2 and db3.

2.  On the Host Virtuoso Instance db1 go to Conductor - \> Database - \>
    Interactive SQL enter the following statement:

    ``` programlisting
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
         <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
         <http://xmlns.com/foaf/0.1/interest>
         <http://dbpedia.org/resource/Web_Services>
      } ;
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
        <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
        <http://xmlns.com/foaf/0.1/interest>
        <http://dbpedia.org/resource/Web_Clients>
      } ;
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
        <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
        <http://xmlns.com/foaf/0.1/interest>
        <http://dbpedia.org/resource/SPARQL>
      } ;
    ```

    <div>

    <div>

    **Figure 16.262. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m36.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click "Execute"

4.  As result the triples will be inserted

    <div>

    <div>

    **Figure 16.263. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m36a.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Check the count of the destination instance graph's triples by
    executing the following query like against the SPARQL endpoint,
    http://example.com:8891/sparql:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

6.  Should return

    <span class="emphasis">*60*</span>

    as total.

    <div>

    <div>

    **Figure 16.264. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m38.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Check data on the Destination instances db2 and db3

</div>

</div>

</div>

<div>

1.  Start instances db2 and db3

2.  To confirm that the triple count has increased by the number of
    inserted triples, execute the following on the Destination Virtuoso
    Instance db2 and db3 SPARQL Endpoint:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

3.  Should return

    <span class="emphasis">*60*</span>

    as total.

    <div>

    <div>

    **Figure 16.265. Chain Replication Topology**

    <div>

    <div>

    ![Chain Replication Topology](images/ui/m38.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Bi-directional Replication Topology

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Bi-directional Replication Topology Example

</div>

</div>

</div>

The following How-To walks you through setting up Virtuoso RDF Graph
Replication in a Bi-directional Topology.

``` programlisting
db1 <---- db2
db1 ---->

 db2
```

<div>

<div>

<div>

<div>

###### Prerequisites

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Database INI Parameters

</div>

</div>

</div>

Suppose there are 2 Virtuoso instances respectively with the following
ini parameters values:

<div>

1.  virtuoso1.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso1.db
    TransactionFile = virtuoso1.trx
    ErrorLogFile     = virtuoso1.log
    ...
    [Parameters]
    ServerPort               = 1111
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8891
    ...
    [URIQA]
    DefaultHost = example.com:8891
    ...
    [Replication]
    ServerName   = db1
    ...
    ```

2.  virtuoso2.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso2.db
    TransactionFile = virtuoso2.trx
    ErrorLogFile     = virtuoso2.log
    ...
    [Parameters]
    ServerPort               = 1112
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8892
    ...
    [URIQA]
    DefaultHost = localhost:8892
    ...
    [Replication]
    ServerName   = db2
    ...
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Database DSNs

</div>

</div>

</div>

Use the ODBC Administrator on your Virtuoso host (e.g., on Windows,
Start menu -\> Control Panel -\> Administrative Tools -\> Data Sources
(ODBC); on Mac OS X, /Applications/Utilities/OpenLink ODBC
Administrator.app) to create a System DSN for db1 and db2 with names db1
and db2 respectively.

</div>

<div>

<div>

<div>

<div>

###### Install Conductor package

</div>

</div>

</div>

On each of the 2 Virtuoso instances install the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
class="ulink" target="_top">conductor_dav.vad</a> package.

</div>

</div>

<div>

<div>

<div>

<div>

###### Create Publication on db2

</div>

</div>

</div>

<div>

1.  Go to http://example.com:8892/conductor and log in as dba

2.  Go to Conductor -\> Replication -\> Transactional -\> Publications

    <div>

    <div>

    **Figure 16.266. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*Enable RDF Publishing*</span>

4.  As result publication with the name

    <span class="emphasis">*RDF Publication*</span>

    should be created

    <div>

    <div>

    **Figure 16.267. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd2.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the link which is the publication name.

6.  You will be shown the publication items page

    <div>

    <div>

    **Figure 16.268. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Enter for Graph IRI:

    ``` programlisting
    http://example.org
    ```

    <div>

    <div>

    **Figure 16.269. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click Add New

9.  The item will be created and shown in the list of items for the
    currently viewed publication.

    <div>

    <div>

    **Figure 16.270. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Create subscription from db1 to db2's Publication

</div>

</div>

</div>

<div>

1.  Log in at http://example.com:8891/conductor

2.  Go to Replication -\> Transactional -\> Subscriptions

    <div>

    <div>

    **Figure 16.271. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd6.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*New Subscription*</span>

    <div>

    <div>

    **Figure 16.272. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd7.png)

    </div>

    </div>

    </div>

      

    </div>

4.  From the list of "Specify new data source" select Data Source db2

    <div>

    <div>

    **Figure 16.273. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd8.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter for db2 dba user credentials

    <div>

    <div>

    **Figure 16.274. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd9.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click "Add Data Source"

7.  As result

    <span class="emphasis">*db2*</span>

    will be shown in the "Connected Data Sources" list.

    <div>

    <div>

    **Figure 16.275. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd10.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Select

    <span class="emphasis">*db2*</span>

    the "Connected Data Sources" list and click "Publications list"

    <div>

    <div>

    **Figure 16.276. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd11.png)

    </div>

    </div>

    </div>

      

    </div>

9.  As result will be shown the list of available publications for the
    selected data source. Select the one with name "RDF Publication" and
    click "List Items".

    <div>

    <div>

    **Figure 16.277. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd12.png)

    </div>

    </div>

    </div>

      

    </div>

10. As result will be shown the "Confirm subscription" page.

    <div>

    <div>

    **Figure 16.278. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd13.png)

    </div>

    </div>

    </div>

      

    </div>

11. The sync interval by default is 10 minutes. For the testing
    purposes, we will change it to 1 minute.

    <div>

    <div>

    **Figure 16.279. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd14.png)

    </div>

    </div>

    </div>

      

    </div>

12. Click "Subscribe"

13. The subscription will be created.

    <div>

    <div>

    **Figure 16.280. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd15.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Create Publication on db1

</div>

</div>

</div>

<div>

1.  Go to http://example.com:8891/conductor and log in as dba

2.  Go to Conductor -\> Replication -\> Transactional -\> Publications

    <div>

    <div>

    **Figure 16.281. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd16.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*Enable RDF Publishing*</span>

4.  As result publication with the name

    <span class="emphasis">*RDF Publication*</span>

    should be created

    <div>

    <div>

    **Figure 16.282. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd17.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the link which is the publication name.

6.  You will be shown the publication items page

    <div>

    <div>

    **Figure 16.283. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd18.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Enter for Graph IRI:

    ``` programlisting
    http://example.org
    ```

    <div>

    <div>

    **Figure 16.284. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd19.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click Add New

9.  The item will be created and shown in the list of items for the
    currently viewed publication.

    <div>

    <div>

    **Figure 16.285. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd20.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Create subscription from db2 to db1's Publication

</div>

</div>

</div>

<div>

1.  Log in at http://example.com:8892/conductor

2.  Go to Replication -\> Transactional -\> Subscriptions

    <div>

    <div>

    **Figure 16.286. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd21.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*New Subscription*</span>

    <div>

    <div>

    **Figure 16.287. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd22.png)

    </div>

    </div>

    </div>

      

    </div>

4.  From the list of "Specify new data source" select Data Source db1

    <div>

    <div>

    **Figure 16.288. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd23.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter for db1 dba user credentials

    <div>

    <div>

    **Figure 16.289. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd24.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click "Add Data Source"

    <div>

    <div>

    **Figure 16.290. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd25.png)

    </div>

    </div>

    </div>

      

    </div>

7.  As result

    <span class="emphasis">*db1*</span>

    will be shown in the "Connected Data Sources" list. Select it and
    click "Publications list"

    <div>

    <div>

    **Figure 16.291. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd26.png)

    </div>

    </div>

    </div>

      

    </div>

8.  As result will be shown the list of available publications for the
    selected data source. Select the one with name "RDF Publication" and
    click "List Items".

    <div>

    <div>

    **Figure 16.292. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd27.png)

    </div>

    </div>

    </div>

      

    </div>

9.  As result will be shown the "Confirm subscription" page.

    <div>

    <div>

    **Figure 16.293. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd28.png)

    </div>

    </div>

    </div>

      

    </div>

10. The sync interval by default is 10 minutes. For the testing
    purposes, we will change it to 1 minute.

    <div>

    <div>

    **Figure 16.294. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd29.png)

    </div>

    </div>

    </div>

      

    </div>

11. Click "Subscribe"

12. The subscription will be created.

    <div>

    <div>

    **Figure 16.295. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd30.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Insert Data into a Named Graph on the db2 Virtuoso Instance

</div>

</div>

</div>

<div>

1.  Log in at http://example.com:8892/conductor

2.  Go to Linked Data -\> Quad Store Upload:

    <div>

    <div>

    **Figure 16.296. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/uc1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  In the shown form:

4.  Tick the box for

    <span class="emphasis">*Resource URL*</span>

    and enter your resource URL, e.g.:

    ``` programlisting
    http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this
    ```

5.  Enter for Named Graph IRI:

    ``` programlisting
    http://example.org
    ```

    <div>

    <div>

    **Figure 16.297. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd32.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click Upload

7.  A successful upload will result in a shown message.

    <div>

    <div>

    **Figure 16.298. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/m33.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Check the count of the inserted triples by executing a query like
    the following against the SPARQL endpoint,
    http://example.com:8892/sparql:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

    <div>

    <div>

    **Figure 16.299. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd34.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Should return

    <span class="emphasis">*57*</span>

    as total.

    <div>

    <div>

    **Figure 16.300. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd35.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Check data on the Destination instance db1

</div>

</div>

</div>

<div>

1.  To check the starting count, execute from db1's SPARQL Endpoint:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

2.  Should return

    <span class="emphasis">*57*</span>

    as total.

    <div>

    <div>

    **Figure 16.301. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd35.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Add new data on db2

</div>

</div>

</div>

<div>

1.  Disconnect db1.

2.  On the Host Virtuoso Instance db2 go to Conductor -\> Database -\>
    Interactive SQL enter the following statement:

    ``` programlisting
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
         <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
         <http://xmlns.com/foaf/0.1/interest>
         <http://dbpedia.org/resource/Web_Services>
      } ;
    ```

    <div>

    <div>

    **Figure 16.302. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd36.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click "Execute"

4.  As result the triples will be inserted

    <div>

    <div>

    **Figure 16.303. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd37.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Check the count of the destination instance graph's triples by
    executing the following query like against the SPARQL endpoint,
    http://example.com:8892/sparql:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

6.  Should return

    <span class="emphasis">*58*</span>

    as total.

    <div>

    <div>

    **Figure 16.304. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd38.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Check data on the Destination instance db1

</div>

</div>

</div>

<div>

1.  Start instance db1

2.  To confirm that the triple count has increased by the number of
    inserted triples, execute the following statement on db1's SPARQL
    Endpoint:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

3.  Should return

    <span class="emphasis">*58*</span>

    as total.

    <div>

    <div>

    **Figure 16.305. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd38.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Add new data on db1

</div>

</div>

</div>

<div>

1.  Disconnect db2.

2.  On the Host Virtuoso Instance db1 go to Conductor -\> Database -\>
    Interactive SQL enter the following statement:

    ``` programlisting
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
        <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
        <http://xmlns.com/foaf/0.1/interest>
        <http://dbpedia.org/resource/Web_Clients>
      } ;
    SPARQL INSERT INTO GRAPH <http://example.org>
      {
        <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
        <http://xmlns.com/foaf/0.1/interest>
        <http://dbpedia.org/resource/SPARQL>
      } ;
    ```

    <div>

    <div>

    **Figure 16.306. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd39.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click "Execute"

4.  As result the triples will be inserted

    <div>

    <div>

    **Figure 16.307. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd40.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Check the count of the destination instance graph's triples by
    executing the following query like against the SPARQL endpoint,
    http://example.com:8891/sparql:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

6.  Should return

    <span class="emphasis">*60*</span>

    as total.

    <div>

    <div>

    **Figure 16.308. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd41.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Check data on the Destination instance db2

</div>

</div>

</div>

<div>

1.  Start instance db2

2.  To confirm that the triple count has increased by the number of
    inserted triples, execute the following statement on db2's SPARQL
    Endpoint:

    ``` programlisting
    SELECT COUNT(*)
       FROM <http://example.org>
    WHERE { ?s ?p ?o }
    ```

3.  Should return

    <span class="emphasis">*60*</span>

    as total.

    <div>

    <div>

    **Figure 16.309. Bi-directional Replication Topology**

    <div>

    <div>

    ![Bi-directional Replication Topology](images/ui/bd41.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

</div>

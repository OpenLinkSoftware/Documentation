<div id="rdfnativestorageproviders" class="section">

<div class="titlepage">

<div>

<div>

## 16.18. RDF Data Access Providers (Drivers)

</div>

</div>

</div>

<div id="rdfnativestorageprovidersjena" class="section">

<div class="titlepage">

<div>

<div>

### 16.18.1. Virtuoso Jena Provider

</div>

</div>

</div>

<div id="rdfnativestorageprovidersjenawhatis" class="section">

<div class="titlepage">

<div>

<div>

#### What is Jena

</div>

</div>

</div>

Jena is an open source Semantic Web framework for Java. It provides an
API to extract data from and write to RDF graphs. The graphs are
represented as an abstract "model". A model can be sourced with data
from files, databases, URIs or a combination of these. A Model can also
be queried through SPARQL and updated through SPARUL.

</div>

<div id="rdfnativestorageprovidersjenawhatisv" class="section">

<div class="titlepage">

<div>

<div>

#### What is the Virtuoso Jena Provider

</div>

</div>

</div>

The Virtuoso Jena RDF Data Provider is a fully operational Native Graph
Model Storage Provider for the Jena Framework, which enables Semantic
Web applications written using the Jena RDF Frameworks to directly query
the Virtuoso RDF Quad Store. Providers are available for the latest
<a href="http://jena.sourceforge.net/" class="ulink"
target="_top">Jena</a> 2.6.x and 2.10.x versions.

<div class="figure-float">

<div id="rdfnativestorageprovidersjena1" class="figure">

**Figure 16.185. Virtuoso Jena RDF Data Provider**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso Jena RDF Data Provider](images/ui/VirtJenaProvider.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="rdfnativestorageprovidersjenasetup" class="section">

<div class="titlepage">

<div>

<div>

#### Setup

</div>

</div>

</div>

<div id="rdfnativestorageprovidersjenareqfiles" class="section">

<div class="titlepage">

<div>

<div>

##### Prerequisites

</div>

</div>

</div>

<a
href="http://edit-wiki.usnet.private/dataspace/dav/wiki/VOS/VOSDownload#Jena%20Provider"
class="ulink" target="_top">Download the latest</a> Virtuoso Jena
Provider for your Jena framework version, Virtuoso JDBC 3 Driver, Jena
Framework, and associated classes and sample programs.

<div class="itemizedlist">

- <span class="emphasis">*Note:*</span>

  The Jena Provider is explicitly bound to the Virtuoso JDBC 3 Driver.
  You cannot use the Virtuoso JDBC 4 Driver for this purpose at this
  time.

- The version of the Jena Provider (virt_jena.jar) can be verified with
  the command:

  ``` programlisting
  $ java -jar virt_jena.jar
  OpenLink Virtuoso(TM) Provider for Jena(TM) Version 2.6.2 [Build 1.2]
  ```

- Files contained in the zip files are generally older than specifically
  linked downloads (e.g., the Virtuoso JDBC Driver, virtjdbc3.jar), so
  don't replace if prompted during extraction. Instead, rename the file
  extracted from the zip, and compare their versions to be sure you keep
  only the most recent.

  ``` programlisting
  $ java -cp virtjdbc3.jar virtuoso.jdbc3.Driver
  OpenLink Virtuoso(TM) Driver for JDBC(TM) Version 3.x [Build 3.57]
  $ java -cp virtjdbc3.fromzip.jar virtuoso.jdbc3.Driver
  OpenLink Virtuoso(TM) Driver for JDBC(TM) Version 3.x [Build 3.11]
  ```

- Downloads:

  <div class="itemizedlist">

  - Virtuoso Jena Provider JAR file, <a
    href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSDownload/virt_jena.jar"
    class="ulink" target="_top">virt_jena.jar</a>

  - Virtuoso JDBC Driver 3 JAR file, <a
    href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSDownload/virtjdbc3.jar"
    class="ulink" target="_top">virtjdbc3.jar</a>

  - Virtuoso JDBC Driver 4 JAR file, <a
    href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSDownload/virtjdbc4.jar"
    class="ulink" target="_top">virtjdbc4.jar</a>

  - Jena Framework and associated classes, <a
    href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSDownload/jenajars.zip"
    class="ulink" target="_top">jenajars.zip</a>

  - Sample programs, <a
    href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSDownload/virtjenasamples.zip"
    class="ulink" target="_top">virtjenasamples.zip</a>

  </div>

</div>

</div>

<div id="rdfnativestorageprovidersjenacmsmpr" class="section">

<div class="titlepage">

<div>

<div>

##### Compiling Jena Sample Programs

</div>

</div>

</div>

<div class="orderedlist">

1.  Edit the sample programs VirtuosoSPARQLExampleX.java, where X = 1
    to 9. Set the JDBC connection strings within to point to a valid
    Virtuoso Server instance of the form:

    ``` programlisting
    "jdbc:virtuoso://localhost:1111/charset=UTF-8/log_enable=2"
    ```

    <div class="itemizedlist">

    - charset=UTF-8 will be added by Jena provider, if it isn't in
      connection string. So now you don't need add "charset=UTF-8" to
      the connection string any more, it is done by Jena provider.

    - log_enable=2: to use row auto commit

    - use these settings to process large rdf data.

    </div>

2.  Ensure that full paths to

    <span class="emphasis">*jena.jar, arq.jar,*</span>

    and

    <span class="emphasis">*virtjdbc3.jar*</span>

    are included in the active CLASSPATH setting.

3.  Compile the Jena Sample applications using the following command:

    ``` programlisting
    javac -cp "jena.jar:arq.jar:virtjdbc3.jar:virt_jena.jar:." VirtuosoSPARQLExample1.java
    VirtuosoSPARQLExample2.java VirtuosoSPARQLExample3.java VirtuosoSPARQLExample4.java
    VirtuosoSPARQLExample5.java VirtuosoSPARQLExample6.java VirtuosoSPARQLExample7.java
    VirtuosoSPARQLExample8.java VirtuosoSPARQLExample9.java
    ```

</div>

</div>

<div id="rdfnativestorageprovidersjenatesting" class="section">

<div class="titlepage">

<div>

<div>

##### Testing

</div>

</div>

</div>

Once the Provider classes and sample program have been successfully
compiled, the Provider can be tested using the sample programs included.
Ensure your active CLASSPATH includes full paths to all of the following
files, before executing the example commands:

<div class="itemizedlist">

- icu4j_3_4.jar

- iri.jar

- xercesImpl.jar

- axis.jar

- commons-logging-1.1.1.jar

- jena.jar

- arq.jar

- virtjdbc3.jar

- virt_jena.jar

</div>

<div class="orderedlist">

1.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples1"
    class="link" title="VirtJenaSPARQLExample1">VirtuosoSPARQLExample1</a>
    returns the contents of the RDF Quad store of the targeted Virtuoso
    instance, with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample1
    ```

2.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples2"
    class="link" title="VirtJenaSPARQLExample2">VirtuosoSPARQLExample2</a>
    reads in the contents of the following FOAF URIs --

    ``` programlisting
    http://kidehen.idehen.net/dataspace/person/kidehen#this
    http://www.w3.org/People/Berners-Lee/card#i
    http://demo.openlinksw.com/dataspace/person/demo#this
    ```

    -- and returns the RDF data stored, with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample2
    ```

3.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples3"
    class="link" title="VirtJenaSPARQLExample3">VirtuosoSPARQLExample3</a>
    performs simple addition and deletion operation on the content of
    the triple store, with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample3
    ```

4.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples4"
    class="link" title="VirtJenaSPARQLExample4">VirtuosoSPARQLExample4</a>
    demonstrates the use of the
    <span class="emphasis">*graph.contains*</span> method for searching
    triples, with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample4
    ```

5.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples5"
    class="link" title="VirtJenaSPARQLExample5">VirtuosoSPARQLExample5</a>
    demonstrates the use of the
    <span class="emphasis">*graph.find*</span> method for searching
    triples, with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample5
    ```

6.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples6"
    class="link" title="VirtJenaSPARQLExample6">VirtuosoSPARQLExample6</a>
    demonstrates the use of the
    <span class="emphasis">*graph.getTransactionHandler*</span> method,
    with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample6
    ```

7.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples7"
    class="link" title="VirtJenaSPARQLExample7">VirtuosoSPARQLExample7</a>
    demonstrates the use of the graph.getBulkUpdateHandler method, with
    the following command:

    ``` programlisting
    java VirtuosoSPARQLExample7
    ```

8.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples8"
    class="link" title="VirtJenaSPARQLExample8">VirtuosoSPARQLExample8</a>
    demonstrates how to insert triples into a graph, with the following
    command:

    ``` programlisting
    java VirtuosoSPARQLExample8
    ```

9.  <a
    href="rdfnativestorageproviders.html#rdfnativestorageprovidersjenaexamples9"
    class="link" title="VirtJenaSPARQLExample9">VirtuosoSPARQLExample9</a>
    demonstrates the use of the <span class="emphasis">*CONSTRUCT,
    DESCRIBE,*</span> and <span class="emphasis">*ASK*</span> SPARQL
    query forms, with the following command:

    ``` programlisting
    java VirtuosoSPARQLExample9
    ```

</div>

</div>

</div>

<div id="rdfnativestorageprovidersjenaexamples" class="section">

<div class="titlepage">

<div>

<div>

#### Examples

</div>

</div>

</div>

<div id="rdfnativestorageprovidersjenaexamples1" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample1

</div>

</div>

</div>

``` programlisting
import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.rdf.model.RDFNode;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample1 {

    /**
     * Executes a SPARQL query against a virtuoso url and prints results.
     */
    public static void main(String[] args) {

        String url;
        if(args.length == 0)
            url = "jdbc:virtuoso://localhost:1111";
        else
            url = args[0];

/*          STEP 1          */
        VirtGraph set = new VirtGraph (url, "dba", "dba");

/*          STEP 2          */

/*          STEP 3          */
/*      Select all data in virtuoso */
        Query sparql = QueryFactory.create("SELECT * WHERE { GRAPH ?graph { ?s ?p ?o } } limit 100");

/*          STEP 4          */
        VirtuosoQueryExecution vqe = VirtuosoQueryExecutionFactory.create (sparql, set);

        ResultSet results = vqe.execSelect();
        while (results.hasNext()) {
            QuerySolution result = results.nextSolution();
            RDFNode graph = result.get("graph");
            RDFNode s = result.get("s");
            RDFNode p = result.get("p");
            RDFNode o = result.get("o");
            System.out.println(graph + " { " + s + " " + p + " " + o + " . }");
        }
    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples2" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample2

</div>

</div>

</div>

``` programlisting
import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.rdf.model.RDFNode;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample2 {

    /**
     * Executes a SPARQL query against a virtuoso url and prints results.
     */
    public static void main(String[] args) {

        String url;
        if(args.length == 0)
            url = "jdbc:virtuoso://localhost:1111";
        else
            url = args[0];

/*          STEP 1          */
        VirtGraph graph = new VirtGraph ("Example2", url, "dba", "dba");

/*          STEP 2          */
/*      Load data to Virtuoso       */
        graph.clear ();

        System.out.print ("Begin read from 'http://www.w3.org/People/Berners-Lee/card#i'  ");
        graph.read("http://www.w3.org/People/Berners-Lee/card#i", "RDF/XML");
        System.out.println ("\t\t\t Done.");

        System.out.print ("Begin read from 'http://demo.openlinksw.com/dataspace/person/demo#this'  ");
        graph.read("http://demo.openlinksw.com/dataspace/person/demo#this", "RDF/XML");
        System.out.println ("\t Done.");

        System.out.print ("Begin read from 'http://kidehen.idehen.net/dataspace/person/kidehen#this'  ");
        graph.read("http://kidehen.idehen.net/dataspace/person/kidehen#this", "RDF/XML");
        System.out.println ("\t Done.");

/*          STEP 3          */
/*      Select only from VirtGraph  */
        Query sparql = QueryFactory.create("SELECT ?s ?p ?o WHERE { ?s ?p ?o }");

/*          STEP 4          */
        VirtuosoQueryExecution vqe = VirtuosoQueryExecutionFactory.create (sparql, graph);

        ResultSet results = vqe.execSelect();
        while (results.hasNext()) {
            QuerySolution result = results.nextSolution();
            RDFNode graph_name = result.get("graph");
            RDFNode s = result.get("s");
            RDFNode p = result.get("p");
            RDFNode o = result.get("o");
            System.out.println(graph_name + " { " + s + " " + p + " " + o + " . }");
        }

        System.out.println("graph.getCount() = " + graph.getCount());
    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples3" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample3

</div>

</div>

</div>

``` programlisting
import java.util.*;

import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.graph.Node;
import com.hp.hpl.jena.graph.Triple;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample3
{
    public static void main(String[] args)
    {
    String url;

    if(args.length == 0)
        url = "jdbc:virtuoso://localhost:1111";
    else
        url = args[0];

    Node foo1 = Node.createURI("http://example.org/#foo1");
    Node bar1 = Node.createURI("http://example.org/#bar1");
    Node baz1 = Node.createURI("http://example.org/#baz1");

    Node foo2 = Node.createURI("http://example.org/#foo2");
    Node bar2 = Node.createURI("http://example.org/#bar2");
    Node baz2 = Node.createURI("http://example.org/#baz2");

    Node foo3 = Node.createURI("http://example.org/#foo3");
    Node bar3 = Node.createURI("http://example.org/#bar3");
    Node baz3 = Node.createURI("http://example.org/#baz3");

    List <Triple> triples = new ArrayList <Triple> ();

    VirtGraph graph = new VirtGraph ("Example3", url, "dba", "dba");

    graph.clear ();

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("Add 3 triples to graph <Example3>.");

    graph.add(new Triple(foo1, bar1, baz1));
    graph.add(new Triple(foo2, bar2, baz2));
    graph.add(new Triple(foo3, bar3, baz3));

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    triples.add(new Triple(foo1, bar1, baz1));
    triples.add(new Triple(foo2, bar2, baz2));

    graph.isEmpty();

    System.out.println("Remove 2 triples from graph <Example3>");
    graph.remove(triples);
    System.out.println("graph.getCount() = " + graph.getCount());
    System.out.println("Please check result with isql tool.");

    /* EXPECTED RESULT:

SQL> SPARQL
SELECT ?s ?p ?o
FROM <Example3>
WHERE {?s ?p ?o};
s                                                    p                                                             o
VARCHAR                                    VARCHAR                                              VARCHAR
_______________________________________________________________________________

http://example.org/#foo3              http://example.org/#bar3                         http://example.org/#baz3

1 Rows. -- 26 msec.
SQL>

*/

    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples4" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample4

</div>

</div>

</div>

``` programlisting
import java.util.*;

import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.graph.Node;
import com.hp.hpl.jena.graph.Triple;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample4
{

    public static void main(String[] args)
    {
    String url;
    if(args.length == 0)
        url = "jdbc:virtuoso://localhost:1111";
    else
        url = args[0];

    Node foo1 = Node.createURI("http://example.org/#foo1");
    Node bar1 = Node.createURI("http://example.org/#bar1");
    Node baz1 = Node.createURI("http://example.org/#baz1");

    Node foo2 = Node.createURI("http://example.org/#foo2");
    Node bar2 = Node.createURI("http://example.org/#bar2");
    Node baz2 = Node.createURI("http://example.org/#baz2");

    Node foo3 = Node.createURI("http://example.org/#foo3");
    Node bar3 = Node.createURI("http://example.org/#bar3");
    Node baz3 = Node.createURI("http://example.org/#baz3");

    VirtGraph graph = new VirtGraph ("Example4", url, "dba", "dba");

    graph.clear ();

    System.out.println("graph.isEmpty() = " + graph.isEmpty());

    System.out.println("Add 3 triples to graph <Example4>.");

    graph.add(new Triple(foo1, bar1, baz1));
    graph.add(new Triple(foo2, bar2, baz2));
    graph.add(new Triple(foo3, bar3, baz3));

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    System.out.println ("graph.contains(new Triple(foo2, bar2, baz2) - " + graph.contains(new Triple(foo2, bar2, baz2)));
    System.out.println ("graph.contains(new Triple(foo2, bar2, baz3) - " + graph.contains(new Triple(foo2, bar2, baz3)));

    graph.clear ();

    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples5" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample5

</div>

</div>

</div>

``` programlisting
import java.util.*;

import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.util.iterator.ExtendedIterator;
import com.hp.hpl.jena.graph.Node;
import com.hp.hpl.jena.graph.Triple;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample5
{

    public static void main(String[] args)
    {
    String url;
    if(args.length == 0)
        url = "jdbc:virtuoso://localhost:1111";
    else
        url = args[0];

    Node foo1 = Node.createURI("http://example.org/#foo1");
    Node bar1 = Node.createURI("http://example.org/#bar1");
    Node baz1 = Node.createURI("http://example.org/#baz1");

    Node foo2 = Node.createURI("http://example.org/#foo2");
    Node bar2 = Node.createURI("http://example.org/#bar2");
    Node baz2 = Node.createURI("http://example.org/#baz2");

    Node foo3 = Node.createURI("http://example.org/#foo3");
    Node bar3 = Node.createURI("http://example.org/#bar3");
    Node baz3 = Node.createURI("http://example.org/#baz3");

    VirtGraph graph = new VirtGraph ("Example5", url, "dba", "dba");

    graph.clear ();

    System.out.println("graph.isEmpty() = " + graph.isEmpty());

    System.out.println("Add 3 triples to graph <Example5>.");

    graph.add(new Triple(foo1, bar1, baz1));
    graph.add(new Triple(foo2, bar2, baz2));
    graph.add(new Triple(foo3, bar3, baz3));
    graph.add(new Triple(foo1, bar2, baz2));
    graph.add(new Triple(foo1, bar3, baz3));

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    ExtendedIterator iter = graph.find(foo1, Node.ANY, Node.ANY);
    System.out.println ("\ngraph.find(foo1, Node.ANY, Node.ANY) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    iter = graph.find(Node.ANY, Node.ANY, baz3);
    System.out.println ("\ngraph.find(Node.ANY, Node.ANY, baz3) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    iter = graph.find(foo1, Node.ANY, baz3);
    System.out.println ("\ngraph.find(foo1, Node.ANY, baz3) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    graph.clear ();

    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples6" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample6

</div>

</div>

</div>

``` programlisting
import java.util.*;

import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.util.iterator.ExtendedIterator;
import com.hp.hpl.jena.graph.Node;
import com.hp.hpl.jena.graph.Triple;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample6
{

    public static void main(String[] args)
    {
    String url;
    if(args.length == 0)
        url = "jdbc:virtuoso://localhost:1111";
    else
        url = args[0];

    Node foo1 = Node.createURI("http://example.org/#foo1");
    Node bar1 = Node.createURI("http://example.org/#bar1");
    Node baz1 = Node.createURI("http://example.org/#baz1");

    Node foo2 = Node.createURI("http://example.org/#foo2");
    Node bar2 = Node.createURI("http://example.org/#bar2");
    Node baz2 = Node.createURI("http://example.org/#baz2");

    Node foo3 = Node.createURI("http://example.org/#foo3");
    Node bar3 = Node.createURI("http://example.org/#bar3");
    Node baz3 = Node.createURI("http://example.org/#baz3");

    VirtGraph graph = new VirtGraph ("Example6", url, "dba", "dba");

    graph.clear ();

    System.out.println("graph.isEmpty() = " + graph.isEmpty());

    System.out.println("test Transaction Commit.");
    graph.getTransactionHandler().begin();
    System.out.println("begin Transaction.");
    System.out.println("Add 3 triples to graph <Example6>.");

    graph.add(new Triple(foo1, bar1, baz1));
    graph.add(new Triple(foo2, bar2, baz2));
    graph.add(new Triple(foo3, bar3, baz3));

    graph.getTransactionHandler().commit();
    System.out.println("commit Transaction.");
    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    ExtendedIterator iter = graph.find(Node.ANY, Node.ANY, Node.ANY);
    System.out.println ("\ngraph.find(Node.ANY, Node.ANY, Node.ANY) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    graph.clear ();
    System.out.println("\nCLEAR graph <Example6>");
    System.out.println("graph.isEmpty() = " + graph.isEmpty());

    System.out.println("Add 1 triples to graph <Example6>.");
    graph.add(new Triple(foo1, bar1, baz1));

    System.out.println("test Transaction Abort.");
    graph.getTransactionHandler().begin();
    System.out.println("begin Transaction.");
    System.out.println("Add 2 triples to graph <Example6>.");

    graph.add(new Triple(foo2, bar2, baz2));
    graph.add(new Triple(foo3, bar3, baz3));

    graph.getTransactionHandler().abort();
    System.out.println("abort Transaction.");
    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    iter = graph.find(Node.ANY, Node.ANY, Node.ANY);
    System.out.println ("\ngraph.find(Node.ANY, Node.ANY, Node.ANY) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    graph.clear ();
    System.out.println("\nCLEAR graph <Example6>");

    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples7" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample7

</div>

</div>

</div>

``` programlisting
import java.util.*;

import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.util.iterator.ExtendedIterator;
import com.hp.hpl.jena.graph.Node;
import com.hp.hpl.jena.graph.Triple;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample7
{

    public static void main(String[] args)
    {
    String url;
    if(args.length == 0)
        url = "jdbc:virtuoso://localhost:1111";
    else
        url = args[0];

    Node foo1 = Node.createURI("http://example.org/#foo1");
    Node bar1 = Node.createURI("http://example.org/#bar1");
    Node baz1 = Node.createURI("http://example.org/#baz1");

    Node foo2 = Node.createURI("http://example.org/#foo2");
    Node bar2 = Node.createURI("http://example.org/#bar2");
    Node baz2 = Node.createURI("http://example.org/#baz2");

    Node foo3 = Node.createURI("http://example.org/#foo3");
    Node bar3 = Node.createURI("http://example.org/#bar3");
    Node baz3 = Node.createURI("http://example.org/#baz3");

    List triples1 = new ArrayList();
    triples1.add(new Triple(foo1, bar1, baz1));
    triples1.add(new Triple(foo2, bar2, baz2));
    triples1.add(new Triple(foo3, bar3, baz3));

    List triples2 = new ArrayList();
    triples2.add(new Triple(foo1, bar1, baz1));
    triples2.add(new Triple(foo2, bar2, baz2));

    VirtGraph graph = new VirtGraph ("Example7", url, "dba", "dba");

    graph.clear ();

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("Add List with 3 triples to graph <Example7> via BulkUpdateHandler.");

    graph.getBulkUpdateHandler().add(triples1);

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    ExtendedIterator iter = graph.find(Node.ANY, Node.ANY, Node.ANY);
    System.out.println ("\ngraph.find(Node.ANY, Node.ANY, Node.ANY) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    System.out.println("\n\nDelete List of 2 triples from graph <Example7> via BulkUpdateHandler.");

    graph.getBulkUpdateHandler().delete(triples2);

    System.out.println("graph.isEmpty() = " + graph.isEmpty());
    System.out.println("graph.getCount() = " + graph.getCount());

    iter = graph.find(Node.ANY, Node.ANY, Node.ANY);
    System.out.println ("\ngraph.find(Node.ANY, Node.ANY, Node.ANY) \nResult:");
    for ( ; iter.hasNext() ; )
        System.out.println ((Triple) iter.next());

    graph.clear ();
    System.out.println("\nCLEAR graph <Example7>");

    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples8" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample8

</div>

</div>

</div>

``` programlisting
import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.rdf.model.RDFNode;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample8 {

    /**
     * Executes a SPARQL query against a virtuoso url and prints results.
     */
    public static void main(String[] args) {

        String url;
        if(args.length == 0)
            url = "jdbc:virtuoso://localhost:1111";
        else
            url = args[0];

/*          STEP 1          */
        VirtGraph set = new VirtGraph (url, "dba", "dba");

/*          STEP 2          */
System.out.println("\nexecute: CLEAR GRAPH <http://test1>");
                String str = "CLEAR GRAPH <http://test1>";
                VirtuosoUpdateRequest vur = VirtuosoUpdateFactory.create(str, set);
                vur.exec();

System.out.println("\nexecute: INSERT INTO GRAPH <http://test1> { <aa> <bb> 'cc' . <aa1> <bb1> 123. }");
                str = "INSERT INTO GRAPH <http://test1> { <aa> <bb> 'cc' . <aa1> <bb1> 123. }";
                vur = VirtuosoUpdateFactory.create(str, set);
                vur.exec();

/*          STEP 3          */
/*      Select all data in virtuoso */
System.out.println("\nexecute: SELECT * FROM <http://test1> WHERE { ?s ?p ?o }");
        Query sparql = QueryFactory.create("SELECT * FROM <http://test1> WHERE { ?s ?p ?o }");

/*          STEP 4          */
        VirtuosoQueryExecution vqe = VirtuosoQueryExecutionFactory.create (sparql, set);

        ResultSet results = vqe.execSelect();
        while (results.hasNext()) {
            QuerySolution rs = results.nextSolution();
            RDFNode s = rs.get("s");
            RDFNode p = rs.get("p");
            RDFNode o = rs.get("o");
            System.out.println(" { " + s + " " + p + " " + o + " . }");
        }

System.out.println("\nexecute: DELETE FROM GRAPH <http://test1> { <aa> <bb> 'cc' }");
                str = "DELETE FROM GRAPH <http://test1> { <aa> <bb> 'cc' }";
                vur = VirtuosoUpdateFactory.create(str, set);
                vur.exec();

System.out.println("\nexecute: SELECT * FROM <http://test1> WHERE { ?s ?p ?o }");
        vqe = VirtuosoQueryExecutionFactory.create (sparql, set);
                results = vqe.execSelect();
        while (results.hasNext()) {
            QuerySolution rs = results.nextSolution();
            RDFNode s = rs.get("s");
            RDFNode p = rs.get("p");
            RDFNode o = rs.get("o");
            System.out.println(" { " + s + " " + p + " " + o + " . }");
        }

    }
}
```

</div>

<div id="rdfnativestorageprovidersjenaexamples9" class="section">

<div class="titlepage">

<div>

<div>

##### VirtJenaSPARQLExample9

</div>

</div>

</div>

``` programlisting
import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.graph.Triple;
import com.hp.hpl.jena.graph.Node;
import com.hp.hpl.jena.graph.Graph;
import com.hp.hpl.jena.rdf.model.*;
import java.util.Iterator;

import virtuoso.jena.driver.*;

public class VirtuosoSPARQLExample9 {

    /**
     * Executes a SPARQL query against a virtuoso url and prints results.
     */
    public static void main(String[] args) {

        String url;
        if(args.length == 0)
            url = "jdbc:virtuoso://localhost:1111";
        else
            url = args[0];

/*          STEP 1          */
        VirtGraph set = new VirtGraph (url, "dba", "dba");

/*          STEP 2          */
                String str = "CLEAR GRAPH <http://test1>";
                VirtuosoUpdateRequest vur = VirtuosoUpdateFactory.create(str, set);
                vur.exec();

                str = "INSERT INTO GRAPH <http://test1> { <http://aa> <http://bb> 'cc' . <http://aa1> <http://bb> 123. }";
                vur = VirtuosoUpdateFactory.create(str, set);
                vur.exec();

/*      Select all data in virtuoso */
        Query sparql = QueryFactory.create("SELECT * FROM <http://test1> WHERE { ?s ?p ?o }");
        VirtuosoQueryExecution vqe = VirtuosoQueryExecutionFactory.create (sparql, set);
        ResultSet results = vqe.execSelect();
                System.out.println("\nSELECT results:");
        while (results.hasNext()) {
            QuerySolution rs = results.nextSolution();
            RDFNode s = rs.get("s");
            RDFNode p = rs.get("p");
            RDFNode o = rs.get("o");
            System.out.println(" { " + s + " " + p + " " + o + " . }");
        }

        sparql = QueryFactory.create("DESCRIBE <http://aa> FROM <http://test1>");
        vqe = VirtuosoQueryExecutionFactory.create (sparql, set);

        Model model = vqe.execDescribe();
            Graph g = model.getGraph();
                System.out.println("\nDESCRIBE results:");
            for (Iterator i = g.find(Node.ANY, Node.ANY, Node.ANY); i.hasNext();)
               {
                  Triple t = (Triple)i.next();
              System.out.println(" { " + t.getSubject() + " " +
                             t.getPredicate() + " " +
                             t.getObject() + " . }");
            }

        sparql = QueryFactory.create("CONSTRUCT { ?x <http://test> ?y } FROM <http://test1> WHERE { ?x <http://bb> ?y }");
        vqe = VirtuosoQueryExecutionFactory.create (sparql, set);

        model = vqe.execConstruct();
            g = model.getGraph();
                System.out.println("\nCONSTRUCT results:");
            for (Iterator i = g.find(Node.ANY, Node.ANY, Node.ANY); i.hasNext();)
               {
                  Triple t = (Triple)i.next();
              System.out.println(" { " + t.getSubject() + " " +
                             t.getPredicate() + " " +
                             t.getObject() + " . }");
            }

        sparql = QueryFactory.create("ASK FROM <http://test1> WHERE { <http://aa> <http://bb> ?y }");
        vqe = VirtuosoQueryExecutionFactory.create (sparql, set);

        boolean res = vqe.execAsk();
                System.out.println("\nASK results: "+res);

    }
}
```

</div>

</div>

<div id="rdfnativestorageprovidersjenajavadoc" class="section">

<div class="titlepage">

<div>

<div>

#### Javadoc API Documentation

</div>

</div>

</div>

Javadocs covers the complete set of classes, interfaces, and methods
implemented by the provider:

<div class="itemizedlist">

- <a href="http://docs.openlinksw.com/jena/" class="ulink"
  target="_top">Javadoc API Documentation for the Jena 2.6 Provider</a>

- <a href="http://docs.openlinksw.com/jena2/" class="ulink"
  target="_top">Javadoc API Documentation for the Jena 2.10+ Provider</a>

</div>

</div>

</div>

</div>

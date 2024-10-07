<div id="virtuosotipsandtricksdefinegraphwithspongeroption"
class="section">

<div class="titlepage">

<div>

<div>

### 1.5.13. How Can I define graph with virt:rdf_sponger option set to "on"?

</div>

</div>

</div>

Suppose we have the following scenario:

<div class="orderedlist">

1.  Create Virtuoso user using Conductor for ex. with name "john" and
    pwd 1.

2.  Create for the user a RDF Sink folder for ex. with name
    "MySinkFolder" from type "RDF Upload Folder" or use the

    <span class="emphasis">*rdf_sink*</span>

    folder created automatically for your user.

3.  In the properties page of the RDF sink folder add in the WebDAV
    section this property

    <span class="emphasis">*virt:rdf_graph*</span>

    with value:

    ``` programlisting
    http://host:port/DAV/home/<user-name>/<rdf-sink-folder>/

    -- So in our example it should be:
    http://example.com/DAV/home/john/MySinkFolder/
    ```

4.  Add another property virt:rdf_sponger with value "on".

    <div class="figure-float">

    <div id="sink1" class="figure">

    **Figure 1.2. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/ui/sink1.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Upload RDF files to the RDF Sink folder "MySinkFolder", for ex.
    upload file with name "data.rdf":

    <div class="figure-float">

    <div id="sink2" class="figure">

    **Figure 1.3. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/ui/sink2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  As result the RDF data should be stored in graph depending on your
    folder name etc.:

    ``` programlisting
    http:///local.virt/DAV/home/<user-name>/<rdf-sink-folder>/<resource>

    -- So in our example it will be:
    http:///local.virt/DAV/home/john/MySinkFolder/data.rdf
    ```

    <div class="orderedlist">

    1.  Go to http://host:port/sparql ;

    2.  Execute simple query to view the graph triples:

        ``` programlisting
        SELECT  *
        FROM <http://local.virt/DAV/home/john/MySinkFolder/data.rdf>
        WHERE
          {
            ?s ?p ?o
          }
        ```

        <div class="figure-float">

        <div id="sink3" class="figure">

        **Figure 1.4. **

        <div class="figure-contents">

        <div class="mediaobject">

        ![](images/ui/sink3.png)

        </div>

        </div>

        </div>

          

        </div>

        <div class="figure-float">

        <div id="sink4" class="figure">

        **Figure 1.5. **

        <div class="figure-contents">

        <div class="mediaobject">

        ![](images/ui/sink4.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

7.  In order to define any graph you want with the options from above,
    you should execute:

    ``` programlisting
    SQL> DAV_PROP_SET ('/DAV/home/<user-name>/<rdf-sink-folder>/',  'virt:rdf_graph', iri, <user-name>, <password>);

    -- So in our example it should be:
    SQL> DAV_PROP_SET ('/DAV/home/john/MySinkFolder/',  'virt:rdf_graph', 'http://mydata.com', 'john', '1');
    ```

    <div class="itemizedlist">

    - Note: calling this function uses the given IRI as the graph IRI
      when sponging stuff put in \<your-rdf-sink-folder\>.

    </div>

8.  Finally you should execute the following command to get the RDF data
    from the new graph:

    ``` programlisting
    SQL> SELECT DAV_PROP_GET ('/DAV/home/<user-name>/<your-rdf-sink-folder>/', 'virt:rdf_graph',<user-name>, <password>);

    -- So in our example it should be:
    SQL> SELECT DAV_PROP_GET ('/DAV/home/john/MySinkFolder/', 'virt:rdf_graph','john', '1');

    Query result:
    DAV_PROP_GET
    http://example.com/DAV/home/john/MySinkFolder/

    No. of rows in result: 1
    ```

</div>

</div>

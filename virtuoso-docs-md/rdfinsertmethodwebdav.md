<div id="rdfinsertmethodwebdav" class="section">

<div class="titlepage">

<div>

<div>

### 16.9.7. Using WebDAV

</div>

</div>

</div>

Example using WebDAV (mount folder to DAV and dump; if this is the
rdf_sink the Quad Store is updated automatically, or you can load from
DAV manually to quad store)

<span class="emphasis">*Example:*</span>

<span class="emphasis">*Example 1: Using ODS Briefcase*</span>

<div class="orderedlist">

1.  Go to your ods location, for ex. http://example.com/ods

2.  Register user, for ex. user test1

3.  Login if not already in ods

4.  Go to ODS -\> Briefcase

5.  Go to ODS -\> Briefcase

6.  Click the "New folder" icon from the Main Briefcase horizontal
    navigation

7.  Enter for name for ex. "mytest" and click the "Create" button.

    <div class="figure-float">

    <div id="uc6" class="figure">

    **Figure 16.81. Using Briefcase UI**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Briefcase UI](images/ui/uc6.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Go to folder "mytest" and click the click the "Upload" icon from the
    Main Briefcase horizontal navigation

9.  Enter for name for ex. "mytest" and click the "Create" button.

    <div class="figure-float">

    <div id="uc7" class="figure">

    **Figure 16.82. Using Briefcase UI**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Briefcase UI](images/ui/uc7.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the shown form set:

    <div class="itemizedlist">

    - Destination: RDF Store

    - RDF graph name for ex. with the value:
      http://example.com/DAV/home/test2/mytest/

    - Select URL or File. For ex. you can select the following file with
      name jose.rdf:

      ``` programlisting
      <rdf:RDF xmlns="http://www.example/jose/foaf.rdf#"
          xmlns:foaf="http://xmlns.com/foaf/0.1/"
          xmlns:log="http://www.w3.org/2000/10/swap/log#"
          xmlns:myfoaf="http://www.example/jose/foaf.rdf#"
          xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

          <foaf:Person rdf:about="http://www.example/jose/foaf.rdf#jose">
              <foaf:homepage rdf:resource="http://www.example/jose/"/>
              <foaf:knows rdf:resource="http://www.example/jose/foaf.rdf#juan"/>
              <foaf:name>Jose Jimen~ez</foaf:name>
              <foaf:nick>Jo</foaf:nick>
              <foaf:workplaceHomepage rdf:resource="http://www.corp.example/"/>
          </foaf:Person>

          <foaf:Person rdf:about="http://www.example/jose/foaf.rdf#juan">
              <foaf:mbox rdf:resource="mailto:juan@mail.example"/>
          </foaf:Person>

          <foaf:Person rdf:about="http://www.example/jose/foaf.rdf#julia">
              <foaf:mbox rdf:resource="mailto:julia@mail.example"/>
          </foaf:Person>

          <rdf:Description rdf:about="http://www.example/jose/foaf.rdf#kendall">

              <foaf:knows rdf:resource="http://www.example/jose/foaf.rdf#edd"/>
          </rdf:Description>
      </rdf:RDF>
      ```

    </div>

11. You can also perform the steps from above by uploading the file in
    the rdf_sink folder i.e. in Briefcase it will be with this path:
    DAV/home/test2/rdf_sink and respectively the "RDF graph name" will
    have this value: http://host:port/DAV/home/username/rdf_sink/

</div>

Execute from ISQL or from the SPARQL endpoint the following query:

``` programlisting
SELECT * FROM <http://example.com/DAV/home/test2/mytest/>
WHERE {?s ?p ?o}
```

As result should be shown:

``` programlisting
s                                     p                                                 o
http://www.example/jose/foaf.rdf#jose     http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Person
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/nick                Jo
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/name                Jose Jimen~ez
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/knows               http://www.example/jose/foaf.rdf#juan
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/homepage                http://www.example/jose/
http://www.example/jose/foaf.rdf#jose     http://xmlns.com/foaf/0.1/workplaceHomepage       http://www.corp.example/
http://www.example/jose/foaf.rdf#kendall  http://xmlns.com/foaf/0.1/knows               http://www.example/jose/foaf.rdf#edd
http://www.example/jose/foaf.rdf#julia    http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Person
http://www.example/jose/foaf.rdf#julia    http://xmlns.com/foaf/0.1/mbox                mailto:julia@mail.example
http://www.example/jose/foaf.rdf#juan     http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://xmlns.com/foaf/0.1/Person
http://www.example/jose/foaf.rdf#juan     http://xmlns.com/foaf/0.1/mbox                mailto:juan@mail.example
```

<span class="emphasis">*Example 2: Using Conductor UI*</span>

<div class="orderedlist">

1.  Go to Conductor UI, for ex. at http://example.com/conductor

2.  Login as dba user

3.  Go to Linked Data -\> Quad Store Upload

    <div class="figure-float">

    <div id="uc1" class="figure">

    **Figure 16.83. Quad Store Upload**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Quad Store Upload](images/ui/uc1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the shown form click the "Browse" button in order to select a
    file, for ex. the file jose.rdf and set the "RDF IRI\*"

    <div class="figure-float">

    <div id="uc2" class="figure">

    **Figure 16.84. Quad Store Upload**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Quad Store Upload](images/ui/uc2.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the "Upload" button.

    <div class="figure-float">

    <div id="uc3" class="figure">

    **Figure 16.85. Quad Store Upload**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Quad Store Upload](images/ui/uc3.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

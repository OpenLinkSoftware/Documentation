<div>

<div>

<div>

<div>

### 16.11.4. Post Installation

</div>

</div>

</div>

<div>

1.  Build Full Text Indexes by running the following commands using the
    Virtuoso

    <span class="emphasis">*isql*</span>

    program:

    ``` programlisting
    RDF_OBJ_FT_RULE_ADD (null, null, 'All');
    VT_INC_INDEX_DB_DBA_RDF_OBJ ();
    ```

2.  Run the following procedure using the Virtuoso

    <span class="emphasis">*isql*</span>

    program to populate label lookup tables periodically and activate
    the

    <span class="emphasis">*Label*</span>

    text box of the

    <span class="emphasis">*Entity Label Lookup*</span>

    tab:

    ``` programlisting
    urilbl_ac_init_db()
    ```

3.  Run the following procedure using the Virtuoso

    <span class="emphasis">*isql*</span>

    program to calculate the IRI ranks. Note this should be run
    periodically as the data grows to re-rank the IRIs.

    ``` programlisting
    s_rank()
    ```

4.  Perform Network Resource Fetch of some data to load some RDF triples
    in the quad store. This can easily be done using the Virtuoso

    <span class="emphasis">*description.vsp*</span>

    page which provides a hypertext description of RDF Linked Data, by
    describing the following page for example (or one of your choice):

    ``` programlisting
    http://cname/about/html/http/news.cnet.com
    ```

    <div>

    <div>

    **Figure 16.117. Network Resource Fetch data**

    <div>

    <div>

    ![Network Resource Fetch data](images/ui/fb3.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.118. Network Resource Fetch data**

    <div>

    <div>

    ![Network Resource Fetch data](images/ui/fb4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Use the Faceted Browser Search and Find User Interface to search for
    information on "CNET":

    <div>

    <div>

    **Figure 16.119. Faceted Browser Search**

    <div>

    <div>

    ![Faceted Browser Search](images/ui/fb5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Results of the following form should be returned for the network
    resource data being fetched.

    <div>

    <div>

    **Figure 16.120. Faceted Browser Search Results**

    <div>

    <div>

    ![Faceted Browser Search Results](images/ui/fb6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click "Types" link shown at the right vertical Navigation

8.  Results of the classes/properties should be returned:

    <div>

    <div>

    **Figure 16.121. Results of the classes/properties**

    <div>

    <div>

    ![Results of the classes/properties](images/ui/fb7.png)

    </div>

    </div>

    </div>

      

    </div>

9.  To get Type description, click "Describe" link for a given type, for
    ex. "Person".

10. A list of attributes and values should be presented for the given
    resource. Note that automatically is generated QRCode image for the
    described entity.

    <div>

    <div>

    **Figure 16.122. Results of the classes/properties**

    <div>

    <div>

    ![Results of the classes/properties](images/ui/fb8.png)

    </div>

    </div>

    </div>

      

    </div>

11. Return back to the Attributes list from above by going to the
    "Facets" tab.

12. To exclude a type, un-tick the checkbox associated with the type:

    <div>

    <div>

    **Figure 16.123. Exclude Type(s)**

    <div>

    <div>

    ![Exclude Type(s)](images/ui/fb9.png)

    </div>

    </div>

    </div>

      

    </div>

13. Click the Type URI link

14. Results of excluding the Type(s) should be shown:

    <div>

    <div>

    **Figure 16.124. Results of Excluded Type(s)**

    <div>

    <div>

    ![Results of Excluded Type(s)](images/ui/fb10.png)

    </div>

    </div>

    </div>

      

    </div>

15. The Faceted Browser Web service endpoint can also be queried to
    obtain the same results:

    ``` programlisting
    $ more cnet.xml
    <?xml version="1.0"?>
    <query xmlns="http://openlinksw.com/services/facets/1.0" inference="" same-as="">
      <text>CNET</text>
      <view type="text" limit="20" offset=""/>
    </query>

    $ curl -H "Content-Type: text/xml" -d @cnet.xml  http://cname/fct/service
    <fct:facets xmlns:fct="http://openlinksw.com/services/facets/1.0/">
    <fct:sparql>    SELECT ?s1 as ?c1, (bif:search_excerpt (bif:vector ('CNET'), ?o1)) as ?c2, ?sc, ?rank WHERE {{{ SELECT ?s1, (?sc * 3e-1) as ?sc, ?o1, (sql:rnk_scale (<LONG::IRI_RANK> (?s1))) as ?rank  WHERE { ?s1 ?s1textp ?o1 . ?o1 bif:contains  '"CNET"'  option (score ?sc)  . } ORDER BY DESC (?sc * 3e-1 + sql:rnk_scale (<LONG::IRI_RANK> (?s1)))  LIMIT 20  OFFSET 0 }}}</fct:sparql>
    <fct:time>16</fct:time>
    <fct:complete>yes</fct:complete>
    <fct:timeout>0</fct:timeout>
    <fct:db-activity>   131R rnd     36R seq      0P disk      0B /      0 messages</fct:db-activity>
     <fct:result type="text">
      <fct:row>
        <fct:column datatype="trank">4.5</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.com">http://news.com</fct:column>
        <fct:column>Technology News - CNET News</fct:column>
        <fct:column><span class="srch_xerpt"><b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">4.5</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com/2547-1_3-0-20.xml">http://news.cnet.com/2547-1_3-0-20.xml</fct:column>
        <fct:column>CNET News.com</fct:column>
        <fct:column><span class="srch_xerpt"><b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">4.5</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com">http://news.cnet.com</fct:column>
        <fct:column>Technology News - CNET News</fct:column>
        <fct:column><span class="srch_xerpt"><b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3.9</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.com">http://news.com</fct:column>
        <fct:column>Technology News - CNET News</fct:column>
        <fct:column><span class="srch_xerpt">Technology News <b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3.9</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com">http://news.cnet.com</fct:column>
        <fct:column>Technology News - CNET News</fct:column>
        <fct:column><span class="srch_xerpt">Technology News <b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.com">http://news.com</fct:column>
        <fct:column>Technology News - CNET News</fct:column>
        <fct:column><span class="srch_xerpt">Tech news and business reports by <b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com/2547-1_3-0-20.xml">http://news.cnet.com/2547-1_3-0-20.xml</fct:column>
        <fct:column>CNET News.com</fct:column>
        <fct:column><span class="srch_xerpt">Tech news and business reports by <b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com">http://news.cnet.com</fct:column>
        <fct:column>Technology News - CNET News</fct:column>
        <fct:column><span class="srch_xerpt">Tech news and business reports by <b>CNET</b> News.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.com#6">http://news.com#6</fct:column>
        <fct:column>There's an electric car in your future</fct:column>
        <fct:column><span class="srch_xerpt">... <b>CNET</b> Car Tech posts photos of electric cars expected to come out by 2011.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com/2547-1_3-0-20.xml#9">http://news.cnet.com/2547-1_3-0-20.xml#9</fct:column>
        <fct:column>There's an electric car in your future</fct:column>
        <fct:column><span class="srch_xerpt">... <b>CNET</b> Car Tech posts photos of electric cars expected to come out by 2011.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com#9">http://news.cnet.com#9</fct:column>
        <fct:column>There's an electric car in your future</fct:column>
        <fct:column><span class="srch_xerpt">... <b>CNET</b> Car Tech posts photos of electric cars expected to come out by 2011.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.com#6">http://news.com#6</fct:column>
        <fct:column>There's an electric car in your future</fct:column>
        <fct:column><span class="srch_xerpt">... <b>CNET</b> Car Tech posts photos of electric cars expected to come out by 2011.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com/2547-1_3-0-20.xml#9">http://news.cnet.com/2547-1_3-0-20.xml#9</fct:column>
        <fct:column>There's an electric car in your future</fct:column>
        <fct:column><span class="srch_xerpt">... <b>CNET</b> Car Tech posts photos of electric cars expected to come out by 2011.</span></fct:column>
      </fct:row>
      <fct:row>
        <fct:column datatype="trank">3</fct:column>
        <fct:column datatype="erank">5.881291583872905e-014</fct:column>
        <fct:column datatype="url" shortform="http://news.cnet.com#9">http://news.cnet.com#9</fct:column>
        <fct:column>There's an electric car in your future</fct:column>
        <fct:column><span class="srch_xerpt">... <b>CNET</b> Car Tech posts photos of electric cars expected to come out by 2011.</span></fct:column>
      </fct:row>
     </fct:result>
    </fct:facets>
    ```

16. Click "New search" from the Entity Relations Navigation and go to
    "Entity Label Lookup" tab:

    <div>

    <div>

    **Figure 16.125. Query Faceted Browser Web service endpoint**

    <div>

    <div>

    ![Query Faceted Browser Web service endpoint](images/ui/fb11.png)

    </div>

    </div>

    </div>

      

    </div>

17. In the Label auto-complete text box of the Entity Label Lookup tab,
    enter the name of an rdfs label to be Described:

    <div>

    <div>

    **Figure 16.126. Select a URI from the list of available Labels**

    <div>

    <div>

    ![Select a URI from the list of available
    Labels](images/ui/fb12.png)

    </div>

    </div>

    </div>

      

    </div>

18. Select a URI from the list of available Labels to obtain a
    description of the URI:

    <div>

    <div>

    **Figure 16.127. Select a URI from the list of available Labels**

    <div>

    <div>

    ![Select a URI from the list of available
    Labels](images/ui/fb13.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.128. Select a URI from the list of available Labels**

    <div>

    <div>

    ![Select a URI from the list of available
    Labels](images/ui/fb14.png)

    </div>

    </div>

    </div>

      

    </div>

19. Click "Facets" and go to "Entity URI Lookup" tab:

    <div>

    <div>

    **Figure 16.129. Enter URI**

    <div>

    <div>

    ![Enter URI](images/ui/fb15.png)

    </div>

    </div>

    </div>

      

    </div>

20. In the URI auto-complete text box of the Entity URI Lookup tab enter
    the name URI to be Described:

    <div>

    <div>

    **Figure 16.130. Enter URI**

    <div>

    <div>

    ![Enter URI](images/ui/fb16.png)

    </div>

    </div>

    </div>

      

    </div>

21. Select a URI from the list of available Labels to obtain a
    description of the URI:

    <div>

    <div>

    **Figure 16.131. Obtain a description of the URI**

    <div>

    <div>

    ![Obtain a description of the URI](images/ui/fb17.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.132. Obtain a description of the URI**

    <div>

    <div>

    ![Obtain a description of the URI](images/ui/fb18.png)

    </div>

    </div>

    </div>

      

    </div>

22. If data is loaded into the quad store via DML functions (TTLP,
    RDF_LOAD_RDFXML etc.) the following procedure needs to run from

    <span class="emphasis">*isql*</span>

    to build the free text indexes required each time:

    ``` programlisting
    VT_INC_INDEX_DB_DBA_RDF_OBJ ()
    ```

</div>

</div>

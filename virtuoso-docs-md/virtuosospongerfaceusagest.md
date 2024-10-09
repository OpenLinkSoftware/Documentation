<div>

<div>

<div>

<div>

### 16.11.6. Usage Statistics

</div>

</div>

</div>

<div>

1.  Use the Faceted Browser Search and Find User Interface to search for
    information on "Michael Jackson":

    <div>

    <div>

    **Figure 16.138. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb24.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Results of the following form should be returned for the network
    resource data being fetched.

    <div>

    <div>

    **Figure 16.139. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb25.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click the "Types" link under "Entity Relations Navigation".

4.  Results about "Michael Jackson" as Type/Label/Count list should be
    displayed:

    <div>

    <div>

    **Figure 16.140. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb26.png)

    </div>

    </div>

    </div>

      

    </div>

5.  You can navigate amongst the search results pages by using the
    "Prev" and "Next" buttons. Click for ex. "Next":

    <div>

    <div>

    **Figure 16.141. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb27.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click a type link, for ex.:

    ``` programlisting
    http://dbpedia.org/class/yago/Artist109812338
    ```

7.  Should be shown type results and:

    ``` programlisting
    Displaying Ranked Entity Names and Text summaries where:

    Entity1 has any Attribute with Value "Michael Jackson" Drop.
    Entity1 is a yago:Artist109812338 . Drop
    ```

    <div>

    <div>

    **Figure 16.142. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb28.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click the link:

    ``` programlisting
    dbpedia:Michael_Jackson
    ```

9.  Results about "Michael Jackson" as Attribute/Value list should be
    presented:

    <div>

    <div>

    **Figure 16.143. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb29.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.144. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb30.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.145. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb31.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.146. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb32.png)

    </div>

    </div>

    </div>

      

    </div>

10. You can navigate amongst the search results pages by using the
    "First", "Prev", "Next" and "Last" buttons. Click for ex. "Last":

    <div>

    <div>

    **Figure 16.147. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb33.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 16.148. Usage Statistics**

    <div>

    <div>

    ![Usage Statistics](images/ui/fb34.png)

    </div>

    </div>

    </div>

      

    </div>

11. "Metadata" tab.

12. Results of usage statistics for "Michael Jackson" grouped in 4 tabs
    should be shown:

    <div>

    1.  Referenced by Graphs: shows how many times the URI is found as
        subject in the relevant graph(s):

        ``` programlisting
        SPARQL
        SELECT ?g count (*)
        where
          {
            graph ?g { <URI> ?p ?o }
          }
        group by ?g
        order by desc 2
        limit 20
        ```

        <div>

        <div>

        **Figure 16.149. Usage Statistics**

        <div>

        <div>

        ![Usage Statistics](images/ui/fb35.png)

        </div>

        </div>

        </div>

          

        </div>

    2.  Source Graphs: shows how many times the URI is found as object
        in the relevant graph(s):

        ``` programlisting
        SPARQL
        SELECT ?g count (*)
        where
          {
            graph ?g { ?s ?p <URI>  }
          }
        group by ?g
        order by desc 2
        limit 20
        ```

        <div>

        <div>

        **Figure 16.150. Usage Statistics**

        <div>

        <div>

        ![Usage Statistics](images/ui/fb36.png)

        </div>

        </div>

        </div>

          

        </div>

    3.  Direct co-references: shows results as subject and calculated
        rank, based on running transitive closure over owl:sameAs of the
        URI in subject or object:

        ``` programlisting
        SPARQL
        SELECT ?syn ( sql:rnk_scale (<LONG::IRI_RANK> (?syn)))
        where
          {
            { SELECT ?s ?syn
              where
               {
                 {?syn owl:sameAs ?s } union {?s owl:sameAs ?syn}
               }
            }
            option (transitive, t_distinct, t_min (0), T_in (?s), t_out (?syn)) . filter (!isliteral (?syn) &amp;&amp; ?s = <URI> )
          }
        order by desc 2
        limit 20
        ```

        <div>

        <div>

        **Figure 16.151. Usage Statistics**

        <div>

        <div>

        ![Usage Statistics](images/ui/fb37.png)

        </div>

        </div>

        </div>

          

        </div>

    4.  Indirect co-references: shows expanded results for objects
        concur with the URI by IFP:

        ``` programlisting
        SPARQL
        SELECT distinct ?syn ?p ?o (sql:rnk_scale (<LONG::IRI_RANK> (?syn)))
        where
          { <URI> ?p ?o .  filter (0 != (<LONG::bif:rdf_is_sub> ("b3sifp", ?p, lod:ifp_like, 3))) .
            ?syn ?p ?o .
        }
        order by desc 4
        limit 20
        ```

        <div>

        <div>

        **Figure 16.152. Usage Statistics**

        <div>

        <div>

        ![Usage Statistics](images/ui/fb38.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

</div>

</div>

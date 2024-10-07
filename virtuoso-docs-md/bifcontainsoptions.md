<div id="bifcontainsoptions" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.51. What bif:contains free-text options can I use?

</div>

</div>

</div>

Virtuoso supports the following free-text options for bif:contains:

<div class="orderedlist">

1.  <span class="emphasis">*OFFBAND*</span>

    : See description for this free-text option in
    <a href="offbanddata.html" class="link" shape="rect"
    title="20.2.8. Using Offband Data for Faster Filtering">this section</a>
    .

    <div class="itemizedlist">

    - Note: it is useful only if data comers via an Linked Data View and
      the source relational table uses this trick;

    </div>

2.  <span class="emphasis">*SCORE*</span>

    : This free-text option is calculated as described in
    <a href="hitscores.html" class="link" shape="rect"
    title="20.2.6. Hit Scores">this section</a> :

    ``` programlisting
    SQL>SPARQL
    SELECT ?s1 as ?c1, ?sc, ?rank
    WHERE
      {
        {
          {
            SELECT ?s1, (?sc * 3e-1) as ?sc, ?o1,
              (sql:rnk_scale (<LONG::IRI_RANK> (?s1))) as ?rank
            WHERE
              {
                ?s1 ?s1textp ?o1 .
                ?o1 bif:contains  '"CNET"'  option (score ?sc)  .
              }
            ORDER BY DESC (?sc * 3e-1 + sql:rnk_scale (<LONG::IRI_RANK> (?s1)))
            LIMIT 20
            OFFSET 0
          }
        }
      };

    c1                                              sc      rank
    _________________________________________________________________________
    http://www.mixx.com/stories/45003360/justi...   3       5.881291583872891e-14
    http://www.mixx.com/stories/45099313/bing_...   2.7     5.881291583872891e-14
    http://dbpedia.org/resource/CBS_Interactive       1.5     5.881291583872891e-14
    http://dbpedia.org/resource/CBS_Interactive       1.5     5.881291583872891e-14

    4 Rows. -- 1 msec.
    ```

3.  <span class="emphasis">*SCORE_LIMIT*</span>

    : This free-text option works as it is in plain SQL free-text.
    <a href="queryingftcols.html" class="link" shape="rect"
    title="20.3. Querying Free Text Indexes">See more details</a> :

    ``` programlisting
    SQL> SPARQL
    SELECT ?s ?sc
    WHERE
      {
        ?s ?p ?o .
        ?o bif:contains "tree" OPTION (score ?sc , score_limit 20)
      };

    s                                                                      sc
    VARCHAR                                                                INTEGER
    ________________________________________________________________________________

    http://www.openlinksw.com/virtrdf-data-formats#default                 24
    http://www.openlinksw.com/virtrdf-data-formats#default                 24
    http://www.openlinksw.com/virtrdf-data-formats#sql-longvarbinary       21
    http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-dt          20
    http://www.openlinksw.com/virtrdf-data-formats#sql-nvarchar-dt         20
    http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-lang        20
    http://www.openlinksw.com/virtrdf-data-formats#sql-nvarchar-lang       20

    7 Rows. -- 2 msec.
    ```

</div>

</div>

<div>

<div>

<div>

<div>

### 1.5.30. What CXML params are supported for the SPARQL URL pattern?

</div>

</div>

</div>

The following options are supported for CXML link behavior in the SPARQL
URL Pattern:

<div>

1.  Local faceted navigation links:

    ``` programlisting
    # CXML_redir_for_subjs=&CXML_redir_for_hrefs=&:

    http://lod.openlinksw.com/sparql?default-graph-uri=&should-sponge=&query=SELECT+DISTINCT+%3Fcafe+%3Flat+%3Flong+%3Fcafename+%3Fchurchname++%28+bif%3Around%28bif%3Ast_distance+%28%3Fchurchgeo%2C+%3Fcafegeo%29%29+%29++WHERE++{++++%3Fchurch+a+lgv%3Aplace_of_worship+.++++%3Fchurch+geo%3Ageometry+%3Fchurchgeo+.++++%3Fchurch+lgv%3Aname+%3Fchurchname+.++++%3Fcafe+a+lgv%3Acafe+.++++%3Fcafe+lgv%3Aname+%3Fcafename+.++++%3Fcafe+geo%3Ageometry+%3Fcafegeo+.++++%3Fcafe+geo%3Alat+%3Flat+.++++%3Fcafe+geo%3Along+%3Flong+.++++FILTER+%28+bif%3Ast_intersects+%28%3Fchurchgeo%2C+bif%3Ast_point+%282.3498%2C48.853%29%2C5%29++%26%26+bif%3Ast_intersects+%28%3Fcafegeo%2C+%3Fchurchgeo%2C+0.2%29+%29+}+LIMIT+50&debug=on&timeout=&format=text%2Fhtml&CXML_redir_for_subjs=&CXML_redir_for_hrefs=&save=display&fname=
    ```

2.  External Resource Links:

    ``` programlisting
    # CXML_redir_for_subjs=&CXML_redir_for_hrefs=121:

    http://lod.openlinksw.com/sparql?default-graph-uri=&should-sponge=&query=SELECT+DISTINCT+%3Fcafe+%3Flat+%3Flong+%3Fcafename+%3Fchurchname++%28+bif%3Around%28bif%3Ast_distance+%28%3Fchurchgeo%2C+%3Fcafegeo%29%29+%29++WHERE++{++++%3Fchurch+a+lgv%3Aplace_of_worship+.++++%3Fchurch+geo%3Ageometry+%3Fchurchgeo+.++++%3Fchurch+lgv%3Aname+%3Fchurchname+.++++%3Fcafe+a+lgv%3Acafe+.++++%3Fcafe+lgv%3Aname+%3Fcafename+.++++%3Fcafe+geo%3Ageometry+%3Fcafegeo+.++++%3Fcafe+geo%3Alat+%3Flat+.++++%3Fcafe+geo%3Along+%3Flong+.++++FILTER+%28+bif%3Ast_intersects+%28%3Fchurchgeo%2C+bif%3Ast_point+%282.3498%2C48.853%29%2C5%29++%26%26+bif%3Ast_intersects+%28%3Fcafegeo%2C+%3Fchurchgeo%2C+0.2%29+%29+}+LIMIT+50&debug=on&timeout=&format=text%2Fhtml&CXML_redir_for_subjs=&CXML_redir_for_hrefs=121&save=display&fname=
    ```

3.  External faceted navigation links:

    ``` programlisting
    # CXML_redir_for_subjs=&CXML_redir_for_hrefs=LOCAL_PIVOT:

    http://lod.openlinksw.com/sparql?default-graph-uri=&should-sponge=&query=SELECT+DISTINCT+%3Fcafe+%3Flat+%3Flong+%3Fcafename+%3Fchurchname++%28+bif%3Around%28bif%3Ast_distance+%28%3Fchurchgeo%2C+%3Fcafegeo%29%29+%29++WHERE++{++++%3Fchurch+a+lgv%3Aplace_of_worship+.++++%3Fchurch+geo%3Ageometry+%3Fchurchgeo+.++++%3Fchurch+lgv%3Aname+%3Fchurchname+.++++%3Fcafe+a+lgv%3Acafe+.++++%3Fcafe+lgv%3Aname+%3Fcafename+.++++%3Fcafe+geo%3Ageometry+%3Fcafegeo+.++++%3Fcafe+geo%3Alat+%3Flat+.++++%3Fcafe+geo%3Along+%3Flong+.++++FILTER+%28+bif%3Ast_intersects+%28%3Fchurchgeo%2C+bif%3Ast_point+%282.3498%2C48.853%29%2C5%29++%26%26+bif%3Ast_intersects+%28%3Fcafegeo%2C+%3Fchurchgeo%2C+0.2%29+%29+}+LIMIT+50&debug=on&timeout=&format=text%2Fhtml&CXML_redir_for_subjs=&CXML_redir_for_hrefs=LOCAL_PIVOT&save=display&fname=
    ```

4.  External description resource(TTL):

    ``` programlisting
    # CXML_redir_for_subjs=&CXML_redir_for_hrefs=LOCAL_TTL:

    http://lod.openlinksw.com/sparql?default-graph-uri=&should-sponge=&query=SELECT+DISTINCT+%3Fcafe+%3Flat+%3Flong+%3Fcafename+%3Fchurchname++%28+bif%3Around%28bif%3Ast_distance+%28%3Fchurchgeo%2C+%3Fcafegeo%29%29+%29++WHERE++{++++%3Fchurch+a+lgv%3Aplace_of_worship+.++++%3Fchurch+geo%3Ageometry+%3Fchurchgeo+.++++%3Fchurch+lgv%3Aname+%3Fchurchname+.++++%3Fcafe+a+lgv%3Acafe+.++++%3Fcafe+lgv%3Aname+%3Fcafename+.++++%3Fcafe+geo%3Ageometry+%3Fcafegeo+.++++%3Fcafe+geo%3Alat+%3Flat+.++++%3Fcafe+geo%3Along+%3Flong+.++++FILTER+%28+bif%3Ast_intersects+%28%3Fchurchgeo%2C+bif%3Ast_point+%282.3498%2C48.853%29%2C5%29++%26%26+bif%3Ast_intersects+%28%3Fcafegeo%2C+%3Fchurchgeo%2C+0.2%29+%29+}+LIMIT+50&debug=on&timeout=&format=text%2Fhtml&CXML_redir_for_subjs=&CXML_redir_for_hrefs=LOCAL_TTL&save=display&fname=
    ```

5.  External description resource(CXML):

    ``` programlisting
    # CXML_redir_for_subjs=&CXML_redir_for_hrefs=LOCAL_CXML:

    http://lod.openlinksw.com/sparql?default-graph-uri=&should-sponge=&query=SELECT+DISTINCT+%3Fcafe+%3Flat+%3Flong+%3Fcafename+%3Fchurchname++%28+bif%3Around%28bif%3Ast_distance+%28%3Fchurchgeo%2C+%3Fcafegeo%29%29+%29++WHERE++{++++%3Fchurch+a+lgv%3Aplace_of_worship+.++++%3Fchurch+geo%3Ageometry+%3Fchurchgeo+.++++%3Fchurch+lgv%3Aname+%3Fchurchname+.++++%3Fcafe+a+lgv%3Acafe+.++++%3Fcafe+lgv%3Aname+%3Fcafename+.++++%3Fcafe+geo%3Ageometry+%3Fcafegeo+.++++%3Fcafe+geo%3Alat+%3Flat+.++++%3Fcafe+geo%3Along+%3Flong+.++++FILTER+%28+bif%3Ast_intersects+%28%3Fchurchgeo%2C+bif%3Ast_point+%282.3498%2C48.853%29%2C5%29++%26%26+bif%3Ast_intersects+%28%3Fcafegeo%2C+%3Fchurchgeo%2C+0.2%29+%29+}+LIMIT+50&debug=on&timeout=&format=text%2Fhtml&CXML_redir_for_subjs=&CXML_redir_for_hrefs=LOCAL_CXML&save=display&fname=
    ```

</div>

</div>

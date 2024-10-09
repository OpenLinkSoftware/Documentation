<div>

<div>

<div>

<div>

### 15.4.2. Using xpath_eval()

</div>

</div>

</div>

The `xpath_eval()` function is used to filter out parts of an XML
fragment that match a given XPATH expression. It can be used to retrieve
multiple-node answers to queries, as it is often the case that more than
one node-set matches. Consider the following statements that create a
table with XML stored inside.

``` programlisting
CREATE TABLE t_articles (
    article_id int NOT NULL,
    article_title varchar(255) NOT NULL,
    article_xml long varchar
    );

insert into t_articles (article_id, article_title) values (1, 'a');
insert into t_articles (article_id, article_title) values (2, 'b');

UPDATE t_articles SET article_xml = '
<beatles id = "b1">
<beatle instrument = "guitar" alive = "no">john lennon</beatle>
<beatle instrument = "guitar" alive = "no">george harrison</beatle>
</beatles>'
WHERE article_id = 1;

UPDATE t_articles SET article_xml = '
<beatles id = "b2">
<beatle instrument = "bass" alive = "yes">paul mccartney</beatle>
<beatle instrument = "drums" alive = "yes">ringo starr</beatle>
</beatles>'
WHERE article_id = 2;
```

Now we make a query that will return a vector of results, each vector
element corresponding to a node-set of the result.

``` programlisting
SELECT xpath_eval('//beatle/@instrument', xml_tree_doc (article_xml), 0)
    AS beatle_instrument FROM t_articles WHERE article_id = 2;
```

The repeating nodes are returned as part of a vector, the third argument
to `xpath_eval()` is set to 0, which means that it is to return all
nodes.

Otherwise, we can select the first node-set by supplying 1 as the third
parameter to `xpath_eval()` :

``` programlisting
SELECT xpath_eval('//beatle/@instrument', xml_tree_doc (article_xml), 1)
    AS beatle_instrument FROM t_articles WHERE article_id = 2;
```

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval()</code></a></p>
<p><a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval()</code></a></p>
<p><a href="fn_xmlupdate.html" class="link" title="XMLUpdate"><code
class="function">xmlupdate()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

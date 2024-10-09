<div>

<div>

<div>

<div>

### 16.9.11. Using SIMILE RDF Bank API

</div>

</div>

</div>

Virtuoso implements the HTTP-based Semantic Bank API that enables client
applications to post to its RDF Triple Store. This method offers an
alternative to using Virtuoso/PL functions or WebDAV uploads as the
triples-insertion mechanism.

<span class="emphasis">*Example:*</span>

From your machine go to Firefox-\>Tools-\>PiggyBank-\>My Semantic Bank
Accounts

Add in the shown form:

<div>

- For bank: address: http://demo.openlinksw.com/bank

- For account id: demo

- For password: demo

</div>

Go to http://demo.openlinksw.com/ods

Log in as user demo, password: demo

Go to the Weblog tab from the main ODS Navigation

Click on weblog instance name, for ex. "demo's Weblog".

When the weblog home page is loaded, click Alt + P.

As result is shown the "My PiggyBank" page with all the collected
information presented in items.

For several of the items add Tags from the form "Tag" shown for each of
them.

As result should be shown the message "Last updated: \[here goes the
date value\].

You can also click "Save" and "Publish" for these items.

Go to http://demo.openlinksw.com/sparql

Enter for the "Default Graph URI" field:
http://simile.org/piggybank/demo

Enter for the "Query text" text-area:

``` programlisting
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
prefix sioc: <http://rdfs.org/sioc/ns#>
SELECT *
FROM <http://simile.org/piggybank/demo>
WHERE {?s ?p  ?o}
```

Click "Run Query".

As results are shown the found results.

</div>

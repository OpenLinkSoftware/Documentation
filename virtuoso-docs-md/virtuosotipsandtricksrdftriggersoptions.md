<div>

<div>

<div>

<div>

### 1.5.5. What are "Generate RDB2RDF triggers" and "Enable Data Syncs with Physical Quad Store" Linked Data Views options?

</div>

</div>

</div>

These Linked Data Views options basically persist the triples in the
transient View Graph in the Native Quad Store. The Data Sync is how you
keep the transient views in sync with the persisted triples.

Without this capability you cannot exploit faceted browsing without
severe performance overhead when using Linked Data based conceptual
views over ODBC or JDBC accessible data sources.

Note: Using these options when the RFViews have already been created is
not currently possible via the Conductor UI. Instead you should be able
to add them manually from isql:

<div>

1.  Drop the Linked Data View graph and Quad Map.

2.  Create it again with the RDB2RDF Triggers options enabled.

</div>

<div>

|                            |                                                         |
|:--------------------------:|:--------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                               |
|                            | <a href="rdb2rdftriggers.html" class="link"             
                              title="16.17.17. RDB2RDF Triggers">RDB2RDF Triggers</a>  |

</div>

</div>

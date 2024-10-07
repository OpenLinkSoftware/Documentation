<div id="sqlrefgeospatialugcp" class="section">

<div class="titlepage">

<div>

<div>

### 9.34.8. Using Geometries in Client Applications and SQL Procedures

</div>

</div>

</div>

In SQL procedures, a geometry is a member of the ANY data type. The
<a href="fn_isgeometry.html" class="link" title="isgeometry"><code
class="function">isgeometry ()</code></a> function can be used for
testing if an object is a geometry. A geometry can only be stored in a
column declared to be of type ANY.

If a geometry would be returned to a client application as part of a
result set, it is returned as a string containing its WKT text
representation. For a client application to pass geometries to the
server, it must pass these either as a WKT string parameter to
st_geomfromtext or as numeric coordinate values for st_point or related
functions. This applies to all clients, ODBC, JDBC, .net and any RDF
frameworks.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                      |
|:--------------------------:|:-----------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                            |
|                            | <a href="rdfsparqlgeospat.html" class="link"         
                              title="16.15. RDF and Geometry">RDF and Geometry</a>  |

</div>

</div>

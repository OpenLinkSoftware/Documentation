<div>

<div>

<div>

<div>

### 9.5.2. UTF-8 Implementation Notes In JDBC

</div>

</div>

</div>

Since JAVA is all unicode there are no unavoidable deviations from the
JDBC standard. However when printing the Java strings to the screen or a
file or getting their byte representation, the usual JAVA conversion
rules apply. The types of the meta data result set columns in JDBC are
somewhat debatable, but since they are usually retrieved with
Resultset.getString() the Virtuoso JDBC driver will return the raw wide
string instead of trying to make it VARCHAR before returning it to the
application.

</div>

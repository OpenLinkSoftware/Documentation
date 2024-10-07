<div id="virtuosofaq24" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.24. Can the user be asynchronously notified when a long running query terminates?

</div>

</div>

</div>

There is no off-the-shelf API for this but making an adaptation of the
SPARQL endpoint that could proceed after the client disconnected and,
for example, could send results by email is trivial. Since SOAP and REST
Web services can be programmed directly in Virtuoso's stored procedure
language, implementing and exposing this type of application logic is
easy.

</div>

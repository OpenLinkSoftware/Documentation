<div id="virtuosofaq33" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.33. What is the time to start a database, create/open a graph?

</div>

</div>

</div>

Starting a Virtuoso server process takes a few seconds. Making a new
graph takes no time beyond the time to insert the triples into it. Once
the server process(es) are running, all the data is online.

With high-traffic applications, reaching cruising speed may sometimes
take a long time, specially if the load is random-access intensive.
Filling gigabytes of RAM with cached disk pages takes a long time if
done a page at a time. To alleviate this, Virtuoso pre-reads 2MB-sized
extents instead of single pages if there is repeated access to the same
extent within a short time. Thus cache warm-up times are shortened.

</div>


# Sponger Options

## Refreshing Sponger Graphs and Incremental Sponging

### Via the /about/html proxy

The parameters to request a graph refresh on /about/html/ are:

  * `@Lookup@`
    * Identifies the type of meta-cartridge lookups to perform.  When a value is not given, eg. `@Lookup@=&refresh=....` all the meta-cartridges work as they would without this parameter, i.e. all the enabled meta-cartridges are tried.
      *  0  : invoke only the NLP meta-cartridges
      * -2 : invoke only keywords-matching meta-cartridges
      * N,M... : A list of cartridge IDs identifying the meta-cartridges to be invoked. The unique cartridge IDs can be seen in Conductor.
    * The `@...@` syntax was chosen to distinguish between parameters for the Sponger and parameters belonging to the data source URL
  * `refresh`
    * **Note:** The `@Lookup@=` prefix must present in order for the `refresh=` option to be recognized.
    * This option takes the value `clean` or an explicit refresh interval in seconds
    * `@Lookup@=&refresh=clean`
      * Explicitly clears an existing graph before responging, by performing an internal `sparql clear graph <{graph-uri}>;`
      * If the Sponger cache (table `SYS_HTTP_SPONGE`) is left in an inconsistent state for some reason, for instance by a shutdown during a sponge, then `clean` is required as it forces the Sponger not to check cache state before sponging. 
    * `@Lookup@=&refresh=n`
      * when n = 0, this refresh option immediately refreshs a graph and overrides the default Sponger cache invalidation criteria (based on a cache expiry date/time calculated from information in the HTTP headers returned from a previous sponge of the target data source)
      * when n >= 1, this refresh option adds a `get:refresh "N"` directive to the internal Sponger call.

#### Sample URLs

  * To refresh the graph `<http://www.apple.com>` using all enabled cartridges of either type (extractor and meta cartridges) : 
    * `http://demo.openlinksw.com/about/html/http://www.apple.com/?@Lookup@=&refresh=0`
  * To execute only NLP meta extraction :
    * `http://demo.openlinksw.com/about/html/http://www.apple.com/?@Lookup@=0&refresh=0`
  * To execute only meta keywords based extraction :
    * `http://demo.openlinksw.com/about/html/http://www.apple.com/?@Lookup@=-2&refresh=0`
  * To execute only CNET(id=19) and LOD(id=21) meta cartridges : 
    * `http://demo.openlinksw.com/about/html/http://www.apple.com/?@Lookup@=19,21&refresh=0`

  * Clearing a graph before sponging
    * `http://linkeddata.uriburner.com/about/html/{URL}?@Lookup@=&refresh=clean`
    * `http://linkeddata.uriburner.com/about/html/{URL}?sponger:get=replace`

#### Incremental Sponging

In the absence of the `&refresh=clean` clause, the default Sponger behaviour is to add new triples to an existing graph. The Sponger option `sponger:get=add` is applied by default. However, it is possible to specify this option explicitly, or to specify a different value for `sponger:get`, e.g:

  * `http://demo.openlinksw.com/about/html/http://www.apple.com/?sponger:get=replacing&@Lookup@=&refresh=0`

The `sponger:get` option has the effect of setting the `get:soft` Sponger pragma used internally (see also http://docs.openlinksw.com/virtuoso/rdfiridereferencing.html ).
Supported values for `sponger:get` and the equivalent `get:soft` pragma are:

  * `replace` or `replacing`
    * when adding new triples, overwrite existing triples with the same subject and predicate
  * `add`
    * when adding new triples, do not overwrite existing triples with the same subject and predicate
  * `soft`
    * add triples only if the graph is initially empty

### Via the /describe service

The parameter to request a graph refresh on /describe is:

  * `sr`
    *  This option takes the value `clean` or an explicit refresh interval in seconds

#### Sample URLs

  * To perform an immediate refresh of graph `<http://www.apple.com>`:
    * `http://demo.openlinksw.com/describe/?url=http://www.apple.com&sponger:get=add&sr=0`
  * To clear and responge the graph:
    * `http://demo.openlinksw.com/describe/?url=http://www.apple.com&sponger:get=add&sr=clean`

#### Incremental Sponging

In the absence of the `&sr=clean` clause, the default Sponger behaviour is to add new triples to an existing graph. The Sponger option `sponger:get=add` is applied by default. However, it is possible to specify this option explicitly, or to specify a different value for `sponger:get`.
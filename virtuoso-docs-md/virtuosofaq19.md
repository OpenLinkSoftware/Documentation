<div>

<div>

<div>

<div>

### 1.4.19. Does Virtuoso support federated triple stores? If there are multiple SPARQL end points, can Virtuoso be used to do queries joining between these?

</div>

</div>

</div>

This is a planned extension. The logic for optimizing message flow
between multiple end-points on a wide-area network is similar to the
logic for message-optimization on a cluster. This will allow submitting
a query with a list of end-points. The query will then consider triples
from each of the end points, as if the content of all the end points
were in a single store.

End-point meta information, such as voiD descriptions of the graphs in
the end-points, may be used to avoid sending queries to end points that
are known not to have a certain type of data.

</div>

<div id="hitscores" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.6. Hit Scores

</div>

</div>

</div>

When a document satisfies a text search expression a score is computed
to reflect the closeness of the match. This is a positive integer, with
a higher value meaning a closer match. The scores are only comparable
between results of the same query against the same database. Moreover,
the scoring rules are different for different versions of Virtuoso
server, due to the progress in information retrieval theory. Thus the
only really safe thing to do with scores is to sort the list of hits by
descending score to produce more relevant hits first. In addition, the
CONTAINS predicate allows specifying a lower limit to the score of
produced hits so a smart application can reduce a number of retrieved
documents by filtering out the less relevant documents.

While the real scoring rules of the server are too sophisticated to be
listed here, the basic concept is simple: hits for restrictive terms are
most important than hits for generic terms, frequent hits in same
document are more important than occasional, hits that are probably
concentrated in same sentence are more important than hits here and
there in a long text:

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The score of a single word term is proportional to the frequency of the word in the document.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| The score of a phrase is proportional to both the frequency of the phrase in the document and the number of words in the phrase.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| The score of a proximity term 'A NEAR B' depends on the distance between A and B in words - greater distances result in smaller scores. E.g. the score is 100 for zero distance, 80 for 5 word distance, 50 for distance 10, 20 for distance 20; then it slowly decreases to 1 for distance 100. If the distance is 100 words or greater then the condition A NEAR B is considered not to be satisfied. If the A-B pair occurs several times throughout the document the scores of each pair are added. Virtuoso searches for shortest possible pairs, so if there is more than one word A around B then the nearest A is selected for scoring. |
| Score of a term like A AND B AND C... AND Z is a minimum of scores of A, B,... Z plus some bonuses. Longer list of AND'ed terms get higher score. A special bonus for term A AND B is added if hits of subterm A are close to the hits of subterm B.                                                                                                                                                                                                                                                                                                                                                                                            |
| Score of a term like A OR B OR C... OR Z is a maximum of scores of A, B,... Z, with some additional corrections. Longer list of OR'ed terms get lower score. A special bonus for term A OR B is added if hits of subterm A are close to the hits of subterm B.                                                                                                                                                                                                                                                                                                                                                                                  |
| Score of a term like A AND NOT B is equal to the score of subterm A. The subterm B is used for filtering out redundant hits but it does not affect the scoring.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

The XCONTAINS predicate can also return scores. These scores are
somewhat similar to scores made by CONTAINS but rules for them are too
complicated to be explained here.

</div>

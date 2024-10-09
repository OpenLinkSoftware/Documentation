<div>

<div>

<div>

<div>

## 16.2. SPARQL

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 16.2.1. SPARQL Implementation Details

</div>

</div>

</div>

Virtuoso's RDF support includes in-built support for the SPARQL query
language. It also includes a number of powerful extensions that cover
path traversal and business intelligence features. In addition, there is
in-built security based on Virtuoso's support for row level policy-based
security, custom authentication, and named graphs.

The current implementation does not support some SPARQL features:

<div>

- Unicode characters in names are not supported.

- Comments inside SPARQL queries are not supported when the query is
  inlined in SQL code.

</div>

On the other hand, Virtuoso implements some extensions to SPARQL:

<div>

- SPARUL statements, such as

  <span class="emphasis">*insert*</span> ,
  <span class="emphasis">*modify*</span> ,
  <span class="emphasis">*load*</span> etc, are supported.

- The SPARQL compiler can be configured using

  <span class="emphasis">*define ...*</span>

  clauses, e.g.

  <span class="emphasis">*define output:valmode "LONG"*</span>

  .

- Expressions are allowed in triple patterns, both in a

  <span class="emphasis">*where*</span>

  clause and in constructor patterns. Such expressions are delimited by
  backquotes.

- Expressions are allowed in select statement result lists.

- Parameters can be passed to the query from outside, using

  <span class="emphasis">*?:variablename*</span>

  syntax.

- Aggregate functions are supported.

- Subqueries may appear where group patterns are allowed.

- A set of operators has been added to configure the mapping of
  relational data to RDF (aka Linked Data Views).

</div>

The following listing shows the SPARQL grammar expressed in BNF,
including all Virtuoso extensions but excluding rules for the syntax of
each lexical element. Rule numbers in square brackets are from W3C
normative SPARQL grammar. An asterisk indicates that the rule differs
from the W3C grammar due to Virtuoso extensions -
<span class="emphasis">*\[Virt\]*</span> means that the rule is
Virtuoso-specific, <span class="emphasis">*\[DML\]*</span> indicates a
data manipulation language extension from SPARUL.

``` programlisting
[1]*    Query        ::=  Prolog ( QueryBody | SparulAction* | ( QmStmt ('.' QmStmt)* '.'? ) )
[1] QueryBody    ::=  SelectQuery | ConstructQuery | DescribeQuery | AskQuery
[2]*    Prolog       ::=  Define* BaseDecl? PrefixDecl*
[Virt]  Define       ::=  'DEFINE' QNAME (QNAME | Q_IRI_REF | String )
[3] BaseDecl     ::=  'BASE' Q_IRI_REF
[4] PrefixDecl   ::=  'PREFIX' QNAME_NS Q_IRI_REF
[5]*    SelectQuery  ::=  'SELECT' 'DISTINCT'? ( ( Retcol ( ','? Retcol )* ) | '*' )
            DatasetClause* WhereClause SolutionModifier
[6] ConstructQuery   ::=  'CONSTRUCT' ConstructTemplate DatasetClause* WhereClause SolutionModifier
            DatasetClause* WhereClause? SolutionModifier
[8] AskQuery     ::=  'ASK' DatasetClause* WhereClause
[9] DatasetClause    ::=  'FROM' ( DefaultGraphClause | NamedGraphClause )
[10]*   DefaultGraphClause   ::=  SourceSelector SpongeOptionList?
[11]*   NamedGraphClause     ::=  'NAMED' SourceSelector SpongeOptionList?
[Virt]  SpongeOptionList     ::=  'OPTION' '(' ( SpongeOption ( ',' SpongeOption )* )? ')'
[Virt]  SpongeOption     ::=  QNAME PrecodeExpn
[Virt]  PrecodeExpn  ::=  Expn  (* Only global variables can occur in Expn, local cannot *)
[13]    WhereClause  ::=  'WHERE'? GroupGraphPattern
[14]    SolutionModifier     ::=  OrderClause?
            ((LimitClause OffsetClause?) | (OffsetClause LimitClause?))?
[15]    OrderClause  ::=  'ORDER' 'BY' OrderCondition+
[16]*   OrderCondition   ::=  ( 'ASC' | 'DESC' )?
            ( FunctionCall | Var | ( '(' Expn ')' ) | ( '[' Expn ']' ) )
[17]    LimitClause  ::=  'LIMIT' INTEGER
[17]    LimitClause  ::=  'LIMIT' INTEGER
[18]    OffsetClause     ::=  'OFFSET' INTEGER
[18]    OffsetClause     ::=  'OFFSET' INTEGER
[19]*   GroupGraphPattern    ::=  '{' ( GraphPattern | SelectQuery ) '}'
[20]    GraphPattern     ::=  Triples? ( GraphPatternNotTriples '.'? GraphPattern )?
[21]*   GraphPatternNotTriples   ::=
            QuadMapGraphPattern
            | OptionalGraphPattern
            | GroupOrUnionGraphPattern
            | GraphGraphPattern
            | Constraint
[22]    OptionalGraphPattern     ::=  'OPTIONAL' GroupGraphPattern
[Virt]  QuadMapGraphPattern  ::=  'QUAD' 'MAP' ( IRIref | '*' ) GroupGraphPattern
[23]    GraphGraphPattern    ::=  'GRAPH' VarOrBlankNodeOrIRIref GroupGraphPattern
[24]    GroupOrUnionGraphPattern     ::=  GroupGraphPattern ( 'UNION' GroupGraphPattern )*
[25]*   Constraint   ::=  'FILTER' ( ( '(' Expn ')' ) | BuiltInCall | FunctionCall )
[26]*   ConstructTemplate    ::=  '{' ConstructTriples '}'
[27]    ConstructTriples     ::=  ( Triples1 ( '.' ConstructTriples )? )?
[28]    Triples      ::=  Triples1 ( '.' Triples? )?
[29]    Triples1     ::=  VarOrTerm PropertyListNotEmpty | TriplesNode PropertyList
[30]    PropertyList     ::=  PropertyListNotEmpty?
[31]    PropertyListNotEmpty     ::=  Verb ObjectList ( ';' PropertyList )?
[32]*   ObjectList   ::=  ObjGraphNode ( ',' ObjectList )?
[Virt]  ObjGraphNode     ::=  GraphNode TripleOptions?
[Virt]  TripleOptions    ::=  'OPTION' '(' TripleOption ( ',' TripleOption )? ')'
[Virt]  TripleOption     ::=  'INFERENCE' ( QNAME | Q_IRI_REF | SPARQL_STRING )
[33]    Verb         ::=  VarOrBlankNodeOrIRIref | 'a'
[34]    TriplesNode  ::=  Collection | BlankNodePropertyList
[35]    BlankNodePropertyList    ::=  '[' PropertyListNotEmpty ']'
[36]    Collection   ::=  '(' GraphNode* ')'
[37]    GraphNode    ::=  VarOrTerm | TriplesNode
[38]    VarOrTerm    ::=  Var | GraphTerm
[39]*   VarOrIRIrefOrBackquoted  ::=  Var | IRIref | Backquoted
[40]*   VarOrBlankNodeOrIRIrefOrBackquoted   ::=  Var | BlankNode | IRIref | Backquoted
[Virt]  Retcol   ::=  ( Var | ( '(' Expn ')' ) | RetAggCall ) ( 'AS' ( VAR1 | VAR2 ) )?
[Virt]  RetAggCall   ::=  AggName '(', ( '*' | ( 'DISTINCT'? Var ) ) ')'
[Virt]  AggName  ::=  'COUNT' | 'AVG' | 'MIN' | 'MAX' | 'SUM'
[41]*   Var  ::=  VAR1 | VAR2 | GlobalVar | ( Var ( '+>' | '*>' ) IRIref )
[Virt]  GlobalVar    ::=  QUEST_COLON_PARAMNAME | DOLLAR_COLON_PARAMNAME
            | QUEST_COLON_PARAMNUM | DOLLAR_COLON_PARAMNUM
[42]*   GraphTerm    ::=  IRIref | RDFLiteral | ( '-' | '+' )? NumericLiteral
            | BooleanLiteral | BlankNode | NIL | Backquoted
[Virt]  Backquoted   ::=  '`' Expn '`'
[43]    Expn         ::=  ConditionalOrExpn
[44]    ConditionalOrExpn    ::=  ConditionalAndExpn ( '||' ConditionalAndExpn )*
[45]    ConditionalAndExpn   ::=  ValueLogical ( '&&' ValueLogical )*
[46]    ValueLogical     ::=  RelationalExpn
[47]*   RelationalExpn   ::=  NumericExpn
            ( ( ('='|'!='|'<'|'>'|'<='|'>='|'LIKE') NumericExpn )
            | ( 'IN' '(' Expns ')' ) )?
[49]    AdditiveExpn     ::=  MultiplicativeExpn ( ('+'|'-') MultiplicativeExpn )*
[50]    MultiplicativeExpn   ::=  UnaryExpn ( ('*'|'/') UnaryExpn )*
[51]    UnaryExpn    ::=   ('!'|'+'|'-')? PrimaryExpn
[58]    PrimaryExpn  ::=
            BracketedExpn | BuiltInCall | IRIrefOrFunction
            | RDFLiteral | NumericLiteral | BooleanLiteral | BlankNode | Var
[55]    IRIrefOrFunction     ::=  IRIref ArgList?
[52]*   BuiltInCall  ::=
            ( 'STR' '(' Expn ')' )
            | ( 'IRI' '(' Expn ')' )
            | ( 'LANG' '(' Expn ')' )
            | ( 'LANGMATCHES' '(' Expn ',' Expn ')' )
            | ( 'DATATYPE' '(' Expn ')' )
            | ( 'BOUND' '(' Var ')' )
            | ( 'sameTERM' '(' Expn ',' Expn ')' )
            | ( 'isIRI' '(' Expn ')' )
            | ( 'isURI' '(' Expn ')' )
            | ( 'isBLANK' '(' Expn ')' )
            | ( 'isLITERAL' '(' Expn ')' )
            | RegexExpn
[53]    RegexExpn    ::=  'REGEX' '(' Expn ',' Expn ( ',' Expn )? ')'
[54]    FunctionCall     ::=  IRIref ArgList
[56]*   ArgList  ::=  ( NIL | '(' Expns ')' )
[Virt]  Expns    ::=  Expn ( ',' Expn )*
[59]    NumericLiteral   ::=  INTEGER | DECIMAL | DOUBLE
[60]    RDFLiteral   ::=  String ( LANGTAG | ( '^^' IRIref ) )?
[61]    BooleanLiteral   ::=  'true' | 'false'
[63]    IRIref       ::=  Q_IRI_REF | QName
[64]    QName        ::=  QNAME | QNAME_NS
[65]*   BlankNode    ::=  BLANK_NODE_LABEL | ( '[' ']' )
[DML]   SparulAction     ::=
            CreateAction | DropAction | LoadAction
            | InsertAction | InsertDataAction | DeleteAction | DeleteDataAction
            | ModifyAction | ClearAction
[DML]*  InsertAction     ::=
            'INSERT' ( ( 'IN' | 'INTO ) 'GRAPH' ( 'IDENTIFIED' 'BY' )? )? PrecodeExpn
            ConstructTemplate ( DatasetClause* WhereClause SolutionModifier )?
[DML]*  InsertDataAction     ::=
            'INSERT' 'DATA' ( ( 'IN' | 'INTO ) 'GRAPH' ( 'IDENTIFIED' 'BY' )? )?
            PrecodeExpn ConstructTemplate
[DML]*  DeleteAction     ::=
            'DELETE' ( 'FROM' 'GRAPH' ( 'IDENTIFIED' 'BY' )? )? PrecodeExpn
            ConstructTemplate ( DatasetClause* WhereClause SolutionModifier )?
[DML]*  DeleteDataAction     ::=
            'DELETE' 'DATA' ( 'FROM' 'GRAPH' ( 'IDENTIFIED' 'BY' )? )?
            PrecodeExpn ConstructTemplate
[DML]*  ModifyAction     ::=
            'MODIFY' ( 'GRAPH' ( 'IDENTIFIED' 'BY' )? PrecodeExpn?
            'DELETE' ConstructTemplate 'INSERT' ConstructTemplate
            ( DatasetClause* WhereClause SolutionModifier )?
[DML]*  ClearAction  ::=  'CLEAR' ( 'GRAPH' ( 'IDENTIFIED' 'BY' )? PrecodeExpn )?
[DML]*  LoadAction   ::=  'LOAD' PrecodeExpn
            ( ( 'IN' | 'INTO' ) 'GRAPH' ( 'IDENTIFIED' 'BY' )? PrecodeExpn )?
[DML]*  CreateAction     ::=  'CREATE' 'SILENT'? 'GRAPH' ( 'IDENTIFIED' 'BY' )? PrecodeExpn
[DML]*  DropAction   ::=  'DROP' 'SILENT'? 'GRAPH' ( 'IDENTIFIED' 'BY' )? PrecodeExpn
[Virt]  QmStmt       ::=  QmSimpleStmt | QmCreateStorage | QmAlterStorage
[Virt]  QmSimpleStmt     ::=
            QmCreateIRIClass | QmCreateLiteralClass | QmDropIRIClass | QmDropLiteralClass
            | QmCreateIRISubclass | QmDropQuadStorage | QmDropQuadMap
[Virt]  QmCreateIRIClass     ::=  'CREATE' 'IRI' 'CLASS' QmIRIrefConst
            ( ( String QmSqlfuncArglist )
            | ( 'USING' QmSqlfuncHeader ',' QmSqlfuncHeader ) )
[Virt]  QmCreateLiteralClass     ::=  'CREATE' 'LITERAL' 'CLASS' QmIRIrefConst
            'USING' QmSqlfuncHeader ',' QmSqlfuncHeader QmLiteralClassOptions?
[Virt]  QmDropIRIClass   ::=  'DROP' 'IRI' 'CLASS' QmIRIrefConst
[Virt]  QmDropLiteralClass   ::=  'DROP' 'LITERAL' 'CLASS' QmIRIrefConst
[Virt]  QmCreateIRISubclass  ::=  'IRI' 'CLASS' QmIRIrefConst 'SUBCLASS' 'OF' QmIRIrefConst
[Virt]  QmIRIClassOptions    ::=  'OPTION' '(' QmIRIClassOption (',' QmIRIClassOption)* ')'
[Virt]  QmIRIClassOption     ::=
            'BIJECTION'
            | 'DEREF'
            | 'RETURNS' STRING ('UNION' STRING)*
[Virt]  QmLiteralClassOptions    ::=  'OPTION' '(' QmLiteralClassOption (',' QmLiteralClassOption)* ')'
[Virt]  QmLiteralClassOption     ::=
            ( 'DATATYPE' QmIRIrefConst )
            | ( 'LANG' STRING )
            | ( 'LANG' STRING )
            | 'BIJECTION'
            | 'DEREF'
            | 'RETURNS' STRING ('UNION' STRING)*
[Virt]  QmCreateStorage  ::=  'CREATE' 'QUAD' 'STORAGE' QmIRIrefConst QmSourceDecl* QmMapTopGroup
[Virt]  QmAlterStorage   ::=  'ALTER' 'QUAD' 'STORAGE' QmIRIrefConst QmSourceDecl* QmMapTopGroup
[Virt]  QmDropStorage    ::=  'DROP' 'QUAD' 'STORAGE' QmIRIrefConst
[Virt]  QmDropQuadMap    ::=  'DROP' 'QUAD' 'MAP' 'GRAPH'? QmIRIrefConst
[Virt]  QmDrop   ::=  'DROP' 'GRAPH'? QmIRIrefConst
[Virt]  QmSourceDecl     ::=
            ( 'FROM' QTABLE 'AS' PLAIN_ID QmTextLiteral* )
            | ( 'FROM' PLAIN_ID 'AS' PLAIN_ID QmTextLiteral* )
            | QmCondition
[Virt]  QmTextLiteral    ::=  'TEXT' 'XML'? 'LITERAL' QmSqlCol ( 'OF' QmSqlCol )? QmTextLiteralOptions?
[Virt]  QmTextLiteralOptions     ::=  'OPTION' '(' QmTextLiteralOption ( ',' QmTextLiteralOption )* ')'
[Virt]  QmMapTopGroup    ::=  '{' QmMapTopOp ( '.' QmMapTopOp )* '.'? '}'
[Virt]  QmMapTopOp   ::=  QmMapOp | QmDropQuadMap | QmDrop
[Virt]  QmMapGroup   ::=  '{' QmMapOp ( '.' QmMapOp )* '.'? '}'
[Virt]  QmMapOp      ::=
            ( 'CREATE' QmIRIrefConst 'AS' QmMapIdDef )
            | ( 'CREATE' 'GRAPH'? QmIRIrefConst 'USING' 'STORAGE' QmIRIrefConst QmOptions? )
            | ( QmNamedField+ QmOptions? QmMapGroup )
            | QmTriples1
[Virt]  QmMapIdDef   ::=  QmMapTriple | ( QmNamedField+ QmOptions? QmMapGroup )
[Virt]  QmMapTriple  ::=  QmFieldOrBlank QmVerb QmObjField
[Virt]  QmTriples1   ::=  QmFieldOrBlank QmProps
[Virt]  QmNamedField     ::=  ('GRAPH'|'SUBJECT'|'PREDICATE'|'OBJECT') QmField
[Virt]  QmProps      ::=  QmProp ( ';' QmProp )?
[Virt]  QmProp       ::=  QmVerb QmObjField ( ',' QmObjField )*
[Virt]  QmObjField   ::=  QmFieldOrBlank QmCondition* QmOptions?
[Virt]  QmIdSuffix   ::=  'AS' QmIRIrefConst
[Virt]  QmVerb       ::=  QmField | ( '[' ']' ) | 'a'
[Virt]  QmFieldOrBlank   ::=  QmField | ( '[' ']' )
[Virt]  QmField      ::=
            NumericLiteral
            | RdfLiteral
            | ( QmIRIrefConst ( '(' ( QmSqlCol ( ',' QmSqlCol )* )? ')' )? )
            | QmSqlCol
[Virt]  QmCondition  ::=  'WHERE' ( ( '(' SQLTEXT ')' ) | String )
[Virt]  QmOptions    ::=  'OPTION' '(' QmOption ( ',' QmOption )* ')'
[Virt]  QmOption     ::=  ( 'SOFT'? 'EXCLUSIVE' ) | ( 'ORDER' INTEGER ) | ( 'USING' PLAIN_ID )
[Virt]  QmSqlfuncHeader  ::=  'FUNCTION' SQL_QTABLECOLNAME QmSqlfuncArglist 'RETURNS' QmSqltype
[Virt]  QmSqlfuncArglist     ::=  '(' ( QmSqlfuncArg ( ',' QmSqlfuncArg )* )? ')'
[Virt]  QmSqlfuncArg     ::=  ('IN' | QmSqlId) QmSqlId QmSqltype
[Virt]  QmSqltype    ::=  QmSqlId ( 'NOT' 'NULL' )?
[Virt]  QmSqlCol     ::=  QmSqlId | spar_qm_sql_id
[Virt]  QmSqlId      ::=  PLAIN_ID | 'TEXT' | 'XML'
[Virt]  QmIRIrefConst    ::=  IRIref | ( 'IRI' '(' String ')' )
```

<span class="emphasis">*Example: Using OFFSET and LIMIT*</span>

Virtuoso uses a zero-based index for OFFSET. Thus, in the example below,
the query returns 1000 rows starting from, and including, record 9001 of
the result set. Note that the default value of the MaxSortedTopRows
parameter in the \[Parameters\] section of the virtuoso.ini
configuration file defaults to 10000, so in this example its value will
need to have been increased beforehand.

``` programlisting
SQL>SELECT ?name
ORDER BY ?name
OFFSET 9000
LIMIT 1000
```

LIMIT applies to the solution resulting from the graph patterns
specified in the WHERE CLAUSE. This implies that SELECT and
CONSTRUCT/DESCRIBE queries will behave a little differently. In the case
of a SELECT, there is a straight translation i.e. LIMIT 4 implies 4
records in the result set. In the case of CONSTRUCTs where the solution
is a graph (implying that the existence of duplicates and/or unbound
variables is common) LIMIT is basically a maximum triples threshold of:
\[Solution Triples\] x \[LIMIT\].

Example query:

``` programlisting
SQL>SPARQL
prefix dct:<http://purl.org/dc/terms/>
prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#>

CONSTRUCT { ?resource dct:title ?title ;
                      a ?type }

FROM <http://msone.computas.no/graphs/inferred/classification>
FROM <http://msone.computas.no/graphs>
FROM <http://msone.computas.no/graphs/instance/nfi>
FROM <http://msone.computas.no/graphs/instance/mo>
FROM <http://msone.computas.no/graphs/ontology/mediasone>
FROM <http://msone.computas.no/graphs/vocab/mediasone>
FROM <http://msone.computas.no/graphs/inferred/nfi/realisation1>
FROM <http://msone.computas.no/graphs/inferred/mo/realisation1>
FROM <http://msone.computas.no/graphs/inferred/nfi/realisation2>
FROM <http://msone.computas.no/graphs/inferred/mo/realisation2>
FROM <http://msone.computas.no/graphs/inferred/agent-classification>
FROM <http://msone.computas.no/graphs/ontology/mediasone/agent>

WHERE {
  {
?resource a ?type .
  FILTER (?type = <http://www.w3.org/2002/07/owl#Class> ) .
  ?resource rdfs:label ?title .
  } UNION {
?resource a ?type .
  FILTER (?type in (
          <http://musicbrainz.org/mm/mm-2.1#Track> ,
          <http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB#Movie> ,
          <http://xmlns.com/foaf/0.1/Image> ,
          <http://www.computas.com/mediasone#Text> ) ) .
  ?resource dct:title ?title .
  }
  FILTER regex(?title, "turi", "i")
}
ORDER BY ?title LIMIT 4 OFFSET 0
```

<span class="emphasis">*Example: Prevent Limits of Sorted LIMIT/OFFSET
query*</span>

The DBpedia SPARQL endpoint is configured with the following INI
setting:

``` programlisting
MaxSortedTopRows = 40000
```

The setting above sets a threshold for sorted rows. Thus, when using
basic SPARQL queries that include OFFSET and LIMIT the following query
will still exist the hard limit set in the INI:

``` programlisting
DEFINE sql:big-data-const 0
SELECT DISTINCT  ?p ?s
FROM <http://dbpedia.org>
WHERE
  {
    ?s ?p <http://dbpedia.org/resource/Germany>
  }
ORDER BY ASC(?p)
OFFSET  40000
LIMIT   1000
```

returns the following error on execution:

``` programlisting
HttpException: 500 SPARQL Request Failed

Virtuoso 22023 Error SR353: Sorted TOP clause specifies more then 41000 rows to sort.
Only 40000 are allowed.
Either decrease the offset and/or row count or use a scrollable cursor
```

To prevent the problem outlined above you can leverage the use of
subqueries which make better use of temporary storage associated with
this kind of quest. An example would take the form:

``` programlisting
SELECT ?p ?s
WHERE
  {
    {
      SELECT DISTINCT ?p ?s
      FROM <http://dbpedia.org>
      WHERE
        {
          ?s ?p <http://dbpedia.org/resource/Germany>
        } ORDER BY ASC(?p)
    }
  }
OFFSET 50000
LIMIT 1000
```

<div>

<div>

<div>

<div>

#### SPARQL and XQuery Core Function Library

</div>

</div>

</div>

In the current implementation, the XQuery Core Function Library is not
available from SPARQL.

As a temporary workaround, string parsing functions are made available,
because they are widely used in W3C DAWG examples and the like. They
are:

``` programlisting
xsd:boolean (in strg any) returns integer
xsd:dateTime (in strg any) returns datetime
xsd:double (in strg varchar) returns double precision
xsd:float (in strg varchar) returns float
xsd:integer (in strg varchar) returns integer
```

(assuming that the query contains the declaration: 'PREFIX xsd:
\<http://www.w3.org/2001/XMLSchema#\>')

</div>

</div>

</div>

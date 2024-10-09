<div>

<div>

<div>

<div>

### 16.15.4. GEO Spatial Examples

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Example 1

</div>

</div>

</div>

``` programlisting
## Get All Stuff For Given Coordinates
SQL>SPARQL
SELECT ?c COUNT (*)
WHERE
   {
     ?m geo:geometry ?geo .
     ?m a ?c .
     FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 100))
   }
GROUP BY ?c
ORDER BY desc 2;

c                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://linkedgeodata.org/vocabulary#node                                          2317684
http://linkedgeodata.org/vocabulary#way                                           85315
http://linkedgeodata.org/vocabulary#building                                      14257
http://dbpedia.org/class/yago/Landmark108624891                                   9093
http://linkedgeodata.org/vocabulary#wood                                          7155
....
```

</div>

<div>

<div>

<div>

<div>

#### Example 2

</div>

</div>

</div>

``` programlisting
## Get City Stuff Around Catholic Churches In Paris
SQL>
SPARQL
SELECT ?m (bif:st_distance (?geo, bif:st_point (0, 52)))
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a <http://dbpedia.org/ontology/City> .
    FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 30))
  }
ORDER BY DESC 2
LIMIT 20;
m                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/Stansted_Mountfitchet                                 39.13180985471543
http://dbpedia.org/resource/Stansted_Mountfitchet                                 39.13180985471543
http://dbpedia.org/resource/Stansted_Mountfitchet                                 39.13180985471543
http://dbpedia.org/resource/Stansted_Mountfitchet                                 39.13180985471543
http://dbpedia.org/resource/Stansted_Mountfitchet                                 37.36907252285992
http://dbpedia.org/resource/Stansted_Mountfitchet                                 34.49432513061792
http://dbpedia.org/resource/Stansted_Mountfitchet                                 33.7676326404143
http://dbpedia.org/resource/Stansted_Mountfitchet                                 33.24238654570499
http://dbpedia.org/resource/Stansted_Mountfitchet                                 32.60139660515003
http://dbpedia.org/resource/Stansted_Mountfitchet                                 32.60139660515003
http://dbpedia.org/resource/Stansted_Mountfitchet                                 31.45681319171456
http://dbpedia.org/resource/Stansted_Mountfitchet                                 31.115377038
http://dbpedia.org/resource/Stansted_Mountfitchet                                 31.115377038
http://dbpedia.org/resource/Stansted_Mountfitchet                                 30.56388658524301
http://dbpedia.org/resource/Stansted_Mountfitchet                                 29.89662974046085
http://dbpedia.org/resource/Stansted_Mountfitchet                                 29.85090625132639
http://dbpedia.org/resource/Stansted_Mountfitchet                                 29.82605254366244
http://dbpedia.org/resource/Stansted_Mountfitchet                                 29.60102064794003
http://dbpedia.org/resource/Stansted_Mountfitchet                                 29.44147385851453
http://dbpedia.org/resource/Stansted_Mountfitchet                                 29.421242437379
```

</div>

<div>

<div>

<div>

<div>

#### Example 3

</div>

</div>

</div>

``` programlisting
## Get City Stuff Around Catholic Churches In Paris Extended
SQL>
SPARQL
SELECT ?m (bif:st_distance (?geo, bif:st_point (0, 52)))
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a <http://dbpedia.org/ontology/City> .
    FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 100))
  }
ORDER BY DESC 2
LIMIT 20;
m                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/Weston-on-Trent                                       138.7082197019335
http://dbpedia.org/resource/Weston-on-Trent                                       137.7213767969613
http://dbpedia.org/resource/Weston-on-Trent                                       136.4597167847218
http://dbpedia.org/resource/Weston-on-Trent                                       134.1807668663677
http://dbpedia.org/resource/Weston-on-Trent                                       133.104337839536
http://dbpedia.org/resource/Weston-on-Trent                                       133.104337839536
http://dbpedia.org/resource/Nonington                                             132.7368236183588
http://dbpedia.org/resource/Nonington                                             132.1339163200362
http://dbpedia.org/resource/Nonington                                             132.1339163200362
http://dbpedia.org/resource/Nonington                                             130.5478483560461
http://dbpedia.org/resource/Nonington                                             130.1620410981843
http://dbpedia.org/resource/Nonington                                             129.8549842943355
http://dbpedia.org/resource/Nonington                                             129.6459280567849
http://dbpedia.org/resource/Nonington                                             129.4504858595742
http://dbpedia.org/resource/Nonington                                             129.2790713235814
http://dbpedia.org/resource/Nonington                                             128.9081040147881
http://dbpedia.org/resource/Nonington                                             128.8845164618929
http://dbpedia.org/resource/Nonington                                             128.6676189617872
http://dbpedia.org/resource/Nonington                                             128.2565253458452
http://dbpedia.org/resource/Nonington                                             128.2551696344652

20 Rows. -- 120 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 4

</div>

</div>

</div>

``` programlisting
## Text Or Geo
SQL>
SPARQL
SELECT ?c COUNT (*)
WHERE
  {
    ?m geo:geometry ?geo .
    ?m a ?c .
    FILTER (bif:st_intersects (?geo, bif:st_point (0, 52), 100)  &&  REGEX (str (?c), "London") )
  }
GROUP BY ?c
ORDER BY DESC 2
LIMIT 10;

c                                                           callret-1
____________________________________________________________________________

http://dbpedia.org/class/yago/DistrictsOfLondon                 861
http://dbpedia.org/class/yago/GradeIListedBuildingsInLondon         199
http://dbpedia.org/class/yago/MuseumsInLondon                       107
http://dbpedia.org/class/yago/ArtMuseumsAndGalleriesInLondon        92
http://dbpedia.org/class/yago/GradeIIListedBuildingsInLondon        89
http://dbpedia.org/class/yago/SportsVenuesInLondon              80
http://dbpedia.org/class/yago/RoyalBuildingsInLondon                72
http://dbpedia.org/class/yago/LondonOvergroundStations              69
http://dbpedia.org/class/yago/NationalGovernmentBuildingsInLondon   69
http://dbpedia.org/class/yago/SkyscrapersInLondon               60
```

</div>

<div>

<div>

<div>

<div>

#### Example 5

</div>

</div>

</div>

``` programlisting
## Example "Places Of Worship, Within 5 km Of Paris":

## Describes places of worship, within 5 km of Paris,
## that have cafes in close proximity(0.2 km).
## The query requires V6 or higher.
SQL>
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
DESCRIBE ?cafe ?church
WHERE
  {
    ?church a lgv:place_of_worship .
    ?church geo:geometry ?churchgeo .
    ?church lgv:name ?churchname .
    ?cafe a lgv:cafe .
    ?cafe lgv:name ?cafename .
    ?cafe geo:geometry ?cafegeo .
    ?cafe geo:lat ?lat .
    ?cafe geo:long ?long .
    FILTER ( bif:st_intersects ( ?churchgeo, bif:st_point ( 2.3498, 48.853 ), 5 ) &&
             bif:st_intersects ( ?cafegeo, ?churchgeo, 0.2 ) )
  }
LIMIT 10;

@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <http://linkedgeodata.org/triplify/node/243360870#> .
@prefix ns2:    <http://linkedgeodata.org/vocabulary#> .
ns1:id  rdf:type    ns2:place_of_worship ,
        ns2:node .
@prefix geo:    <http://www.w3.org/2003/01/geo/wgs84_pos#> .
ns1:id  geo:lat 48.8794 ;
    geo:long    2.3748 ;
    ns2:created_by  "Potlatch 0.6c" ;
    ns2:name    "Saint-Georges de la Villette" ;
    ns2:religion    "christian" ,
        ns2:christian .
@prefix virtrdf:    <http://www.openlinksw.com/schemas/virtrdf#> .
ns1:id  geo:geometry    "POINT(2.3748 48.8794)"^^virtrdf:Geometry .
@prefix ns5:    <http://linkedgeodata.org/triplify/node/266632049#> .
ns5:id  rdf:type    ns2:node ,
        ns2:cafe ;
    geo:lat 48.8518 ;
    geo:long    2.325 ;
    ns2:created_by  "Potlatch 0.9a" ;
    ns2:name    "Le Babylone" ;
    geo:geometry    "POINT(2.325 48.8518)"^^virtrdf:Geometry .
....
```

</div>

<div>

<div>

<div>

<div>

#### Example 6

</div>

</div>

</div>

``` programlisting
## Count Geo
SQL>
SPARQL
SELECT ?c COUNT (*)
WHERE
   {
     ?s geo:geometry ?geo .
     FILTER (bif:st_intersects (?geo, bif:st_point (2.3498, 48.853), 5)) .
     ?s a ?c
   }
GROUP BY ?c
ORDER BY desc 2
LIMIT 10;

c                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://linkedgeodata.org/vocabulary#node                                          37792
http://dbpedia.org/class/yago/Landmark108624891                                   4003
http://linkedgeodata.org/vocabulary#way                                           1688
http://linkedgeodata.org/vocabulary#building                                      719
http://linkedgeodata.org/vocabulary#station                                       257
http://linkedgeodata.org/vocabulary#post_box                                      247
http://www.w3.org/2002/07/owl#Thing                                               227
http://linkedgeodata.org/vocabulary#park                                          208
http://linkedgeodata.org/vocabulary#restaurant                                    198
http://dbpedia.org/ontology/Place                                                 192

10 Rows. -- 932 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 7

</div>

</div>

</div>

``` programlisting
## Get Stuff Around Notre Dame De Paris
SQL>
SPARQL
SELECT ?c COUNT (*)
WHERE
  {
    ?s a ?c .
    ?s geo:geometry ?geo .
    FILTER (bif:st_intersects (?geo, bif:st_point (2.3498, 48.853), 0.3))
  }
GROUP BY ?c
ORDER BY desc 2
LIMIT 10;

c                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://linkedgeodata.org/vocabulary#node                                          408
http://dbpedia.org/class/yago/Landmark108624891                                   134
http://linkedgeodata.org/vocabulary#way                                           17
http://dbpedia.org/class/yago/RomanCatholicChurchesInParis                        17
http://dbpedia.org/class/yago/TallBuildingsAndStructuresInParis                   13
http://dbpedia.org/class/yago/CathedralsInFrance                                  13
http://sw.opencyc.org/2008/06/10/concept/Mx4rvVigPpwpEbGdrcN5Y29ycA               13
http://sw.opencyc.org/2008/06/10/concept/Mx4rjm5QanS6EdaAAACgyZzFrg               13
http://sw.opencyc.org/2008/06/10/concept/Mx4rwQwtGpwpEbGdrcN5Y29ycA               13
http://www.w3.org/2002/07/owl#Thing                                               10

10 Rows. -- 241 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 8

</div>

</div>

</div>

``` programlisting
## Things within 10 km proximity of place of worship
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
SELECT ?c COUNT (*)
WHERE
  {
    ?s a ?c .
    ?s a lgv:place_of_worship .
    ?s geo:geometry ?geo .
    FILTER (bif:st_intersects (?geo, bif:st_point (2.3498, 48.853), 10))
  }
GROUP BY ?c
ORDER BY desc 2
LIMIT 10;

c                                                                                 callret-1
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://linkedgeodata.org/vocabulary#place_of_worship                              147
http://linkedgeodata.org/vocabulary#node                                          146
http://linkedgeodata.org/vocabulary#way                                           46
http://linkedgeodata.org/vocabulary#building                                      36
http://linkedgeodata.org/vocabulary#attraction                                    3
http://linkedgeodata.org/vocabulary#church                                        1

6 Rows. -- 120 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 9

</div>

</div>

</div>

``` programlisting
## Get Stuff Around Notre Dame De Paris with Names
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
SELECT ?cn
WHERE
  {
    ?s lgv:name ?cn  .
    ?s geo:geometry ?geo .
    FILTER (bif:st_intersects (?geo, bif:st_point (2.3498, 48.853), 0.3))
  }
LIMIT 20;
cn
VARCHAR
_______________________________________________________________________________

Parking Lagrange
Maitre Albert B&B
Le Grenier de Notre Dame
Eglise Saint-Julien-le-Pauvre
Eglise Saint Julien le Pauvre
Polly Magoo
Point 0 des Routes de France
Square Jean XXIII
....
20 Rows. -- 140 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 10

</div>

</div>

</div>

``` programlisting
## Get Churches With The Most Bars
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
SELECT ?churchname ?cafename (bif:st_distance (?churchgeo, ?cafegeo))
WHERE
  {
    ?church a lgv:place_of_worship .
    ?church geo:geometry ?churchgeo .
    ?church lgv:name ?churchname .
    ?cafe a lgv:cafe .
    ?cafe lgv:name ?cafename .
    ?cafe geo:geometry ?cafegeo .
    FILTER (bif:st_intersects (?churchgeo, bif:st_point (2.3498, 48.853), 5)
      && bif:st_intersects (?cafegeo, ?churchgeo, 0.2))
  }
LIMIT 10;

churchname                            cafename                            callret-2
VARCHAR                               VARCHAR                             VARCHAR
_______________________________________________________________________________

Eglise Saint-Julien-le-Pauvre         Le Saint R+?-?gis                   0.09759308692691648
Eglise Saint-Germain des Pr+?-?s      Caf+?-? de Flore                    0.08774468391412803
Eglise Saint-Germain des Pr+?-?s      Les Deux Magots                     0.05235923473923059
Eglise Saint-Germain des Pr+?-?s      Caf+?-? Mabillon                    0.1712042770289815
Eglise Saint-Germain-des-Pr+?-?s      Caf+?-? de Flore                    0.1466502865197912
Eglise Saint-Germain-des-Pr+?-?s      Les Deux Magots                     0.1096767137079839
Eglise Saint-Germain-des-Pr+?-?s      Bar du march+?-?                    0.1831441251868126
Eglise Saint-Germain-des-Pr+?-?s      Caf+?-? Mabillon                    0.1174051745495528
Synagogue                             La Chaise au Plafond                0.1038387283609551
Synagogue                             Le Loir dans la Th+?-?i+?-?re       0.1632848322062273

10 Rows. -- 511225 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 11

</div>

</div>

</div>

``` programlisting
## Things around highly populated places
SQL>
SPARQL
SELECT ?s ( sql:num_or_null (?o) ) COUNT (*)
WHERE
  {
    ?s <http://dbpedia.org/ontology/populationTotal> ?o .
        FILTER ( sql:num_or_null (?o) > 6000000 ) .
    ?s geo:geometry ?geo .
        FILTER ( bif:st_intersects (?pt, ?geo,2) ) .
    ?xx geo:geometry ?pt
  }
GROUP BY ?s ( sql:num_or_null (?o) )
ORDER BY desc 3
LIMIT 20;

s                                                         callret-1        callret-2
VARCHAR                                                   VARCHAR          VARCHAR
_______________________________________________________________________________

http://dbpedia.org/resource/London                        7556900          312307
http://dbpedia.org/resource/Toronto                       8102163          115859
http://dbpedia.org/resource/New_York_City                 8363710          95629
http://dbpedia.org/resource/The_Hague                     6659300          84410
http://dbpedia.org/resource/Tokyo                         12790000         78618
http://dbpedia.org/resource/Philadelphia                  6385461          67115
http://dbpedia.org/resource/Los_Angeles                   17755322         64394
http://dbpedia.org/resource/Bangkok                       8160522          62519
http://dbpedia.org/resource/Barcelona                     2147483648       57635
http://dbpedia.org/resource/Cairo                         6758581          52738
http://dbpedia.org/resource/Istanbul                      12697164         50745
http://dbpedia.org/resource/Seoul                         10421782         43962
http://dbpedia.org/resource/Beijing                       17430000         35979
http://dbpedia.org/resource/Purmerend                     6659300          33508
http://dbpedia.org/resource/Baghdad                       6554126          33426
http://dbpedia.org/resource/Bogot%C3%A1                   6776009          30429
http://dbpedia.org/resource/Mexico_City                   8836045          30127
http://dbpedia.org/resource/Jakarta                       8500000          28944
http://dbpedia.org/resource/Boston                        7514759          27705
http://dbpedia.org/resource/Baden-W%C3%BCrttemberg        10755000         25112

20 Rows. -- 4296 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 12

</div>

</div>

</div>

``` programlisting
## Example "Places Of Worship, Within 5 km Of Paris":

## Constructs a custom Linked Data Mesh (graph) about
## places of worship, within 5 km of Paris, that have
## cafes in close proximity(0.2 km).

## Note: we have distinct pin colors that identify
## for places of worship distinct from cafes.

## The query requires V6 or higher.
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
PREFIX rtb: <http://www.openlinksw.com/schemas/oat/rdftabs#>
CONSTRUCT
  {
    ?cafe geo:geometry ?cafegeo        ;
                   rtb:useMarker '01'  ;
                  lgv:name ?cafename   .
    ?church geo:geometry ?churchgeo    ;
                   rtb:useMarker '02'  ;
                lgv:name ?churchname   .
  }
WHERE
  {
    ?church a lgv:place_of_worship .
    ?church geo:geometry ?churchgeo .
    ?church lgv:name ?churchname .
    ?cafe a lgv:cafe .
    ?cafe lgv:name ?cafename .
    ?cafe geo:geometry ?cafegeo .
    ?cafe geo:lat ?lat .
    ?cafe geo:long ?long .
    FILTER ( bif:st_intersects ( ?churchgeo, bif:st_point ( 2.3498, 48.853 ), 5 ) &&
             bif:st_intersects ( ?cafegeo, ?churchgeo, 0.2 ) )
  }
LIMIT 10;

@prefix ns0:    <http://linkedgeodata.org/vocabulary#> .
@prefix ns1:    <http://linkedgeodata.org/triplify/node/237435716#> .
ns1:id  ns0:name    "Chapelle du Val de Gr\u00C3\u00A2ce" .
@prefix ns2:    <http://www.openlinksw.com/schemas/oat/rdftabs#> .
ns1:id  ns2:useMarker   "02" .
@prefix virtrdf:    <http://www.openlinksw.com/schemas/virtrdf#> .
@prefix geo:    <http://www.w3.org/2003/01/geo/wgs84_pos#> .
ns1:id  geo:geometry    "POINT(2.3418 48.8406)"^^virtrdf:Geometry .
@prefix ns5:    <http://linkedgeodata.org/triplify/node/218147750#> .
ns5:id  ns0:name    "Synagogue" ;
    ns2:useMarker   "02" ;
    geo:geometry    "POINT(2.3593 48.857)"^^virtrdf:Geometry .
@prefix ns6:    <http://linkedgeodata.org/triplify/node/218145208#> .
ns6:id  ns0:name    "Synagogue" ;
    ns2:useMarker   "02" ;
    geo:geometry    "POINT(2.3589 48.8567)"^^virtrdf:Geometry .
...
```

</div>

<div>

<div>

<div>

<div>

#### Example 13

</div>

</div>

</div>

``` programlisting
## Example "Places Of Worship, Within 5 km Of Paris":

## Asks for places of worship, within 5 km of Paris,
## that have cafes in close proximity(0.2 km).
## The query requires V6 or higher.

SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
ASK
WHERE
  {
    ?church a lgv:place_of_worship .
    ?church geo:geometry ?churchgeo .
    ?church lgv:name ?churchname .
    ?cafe a lgv:cafe .
    ?cafe lgv:name ?cafename .
    ?cafe geo:geometry ?cafegeo .
    ?cafe geo:lat ?lat .
    ?cafe geo:long ?long .
    FILTER ( bif:st_intersects ( ?churchgeo, bif:st_point ( 2.3498, 48.853 ), 5 ) &&
             bif:st_intersects ( ?cafegeo, ?churchgeo, 0.2 ) )
  };

Done.

true
```

</div>

<div>

<div>

<div>

<div>

#### Example 14

</div>

</div>

</div>

``` programlisting
## Places of worship, within 5 km of Paris,
## that have cafes in close proximity(0.2 km)
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
SELECT DISTINCT ?cafe ?lat ?long ?cafename ?churchname
(bif:round(bif:st_distance (?churchgeo, ?cafegeo)))
WHERE
  {
    ?church a lgv:place_of_worship .
    ?church geo:geometry ?churchgeo .
    ?church lgv:name ?churchname .
    ?cafe a lgv:cafe .
    ?cafe lgv:name ?cafename .
    ?cafe geo:geometry ?cafegeo .
    ?cafe geo:lat ?lat.
    ?cafe geo:long ?long.
    FILTER ( bif:st_intersects (?churchgeo, bif:st_point (2.3498, 48.853), 5) &&
                   bif:st_intersects (?cafegeo, ?churchgeo, 0.2) )
  }
LIMIT 10;

cafe                                                 lat       long     cafename                           churchname                             callret-5
VARCHAR                                              VARCHAR   VARCHAR  VARCHAR                            VARCHAR                                VARCHAR
_______________________________________________________________________________________________________________________________________________________________

http://linkedgeodata.org/triplify/node/321932192#id  48.8522   2.3484   Le Saint R+?-?gis                  Eglise Saint-Julien-le-Pauvre          0
http://linkedgeodata.org/triplify/node/251699776#id  48.8541   2.3326   Caf+?-? de Flore                   Eglise Saint-Germain des Pr+?-?s       0
http://linkedgeodata.org/triplify/node/251699775#id  48.854    2.3331   Les Deux Magots                    Eglise Saint-Germain des Pr+?-?s       0
http://linkedgeodata.org/triplify/node/315769036#id  48.8533   2.3358   Caf+?-? Mabillon                   Eglise Saint-Germain des Pr+?-?s       0
http://linkedgeodata.org/triplify/node/251699776#id  48.8541   2.3326   Caf+?-? de Flore                   Eglise Saint-Germain-des-Pr+?-?s       0
http://linkedgeodata.org/triplify/node/251699775#id  48.854    2.3331   Les Deux Magots                    Eglise Saint-Germain-des-Pr+?-?s       0
http://linkedgeodata.org/triplify/node/315769035#id  48.8539   2.3371   Bar du march+?-?                   Eglise Saint-Germain-des-Pr+?-?s       0
http://linkedgeodata.org/triplify/node/315769036#id  48.8533   2.3358   Caf+?-? Mabillon                   Eglise Saint-Germain-des-Pr+?-?s       0
http://linkedgeodata.org/triplify/node/251126326#id  48.8572   2.3577   La Chaise au Plafond               Synagogue                              0
http://linkedgeodata.org/triplify/node/251043135#id  48.8562   2.361    Le Loir dans la Th+?-?i+?-?re      Synagogue                              0

10 Rows. -- 120 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 15

</div>

</div>

</div>

``` programlisting
## Stuff around Notre Dame de Paris
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
SELECT ?s ?cn ?lat ?long
WHERE
  {
    ?s lgv:name ?cn  .
    ?s geo:geometry ?geo .
    ?s geo:lat ?lat.
    ?s geo:long ?long.
    FILTER ( bif:st_intersects (?geo, bif:st_point (2.3498, 48.853), 0.3) )
  }
LIMIT 20;

s                                                      cn                                                        lat        long
VARCHAR                                                VARCHAR                                                   VARCHAR    VARCHAR
______________________________________________________________________________________________________________

http://linkedgeodata.org/triplify/node/237004656#id    Parking Lagrange                                          48.8506    2.3487
http://linkedgeodata.org/triplify/node/237003117#id    Mus+?-?e de l'Assistance Publique H+?-opitaux de Paris    48.8507    2.3519
http://linkedgeodata.org/triplify/way/23071565#id      Jardin de la Rue de Bi+?-?vre                             48.8504    2.3502
http://linkedgeodata.org/triplify/node/251652818#id    Maitre Albert B&B                                         48.8507    2.3496
http://linkedgeodata.org/triplify/node/251373384#id    Le Grenier de Notre Dame                                  48.8513    2.35
http://linkedgeodata.org/triplify/node/205266764#id    Eglise Saint-Julien-le-Pauvre                             48.852     2.3471
http://linkedgeodata.org/triplify/way/19741083#id      Eglise Saint Julien le Pauvre                             48.8521    2.3469
http://linkedgeodata.org/triplify/node/251474112#id    Polly Magoo                                               48.8526    2.3467
http://linkedgeodata.org/triplify/node/251531803#id    H+?-otel Esmerelda                                        48.8523    2.3468
http://linkedgeodata.org/triplify/node/191031796#id    Point 0 des Routes de France                              48.8533    2.3489
http://linkedgeodata.org/triplify/way/20444455#id      Square Jean XXIII                                         48.8529    2.3511
http://linkedgeodata.org/triplify/way/19740745#id      Square Ren+?-? Viviani                                    48.8525    2.3476
http://linkedgeodata.org/triplify/node/321932192#id    Le Saint R+?-?gis                                         48.8522    2.3484
http://linkedgeodata.org/triplify/node/27440965#id     Notre-Dame de Paris                                       48.853     2.3499
http://linkedgeodata.org/triplify/node/243461762#id    Parking Notre-Dame                                        48.8537    2.3475
http://linkedgeodata.org/triplify/way/21816758#id      Notre-Dame de Paris                                       48.8531    2.349
http://linkedgeodata.org/triplify/way/22972062#id      La Seine                                                  48.8538    2.3531
http://linkedgeodata.org/triplify/way/25463927#id      La Seine                                                  48.8548    2.3518
http://linkedgeodata.org/triplify/node/251128395#id    H+?-otel Hospitel                                         48.854     2.3484
http://linkedgeodata.org/triplify/way/14155323#id      H+?-otel Dieu                                             48.8555    2.3485

20 Rows. -- 167 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 16

</div>

</div>

</div>

``` programlisting
## Stuff around Notre Dame de Paris
SQL>
SPARQL
PREFIX lgv: <http://linkedgeodata.org/vocabulary#>
DESCRIBE ?s
WHERE
  {
    ?s lgv:name ?cn  .
    ?s geo:geometry ?geo .
    ?s geo:lat ?lat.
    ?s geo:long ?long.
    FILTER (bif:st_intersects (?geo, bif:st_point (2.3498, 48.853), 0.3))
  }
LIMIT 20;

@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <http://linkedgeodata.org/triplify/node/27440966#> .
@prefix ns2:    <http://linkedgeodata.org/vocabulary#> .
ns1:id  rdf:type    ns2:node ,
        ns2:police .
@prefix geo:    <http://www.w3.org/2003/01/geo/wgs84_pos#> .
ns1:id  geo:lat 48.8542 ;
    geo:long    2.3473 ;
    ns2:created_by  "Potlatch 0.6a" ;
    ns2:name    "Pr\u00C3\u00A9fecture de Police de Paris" ,
        "Pr\u00E9fecture de Police de Paris" .
@prefix virtrdf:    <http://www.openlinksw.com/schemas/virtrdf#> .
ns1:id  geo:geometry    "POINT(2.3473 48.8542)"^^virtrdf:Geometry .
@prefix ns5:    <http://linkedgeodata.org/triplify/node/27440965#> .
ns5:id  rdf:type    ns2:node ,
        ns2:place_of_worship ;
    geo:lat 48.853 ;
    geo:long    2.3499 ;
    ns2:denomination    "catholic" ;
    ns2:name    "Notre-Dame de Paris" ;
    ns2:religion    "christian" ,
        ns2:christian ;
    geo:geometry    "POINT(2.3499 48.853)"^^virtrdf:Geometry .

......
```

</div>

<div>

<div>

<div>

<div>

#### Example 17

</div>

</div>

</div>

``` programlisting
## Cities within 30 km proximity of London
SQL>
SPARQL
SELECT ?m (bif:round(bif:st_distance (?geo, ?gm)))
WHERE
  {
    <http://dbpedia.org/resource/London> geo:geometry ?gm .
    ?m geo:geometry ?geo .
    ?m a <http://dbpedia.org/ontology/City> .
    FILTER (bif:st_intersects (?geo, ?gm, 30))
  }
ORDER BY DESC 2
LIMIT 20;

m                                                   callret-1
VARCHAR                                             VARCHAR
____________________________________________________________

http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Ebbsfleet_Valley        30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30
http://dbpedia.org/resource/Bletchingley            30

20 Rows. -- 727666 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 18

</div>

</div>

</div>

``` programlisting
## Motorways across England & Scotland from DBpedia
SQL>
SPARQL
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbpprop: <http://dbpedia.org/property/>
PREFIX yago: <http://dbpedia.org/class/yago/>
SELECT ?road ?services ?lat ?long
WHERE
  {
    {
      ?services dbpprop:road ?road .
      ?road a yago:MotorwaysInEngland .
      ?services dbpprop:lat ?lat .
      ?services dbpprop:long ?long .
     }
    UNION
    {
      ?services dbpprop:road ?road .
      ?road a yago:MotorwaysInScotland .
      ?services dbpprop:lat ?lat .
      ?services dbpprop:long ?long .
     }
  }
LIMIT 20;

road                                          services                                                        lat             long
VARCHAR                                       VARCHAR                                                         VARCHAR         VARCHAR
______________________________________________________________________________________________________________________________________

http://dbpedia.org/resource/M90_motorway      http://dbpedia.org/resource/Kinross_services                    56.209628       -3.439257
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Leicester_Forest_East_services      52.6192         -1.206
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Woodall_services                    53.3152         -1.2813
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Tibshelf_services                   53.13708        -1.33179
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/London_Gateway_services             51.631          -0.264
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Donington_Park_services             52.823651       -1.305887
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Watford_Gap_services                52.3069         -1.1226
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Newport_Pagnell_services            52.083066       -0.748508
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Trowell_services                    52.963198       -1.265988
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Woolley_Edge_services               53.62259        -1.549422
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Toddington_services                 51.9478         -0.502075
http://dbpedia.org/resource/M1_motorway       http://dbpedia.org/resource/Northampton_services                52.209201       -0.944799
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Chieveley_services                  51.449          -1.3112
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Magor_services                      51.58786        -2.83713
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Pont_Abraham_services               51.74712        -4.0655
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Swansea_services                    51.678197       -3.994646
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Leigh_Delamere_services             51.511528       -2.159468
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Reading_services                    51.424527       -1.035633
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Cardiff_West_services               51.50626        -3.30535
http://dbpedia.org/resource/M4_motorway       http://dbpedia.org/resource/Heston_services                     51.48807        -0.39106

20 Rows. -- 531 msec.
```

</div>

<div>

<div>

<div>

<div>

#### Example 19

</div>

</div>

</div>

``` programlisting
SELECT DISTINCT ?s (bif:round(?lat)) as ?lat (bif:round(?long)) as ?long
WHERE
  {
    {
      SELECT ?g ?s WHERE
        {
          graph ?g {
            ?s geo:geometry ?geo }
        }
      LIMIT 100
    }
    graph ?g {
      ?s geo:lat ?lat .
      ?s geo:long ?long . }
    FILTER (datatype (?lat) in (xsd:integer, xsd:float, xsd:double)) .
    FILTER (datatype (?long) in (xsd:integer, xsd:float, xsd:double))
  }

s                                                                             lat        long
ANY                                                                           ANY    ANY
________________________________________________________________________________________________
http://dbpedia.org/resource/QUaD                                          -90    -139
http://dbpedia.org/resource/Amundsen-Scott_South_Pole_Station                 -90    -139
http://dbpedia.org/resource/Amundsen-Scott_South_Pole_Station                 -90    0
http://dbpedia.org/resource/Degree_Angular_Scale_Interferometer               -90    -139
http://dbpedia.org/resource/South_Pole_Telescope                          -90    -139
http://dbpedia.org/resource/Arcminute_Cosmology_Bolometer_Array_Receiver      -90    -139
http://dbpedia.org/resource/Viper_telescope                               -90    -139
http://dbpedia.org/resource/Mount_Weaver                                  -87    -154
http://dbpedia.org/resource/Axel_Heiberg_Glacier                          -85    -163
http://dbpedia.org/resource/Mount_Ray                                         -85    -171
http://linkedgeodata.org/triplify/node/275487234#id                       -85    -142
http://linkedgeodata.org/triplify/node/303732928#id                       -85    -142
http://linkedgeodata.org/triplify/node/332036611#id                       -85    -85
http://linkedgeodata.org/triplify/node/303732935#id                       -85    -143
http://linkedgeodata.org/triplify/node/303732951#id                       -85    -144
http://linkedgeodata.org/triplify/node/303732953#id                       -85    -144
http://linkedgeodata.org/triplify/node/276208684#id                       -85    -166
```

</div>

<div>

<div>

<div>

<div>

#### Example 19

</div>

</div>

</div>

``` programlisting
## "Find things within 20km of New York City":

SELECT DISTINCT ?resource ?label ?location
WHERE
  {
    <http://dbpedia.org/resource/New_York_City>
        geo:geometry ?sourcegeo                   .
    ?resource geo:geometry ?location              ;
                rdfs:label ?label .
    FILTER( bif:st_intersects( ?location, ?sourcegeo, 20 ) ) .
    FILTER( lang(?label) = "en" )
  }
```

</div>

<div>

<div>

<div>

<div>

#### Example 20

</div>

</div>

</div>

``` programlisting
## "Find Distance between New York City
## and London, England":

SELECT ( bif:st_distance( ?nyl,?ln ) )
      AS ?distanceBetweenNewYorkCityAndLondon
WHERE
  {
    <http://dbpedia.org/resource/New_York_City>
        geo:geometry ?nyl .
    <http://dbpedia.org/resource/London>
        geo:geometry ?ln  .
  }
```

</div>

<div>

<div>

<div>

<div>

#### Example 21

</div>

</div>

</div>

``` programlisting
## "Find "All Educational Institutions
## within 10km of Oxford, UK; ordered by
## date of establishment":

SELECT DISTINCT ?thing AS ?uri
      ?thingLabel AS ?name
      ?date AS ?established
      ?matchgeo AS ?location
WHERE
  {
    <http://dbpedia.org/resource/Oxford>
             geo:geometry ?sourcegeo .
    ?resource geo:geometry ?matchgeo .
    FILTER( bif:st_intersects( ?matchgeo, ?sourcegeo, 5 ) ) .
       ?thing ?somelink ?resource                           ;
       <http://dbpedia.org/ontology/established> ?date      ;
       rdfs:label ?thingLabel                               .
    FILTER( lang(?thingLabel) = "en" )
  }
ORDER BY ASC( ?date )
```

</div>

<div>

<div>

<div>

<div>

#### Example 22

</div>

</div>

</div>

``` programlisting
## "Find Historical cross section of events related
## to Edinburgh and the surrounding area (within 30km)
## during the 19th century":

SELECT DISTINCT ?thing ?thingLabel
      ?dateMeaningLabel ?date ?matchgeo
WHERE
  {
    {
      SELECT DISTINCT ?thing ?matchgeo
      WHERE
        {
          <http://dbpedia.org/resource/Edinburgh>
              geo:geometry ?sourcegeo .
            ?resource geo:geometry ?matchgeo .
            FILTER( bif:st_intersects (
                ?matchgeo, ?sourcegeo, 30 ) ) .
            ?thing ?somelink ?resource
        }
    }
    {
      ?property rdf:type owl:DatatypeProperty ;
                          rdfs:range xsd:date
    } .
    ?thing ?dateMeaning ?date .
    FILTER( ?dateMeaning IN ( ?property ) ) .
    FILTER( ?date >= xsd:gYear("1800")
         && ?date <= xsd:gYear("1900") )
    ?dateMeaning rdfs:label ?dateMeaningLabel .
  FILTER( lang(?dateMeaningLabel) = "en" ) .
  ?thing rdfs:label ?thingLabel .
  FILTER( lang(?thingLabel) = "en" )
  }
ORDER BY ASC ( ?date )
```

</div>

</div>

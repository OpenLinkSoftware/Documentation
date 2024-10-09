<div>

<div>

<div>

<div>

### 15.9.7. Status Of XSLT And XPath Implementation

</div>

</div>

</div>

Items marked with (\*) are currently not implemented.

<div>

<div>

<div>

<div>

#### XPath Axes

</div>

</div>

</div>

|                      |
|----------------------|
| ancestor::           |
| ancestor-or-self::   |
| attribute::          |
| child::              |
| descendant::         |
| descendant-or-self:: |
| following::          |
| following-sibling::  |
| namespace:: (\*)     |
| parent::             |
| preceding::          |
| preceding-sibling::  |
| self::               |

</div>

<div>

<div>

<div>

<div>

#### Node Functions

</div>

</div>

</div>

|                                                                                  |
|----------------------------------------------------------------------------------|
| number <a href="xpf_position.html" class="link" title="position">position</a> () |
| number <a href="xpf_count.html" class="link" title="count">count</a> (node-set)  |
| string <a href="xpf_local_name.html" class="link"                                
 title="local-name">local-name</a> (node-set?)                                     |
| string <a href="xpf_namespace_uri.html" class="link"                             
 title="namespace-uri">namespace-uri</a> (node-set?)                               |
| string <a href="xpf_name.html" class="link" title="name">name</a> (node-set?)    |
| boolean <a href="xpf_lang.html" class="link" title="lang">lang</a> (string)      |

</div>

<div>

<div>

<div>

<div>

#### Node Set Functions

</div>

</div>

</div>

|                                                                                                                                    |
|------------------------------------------------------------------------------------------------------------------------------------|
| node-set <a href="xpf_document.html" class="link" title="document">document</a> (string, string?, integer?, name?, name?, string?) |
| node-set <a href="xpf_document_literal.html" class="link"                                                                          
 title="document-literal">document-literal</a> (string, string?, integer?, name?, name?, string?)                                    |
| node-set <a href="xpf_id.html" class="link" title="id">id</a> (object)                                                             |
| node-set <a href="xpf_append.html" class="link" title="append">append</a> (object, object, ..., object)                            |

</div>

<div>

<div>

<div>

<div>

#### String Functions

</div>

</div>

</div>

|                                                                                                       |
|-------------------------------------------------------------------------------------------------------|
| string <a href="xpf_string.html" class="link" title="string">string</a> (object?)                     |
| string <a href="xpf_serialize.html" class="link"                                                      
 title="serialize">serialize</a> (object?)                                                              |
| string <a href="xpf_format_number.html" class="link"                                                  
 title="format-number">format-number</a> (number, string, string?)                                      |
| string <a href="xpf_concat.html" class="link" title="concat">concat</a> (object, object, ..., object) |
| number <a href="xpf_string_length.html" class="link"                                                  
 title="string-length">string-length</a> (string?)                                                      |
| boolean <a href="xpf_contains.html" class="link" title="contains">contains</a> (string, string)       |
| boolean <a href="xpf_text_contains.html" class="link"                                                 
 title="text_contains">text-contains</a> (string, string)                                               |
| boolean <a href="xpf_starts_with.html" class="link"                                                   
 title="starts-with">starts-with</a> (string, string)                                                   |
| boolean <a href="xpf_ends_with.html" class="link"                                                     
 title="ends-with">ends-with</a> (string, string)                                                       |
| string <a href="xpf_substring.html" class="link"                                                      
 title="substring">substring</a> (string, number, number?)                                              |
| string <a href="xpf_substring_before.html" class="link"                                               
 title="substring-before">substring-before</a> (string, string)                                         |
| string <a href="xpf_substring_after.html" class="link"                                                
 title="substring-after">substring-after</a> (string, string)                                           |
| string <a href="xpf_normalize_space.html" class="link"                                                
 title="normalize-space">normalize-space</a> (string?)                                                  |
| string <a href="xpf_translate.html" class="link"                                                      
 title="translate">translate</a> (string, string, string)                                               |
| string <a href="xpf_replace.html" class="link" title="replace">replace</a> (string, string, string)   |

</div>

<div>

<div>

<div>

<div>

#### Boolean Functions

</div>

</div>

</div>

|                                                                                                  |
|--------------------------------------------------------------------------------------------------|
| boolean <a href="xpf_boolean.html" class="link" title="boolean">boolean</a> (object)             |
| boolean <a href="xpf_true.html" class="link" title="true">true</a> ()                            |
| boolean <a href="xpf_false.html" class="link" title="false">false</a> ()                         |
| boolean <a href="xpf_not.html" class="link" title="not">not</a> (boolean)                        |
| boolean <a href="xpf_and.html" class="link" title="and">and</a> (boolean, boolean, ..., boolean) |
| boolean <a href="xpf_or.html" class="link" title="or">or</a> (boolean, boolean, ..., boolean)    |
| boolean <a href="xpf_some.html" class="link" title="some">some</a> (name, boolean, node-set)     |
| boolean <a href="xpf_every.html" class="link" title="every">every</a> (name, boolean, node-set)  |
| boolean <a href="xpf_function_available.html" class="link"                                       
 title="function-available">function_available</a> (name)                                          |

</div>

<div>

<div>

<div>

<div>

#### Number Functions

</div>

</div>

</div>

|                                                                                     |
|-------------------------------------------------------------------------------------|
| number <a href="xpf_number.html" class="link" title="number">number</a> (object?)   |
| number <a href="xpf_floor.html" class="link" title="floor">floor</a> (number)       |
| number <a href="xpf_ceiling.html" class="link" title="ceiling">ceiling</a> (number) |
| number <a href="xpf_round.html" class="link" title="round">round</a> (number)       |
| number <a href="xpf_sum.html" class="link" title="sum">sum</a> (number)             |
| number <a href="xpf_avg.html" class="link" title="avg">avg</a> (number)             |
| number <a href="xpf_max.html" class="link" title="max">max</a> (number)             |
| number <a href="xpf_min.html" class="link" title="min">min</a> (number)             |

</div>

<div>

<div>

<div>

<div>

#### XSLT-specific Functions

</div>

</div>

</div>

|                                                                        |
|------------------------------------------------------------------------|
| <a href="xpf_current.html" class="link" title="current">current</a> () |
| <a href="xpf_function_available.html" class="link"                     
 title="function-available">function-available</a> (string)              |
| <a href="xpf_unparsed_entity_uri.html" class="link"                    
 title="unparsed-entity-uri">unparsed-entity-uri</a> (string)            |
| <a href="xpf_system_property.html" class="link"                        
 title="system-property">system-property</a> (string)                    |

</div>

<div>

<div>

<div>

<div>

#### XSLT 1.0 Elements and Attributes

</div>

</div>

</div>

|                                                                |
|----------------------------------------------------------------|
| xsl:apply-imports                                              |
| xsl:apply-templates                                            |
| xsl:attribute                                                  |
| xsl:attribute-set (\*)                                         |
| xsl:call-template                                              |
| xsl:choose                                                     |
| xsl:comment                                                    |
| xsl:copy                                                       |
| xsl:copy-of                                                    |
| xsl:decimal-format                                             |
| xsl:element                                                    |
| xsl:fallback (\*)                                              |
| xsl:for-each                                                   |
| xsl:if                                                         |
| xsl:import                                                     |
| xsl:include                                                    |
| xsl:key                                                        |
| xsl:message                                                    |
| xsl:namespace-alias                                            |
| xsl:number NOTE: formatting and level="any" is not implemented |
| xsl:otherwise                                                  |
| xsl:output                                                     |
| xsl:param                                                      |
| xsl:preserve-space (\*)                                        |
| xsl:processing-instruction                                     |
| xsl:sort                                                       |
| xsl:strip-space                                                |
| xsl:stylesheet                                                 |
| xsl:template                                                   |
| xsl:text                                                       |
| xsl:transform (\*) NOTE: use xsl:stylesheet instead            |
| xsl:value-of                                                   |
| xsl:variable                                                   |
| xsl:when                                                       |
| xsl:with-param                                                 |

</div>

</div>

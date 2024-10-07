<div id="fn_search_excerpt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

search_excerpt — Returns excerpts with hit words from text

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_dirlist_01" class="funcsynopsis">

|                             |                                 |
|-----------------------------|---------------------------------|
| ` `**`search_excerpt`**` (` | in `hit_words ` any ,           |
|                             | in `text ` varchar ,            |
|                             | in `within_first ` int ,        |
|                             | in `max_excerpt ` int ,         |
|                             | in `total ` int ,               |
|                             | in `html_hit_tag ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_dirlist_01" class="refsect1">

## Description

This function produces representative samples for use in displaying a
query hit. There are two modes: html mode and text mode. In html mode
everything looks like html tags is ignored and searching of excerpt
begins from \<body\> tag. All found hit words highlighted by
html_hit_tag.

In text mode text is treated as plain text, html tag detection is
disabled and hit words is not highlighted.

</div>

<div id="params_file_dirlist_01" class="refsect1">

## Parameters

<div id="id109102" class="refsect2">

### hit_words

array of hit words to be found in text. Number of hit words can not be
more than 10.

</div>

<div id="id109105" class="refsect2">

### text

original text where hit words are searched

</div>

<div id="id109108" class="refsect2">

### within_first

number of chars in text from the start to consider. Default value is
20000.

</div>

<div id="id109111" class="refsect2">

### max_excerpt

maximum length of single excerpt phrase. Default value is 90.

</div>

<div id="id109114" class="refsect2">

### total

maximum length of whole excerpt. Default value is 200.

</div>

<div id="id109117" class="refsect2">

### html_hit_tag

HTML tag which is used to highlight hit words in excerpt. Default value
is "b". If it is NULL text mode is used

</div>

</div>

<div id="ret_file_dirlist_01" class="refsect1">

## Return Types

varchar

</div>

<div id="examples_search_excerpt" class="refsect1">

## Examples

<div id="ex_search_excerpt" class="example">

**Example 24.365. Creating search excerpt**

<div class="example-contents">

creates a search excerpt from found DAV resource

``` programlisting
for select RES_CONTENT from WS.WS.SYS_DAV_RES 
 where contains (RES_CONTENT, 'place and knowledge')
do {
  http_value (search_excerpt (vector ('place', 'knowledge'), 
                              cast (RES_CONTENT as varchar), 
                  200000, 90, 200, 'b', 1),
          'P');
}         
          
```

</div>

</div>

  

</div>

</div>

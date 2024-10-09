<div>

<div>

</div>

<div>

## Name

search_excerpt — Returns excerpts with hit words from text

</div>

<div>

## Synopsis

<div>

|                             |                                 |
|-----------------------------|---------------------------------|
| ` `**`search_excerpt`**` (` | in `hit_words ` any ,           |
|                             | in `text ` varchar ,            |
|                             | in `within_first ` int ,        |
|                             | in `max_excerpt ` int ,         |
|                             | in `total ` int ,               |
|                             | in `html_hit_tag ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function produces representative samples for use in displaying a
query hit. There are two modes: html mode and text mode. In html mode
everything looks like html tags is ignored and searching of excerpt
begins from \<body\> tag. All found hit words highlighted by
html_hit_tag.

In text mode text is treated as plain text, html tag detection is
disabled and hit words is not highlighted.

</div>

<div>

## Parameters

<div>

### hit_words

array of hit words to be found in text. Number of hit words can not be
more than 10.

</div>

<div>

### text

original text where hit words are searched

</div>

<div>

### within_first

number of chars in text from the start to consider. Default value is
20000.

</div>

<div>

### max_excerpt

maximum length of single excerpt phrase. Default value is 90.

</div>

<div>

### total

maximum length of whole excerpt. Default value is 200.

</div>

<div>

### html_hit_tag

HTML tag which is used to highlight hit words in excerpt. Default value
is "b". If it is NULL text mode is used

</div>

</div>

<div>

## Return Types

varchar

</div>

<div>

## Examples

<div>

**Example 24.365. Creating search excerpt**

<div>

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

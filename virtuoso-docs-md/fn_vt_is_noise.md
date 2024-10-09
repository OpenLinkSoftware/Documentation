<div>

<div>

</div>

<div>

## Name

vt_is_noise — determines whether input is a noise word

</div>

<div>

## Synopsis

<div>

|                          |                             |
|--------------------------|-----------------------------|
| ` `**`vt_is_noise`**` (` | in `word ` varchar ,        |
|                          | in `encoding ` varchar ,    |
|                          | in `language ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Determines whether input is a noise word.

</div>

<div>

## Parameters

<div>

### word

Narrow string of the word to be checked

</div>

<div>

### encoding

valid encoding string

</div>

<div>

### language

valid language string

</div>

</div>

<div>

## Return Values

1 or 0. This function will return 1 if the encoded word in the specified
language is considered a noise word, or 0 if not.

</div>

<div>

## Examples

<div>

**Example 24.449. Determining if a word is a Noise Word**

<div>

``` programlisting
select vt_is_noise ('a', 'UTF-8', 'X-ANY');
      
```

will return 1

``` programlisting
select vt_is_noise ('effective', 'UTF-8', 'X-ANY');
      
```

will return 0

</div>

</div>

  

</div>

</div>

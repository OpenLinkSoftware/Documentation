<div>

<div>

<div>

<div>

## 23.7. Basic Syntax of Regular Expressions

</div>

</div>

</div>

The two special symbols: `'^'` and `'$'` indicate the
<span class="emphasis">*start*</span> and the
<span class="emphasis">*end*</span> of a string respectively, like so:

|                                                                                    |
|------------------------------------------------------------------------------------|
| `^The` : matches any string that starts with The;                                  |
| `of despair$` : matches a string that ends in the substring of despair;            |
| `^abc$` : a string that starts and ends with abc -- that could only be abc itself! |
| `notice` : a string that has the text notice in it.                                |

Without either of the above special character you are allowing the
pattern to occur anywhere inside the string.

The symbols `'*'` , `'+'` , and `'?'` denote the number of times a
character or a sequence of characters may occur. What they mean is: zero
or more, one or more, and zero or one. Here are some examples:

|                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ab*` : matches a string that has an <span class="emphasis">*a*</span> followed by zero or more <span class="emphasis">*b*</span> 's (a, ab, abbb, etc.); |
| `ab+` : same, but there is at least one <span class="emphasis">*b*</span> (ab, abbb, etc.);                                                               |
| `ab?` : there might be a <span class="emphasis">*b*</span> or not;                                                                                        |
| `a?b+$` : a possible <span class="emphasis">*a*</span> followed by one or more <span class="emphasis">*b*</span> 's ending a string.                      |

You can also use <span class="emphasis">*bounds*</span> , which come
inside braces and indicate ranges in the number of occurrences:

|                                                                                                                                              |
|----------------------------------------------------------------------------------------------------------------------------------------------|
| `ab{2}` : matches a string that has an <span class="emphasis">*a*</span> followed by exactly two <span class="emphasis">*b*</span> 's (abb); |
| `ab{2,}` : there are at least two <span class="emphasis">*b*</span> 's (abb, abbbb, etc.);                                                   |
| `ab{3,5}` : from three to five <span class="emphasis">*b*</span> 's (abbb, abbbb, or abbbbb).                                                |

Note, that you must always specify the first number of a range (i.e,
`{0,2}` , not `{,2}` ). Also, as you may have noticed, the symbols '\*',
'+', and '?' have the same effect as using the bounds `{0,}` , `{1,}` ,
and `{0,1}` , respectively.

Now, to quantify a sequence of characters, put them inside parentheses:

|                                                                                                                               |
|-------------------------------------------------------------------------------------------------------------------------------|
| `a(bc)*` : matches a string that has an <span class="emphasis">*a*</span> followed by zero or more copies of the sequence bc; |
| `a(bc){1,5}` : one through five copies of bc.                                                                                 |

There's also the '\|' symbol, which works as an OR operator:

|                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `hi|hello` : matches a string that has either hi or hello in it;                                                                                                                      |
| `(b|cd)ef` : a string that has either bef or cdef;                                                                                                                                    |
| `(a|b)*c` : a string that has a sequence of alternating <span class="emphasis">*a*</span> 's and <span class="emphasis">*b*</span> 's ending in a <span class="emphasis">*c*</span> ; |

A period ('.') stands for any single character:

|                                                                                                                   |
|-------------------------------------------------------------------------------------------------------------------|
| `a.[0-9]` : matches a string that has an <span class="emphasis">*a*</span> followed by one character and a digit; |
| `^.{3}$` : a string with exactly 3 characters.                                                                    |

<span class="emphasis">*Bracket expressions*</span> specify which
characters are allowed in a single position of a string:

|                                                                                                                                                    |
|----------------------------------------------------------------------------------------------------------------------------------------------------|
| `[ab]` : matches a string that has either an <span class="emphasis">*a*</span> or a <span class="emphasis">*b*</span> (that's the same as `a|b` ); |
| `[a-d]` : a string that has lowercase letters 'a' through 'd' (that's equal to `a|b|c|d` and even `[abcd]` );                                      |
| `^[a-zA-Z]` : a string that starts with a letter;                                                                                                  |
| `[0-9]%` : a string that has a single digit before a percent sign;                                                                                 |
| `,[a-zA-Z0-9]$` : a string that ends in a comma followed by an alphanumeric character.                                                             |

You can also list the characters that do NOT want -- just use a '^' as
the first symbol in a bracketed expression (i.e., `%[^a-zA-Z]%` matches
a string with a character that is not a letter between two percent
signs).

Do not forget that bracket expressions are an exception to that
rule--inside them, all special characters, including the backslash
('\\), lose their special powers (i.e., `[*\+?{}.]` matches exactly any
of the characters inside the brackets). To include a literal '\]' in the
list, make it the first character (following a possible '^'). To include
a literal '-', make it the first or last character, or the second
endpoint of a range.

</div>

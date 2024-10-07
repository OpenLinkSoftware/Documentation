<div id="likepredicate" class="section">

<div class="titlepage">

<div>

<div>

### 9.19.9. LIKE Predicate & Search Patterns

</div>

</div>

</div>

The <span class="emphasis">*`LIKE`*</span> predicate expects a pattern
to be applied to a `varchar` or `nvarchar` column to qualify the results
to be returned from a query.

If the pattern does not begin with an at-sign (`@`) or with two
asterisks (`**`), then we test the equality of the string and pattern
with ordinary wildcard matching, which behaves approximately like the
filename pattern matching in the Unix shell (but not like the regular
expression matching in utilities like `grep` and `sed`).

The following characters have special significance in the pattern:

|                                                          |
|----------------------------------------------------------|
| `?` - Matches any single character.                      |
| `*` - Matches zero or more of any characters.            |
| `[ ]` - (Called a group-expression here; detailed below. |

The group expression `[ ]` matches any one of the enclosed characters,
unless the first character following the opening `[` is `^`, then
matches only if the character (in the datum string) is not any one of
those specified after the `^` (i.e., the `^` negates the meaning of this
expression.)

You can use character ranges like `0-9` (shorthand for `0123456789`)
inside the brackets, in which case the character in the datum string
must be lexically within the inclusive range of that pair. In other
words, the lexical (ASCII) value of the character at the left side of
hyphen must be less than the lexical (ASCII) value of the character at
the right side.

The hyphen (`-`) can be included in the character set by putting it as
the first or last character. The right bracket (`]`) can be included by
putting it as the first character in the expression, i.e., immediately
after the opening bracket (`[`) or the caret (`^`) immediately following
the opening bracket.

That is, the hyphen indicates a range between characters, unless it is
the first or the last character in the group expression, in which case
it matches just to itself.

<div id="id33915" class="example">

**Example 9.32. Examples:**

<div class="example-contents">

``` programlisting
[abc]          Matches any of the letters a, b, or c.
[^0123456789]  Matches anything, except digits. (Same as [^0-9].)
[[]            Matches [
[]]            Matches ]
[][]           Matches ] and [
[^]]           Matches anything except ]
[A-Za-z0-9]    Matches all the alphanumeric characters.
[-*+/]         Matches the four basic arithmetic operators.
[-]            Matches to single hyphen.
[]-]           Matches to ] or -
[-[] or [[-]   Matches to - or [
```

</div>

</div>

  

<span class="emphasis">*`@`*</span> - Matches the character last matched
to `?` or group-expression. For example, `?*@` matches to all strings
which begin with the same character as they end with. However, if there
is neither `?` nor `[]` expression at the left side of `@` in the
pattern, then `@` matches just to itself (e.g., `*@*` should match to
all e-mail addresses).

Any other characters match ONLY to themselves, that is, not even to the
upper- or lower-case variants of the same letter. Use expressions like
`[Wo][Oo][Rr][Dd]` if you want to find any mixed-case variant of the
word "`word`", or use the substring search explained below.

However, if the pattern begins with an at-sign (`@`), then we compare
the rest of pattern to string with the fuzzy matching, allowing
differences of few characters in quality and quantity (length). If there
is more than one `@` at the beginning of pattern, they are all skipped,
and many additional liberties are taken for the match function. The more
`@` signs there are at the beginning, the more fuzzy (liberal) is the
search. For example, pattern "`@Johnson`" will match string "`Jonsson`",
and pattern "`@@Johnson`" will also match "`Jansson`".

If the pattern begins with two asterisks (`**`), then we do diacritic-
and case-insensitive substring search, trying to find the string given
in the rest of pattern from the datum string.

<div id="id33941" class="example">

**Example 9.33. Example:**

<div class="example-contents">

"`**escort`" will match to "`Ford Escort vm. 1975`".

</div>

</div>

  

If there are any ISO8859.1 diacritic letters (e.g., vowels with accents
or umlauts, or letters like the Spanish `n` with `~` (tilde)) present in
the datum string, then the plain unaccented (7-bit ASCII) variant of the
same letter in the pattern string will match to it. However, if there is
any diacritic letter specified in the pattern string, then it will match
only to the upper- or lower-case variant of exactly the same diacritic
letter.

The rationale behind this is that the people entering the information to
the database can use the exact spelling for the word - for example,
writing the word "Citroen" with the umlaut-e (e with two dots above it,
`ë`), as it is actually written in French - and the people who search
for "Citroën" can still find it without having to remember the exact
orthography of the French, by just giving the word "`citroen`". This
also allows people who have just plain 7-bit ASCII keyboards to search
for words like `Ra"a"kkyla"` (a place in Finland, `a"` means umlaut-a,
i.e., `a` with two dots above it, `ä`), just by entering the word
`raakkyla`.

So the following hold for substring searches:

|                                                                                                                                                                                                                                              |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1\) Any non-alphabetic character in the pattern matches just to itself in the datum string (e.g., `?` to `?` and `3` to `3`).                                                                                                                |
| 2\) Any 7-bit ASCII letter (`A-Z` and `a-z` without any diacritic signs) in the pattern matches to any diacritic variant of the same letter (as well as to the same 7-bit ASCII letter) in the datum string, either in upper- or lower-case. |
| 3\) Any diacritic letter (8-bit ISO8859.1 letter) in the pattern matches only to the same letter (in upper- or lower-case) in the datum string.                                                                                              |

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                          |
|                              | Because the internal matching functions use macros which also consider characters like `@`, `[`, `\`, `]`, and `^` to be letters, they will match against characters `` ` ``, `{`, `|`, `}`, and `~`, respectively, because in some older implementations of European character sets, those characters mark the uppercase and lowercase variants of certain diacritic letters. |

</div>

It is generally better to match too liberally, and so maybe sometimes
give something entirely off the wall to the user, than to miss something
important because of too-strict criteria.

Of course, when searching from the data which contains text in some
wide-character format (like certain coding systems for Japanese and
Chinese, where one character is coded with two bytes), neither fuzzy
matching function nor `nc_strstr` function presented here should be
used, as they would often match on entirely spurious cases.

</div>

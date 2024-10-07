<div id="fn_split_and_decode" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

split_and_decode — converts escaped var=val pairs to a vector of strings

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_split_and_decode" class="funcsynopsis">

|                                               |                           |
|-----------------------------------------------|---------------------------|
| `vector or string `**`split_and_decode`**` (` | in `coded_str ` varchar , |
|                                               | in `case_mode ` integer , |
|                                               | in `str ` varchar `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_23" class="refsect1">

## Description

split_and_decode converts the escaped var=val pair inputs text to a
corresponding vector of string elements. If the optional third argument
is a string of less than three characters, then does only the decoding
(but no splitting) and returns back a string.

</div>

<div id="params_06" class="refsect1">

## Parameters

<div id="id111048" class="refsect2">

### coded_str

Input string to be converted.

</div>

<div id="id111051" class="refsect2">

### case_mode

This optional second argument, if present should be an integer either 0,
1 or 2, which tells whether "variable name"-parts (those at the left
side of the fourth character given in third argument (or = if using the
default URL-decoding)) are converted to UPPERCASE (1), lowercase (2) or
left intact (0 or when the second argument is not given).

This avoids all hard-coded limits for the length of elements, by
scanning the inputs string three times. First for the total number of
elements (the length of vector to allocate), then calculating the length
of each string element to be allocated, and finally transferring the
characters of elements to the allocated string elements.

</div>

<div id="id111055" class="refsect2">

### str

If this argument is a string of less than three characters then this
function will only decode without splitting and will return a string.

</div>

</div>

<div id="examples_03_01" class="refsect1">

## Examples

<div id="ex_split_and_decode" class="example">

**Example 24.387. Using split_and_decode**

<div class="example-contents">

``` programlisting
   split_and_decode("Tulipas=Taloon+kumi=kala&Joka=haisi
        +pahalle&kuin&%E4lymystöporkkana=ilman ruuvausta",1)
   produces a vector:
   ("TULIPAS" "Taloon kumi=kala" "JOKA" "haisi pahalle" "KUIN" NULL
   "ÄLYMYSTÖPORKKANA" "ilman ruuvausta")
```

``` programlisting
   split_and_decode(NULL)   => NULL
   split_and_decode("")     => NULL
   split_and_decode("A")    => ("A" NULL)
   split_and_decode("A=B")  => ("A" "B")

   split_and_decode("A&B")  => ("A" NULL "B" NULL)
   split_and_decode("=")    => ("" "")
   split_and_decode("&")    => ("" NULL "" NULL)
   split_and_decode("&=")   => ("" NULL "" "")
   split_and_decode("&=&")  => ("" NULL "" "" "" NULL)
   split_and_decode("%")    => ("%" NULL)
   split_and_decode("%%")   => ("%" NULL)
   split_and_decode("%41")  => ("A" NULL)
   split_and_decode("%4")   => ("%4" NULL)
   split_and_decode("%?41") => ("%?41" NULL)
```

Can also work like Perl's split function (we define the escape prefix
and space escape character as NUL-characters, so that they will not be
encountered at all:

``` programlisting
   split_and_decode('Un,dos,tres',0,'\0\0,') => ("Un" "dos" "tres")
   split_and_decode("Un,dos,tres",1,'\0\0,') => ("UN" "DOS" "TRES")
   split_and_decode("Un,dos,tres",2,'\0\0,') => ("un" "dos" "tres")
```

Can also be used as replace and ucase (or lcase) together, for example,
here we use the comma as space-escape instead of element-separator: (not
recommended, use replace and ucase instead.

``` programlisting
   split_and_decode("Un,dos,tres",0,'\0,')   => "Un dos tres"
   split_and_decode("Un,dos,tres",1,'\0,')   => "UN DOS TRES"
```

Can be also used for decoding (some of) MIME-encoded mail-headers:

``` programlisting
   split_and_decode('=?ISO-8859-1?Q?Tiira_lent=E4=E4_taas?=',0,'=_')
   =>  "=?ISO-8859-1?Q?Tiira lentää taas?="

   split_and_decode('Message-Id: <199511141036.LAA06462@correo.unet.ar>\n
        From: "=?ISO-8859-1?Q?Jorge_Mo=F1as?=" <jorgem@unet.ar>\n
        To: "Jore Carvajal" <carvajal@wanabee.fr>\nSubject: RE: Um-pah-pah\n
        Date: Wed, 12 Nov 1997 11:28:51 +0100\n
        X-MSMail-Priority: Normal\nX-Priority: 3\n
        X-Mailer: Molosoft Internet Mail 4.70.1161\nMIME-Version: 1.0\n
        Content-Type: text/plain; charset=ISO-8859-1\n
        Content-Transfer-Encoding: 8bit\nX-Mozilla-Status: 0011',
   1,'=_\n:');
   => ('MESSAGE-ID' ' <199511141036.LAA06462@correo.unet.ar>'
   'FROM' ' "=?ISO-8859-1?Q?Jorge Moñas?=" <jorgem@unet.ar>'
   'TO' ' "Jore Carvajal" <carvajal@wanabee.fr>'
   'SUBJECT' ' RE: Um-pah-pah'
   'DATE' ' Wed, 12 Nov 1997 11:28:51 +0100'
   'X-MSMAIL-PRIORITY' ' Normal'
   'X-PRIORITY' ' 3'
   'X-MAILER' ' Molosoft Internet Mail 4.70.1161'
   'MIME-VERSION' ' 1.0'
   'CONTENT-TYPE' ' text/plain; charset=ISO-8859-1'
   'CONTENT-TRANSFER-ENCODING' ' 8bit'
   'X-MOZILLA-STATUS' ' 0011')
```

Same, but let's use space, not colon as a variable=value separator:

``` programlisting
   split_and_decode('Message-Id: <199511141036.LAA06462@correo.unet.ar>\n
        From: "=?ISO-8859-1?Q?Jorge_Mo=F1as?=" <jorgem@unet.ar>\n
        To: "Jore Carvajal" <carvajal@wanabee.fr>\nSubject: RE: Um-pah-pah\n
        Date: Wed, 12 Nov 1997 11:28:51 +0100\n
        X-MSMail-Priority: Normal\nX-Priority: 3\n
        X-Mailer: Molosoft Internet Mail 4.70.1161\nMIME-Version: 1.0\n
        Content-Type: text/plain; charset=ISO-8859-1\n
        Content-Transfer-Encoding: 8bit\nX-Mozilla-Status: 0011',
   1,'=_\n ')
   => ('MESSAGE-ID:' '<199511141036.LAA06462@correo.unet.ar>'
   'FROM:' '"=?ISO-8859-1?Q?Jorge Moñas?=" <jorgem@unet.ar>'
   'TO:' '"Jore Carvajal" <carvajal@wanabee.fr>'
   'SUBJECT:' 'RE: Um-pah-pah'
   'DATE:' 'Wed, 12 Nov 1997 11:28:51 +0100'
   'X-MSMAIL-PRIORITY:' 'Normal'
   'X-PRIORITY:' '3'
   'X-MAILER:' 'Molosoft Internet Mail 4.70.1161'
   'MIME-VERSION:' '1.0'
   'CONTENT-TYPE:' 'text/plain; charset=ISO-8859-1'
   'CONTENT-TRANSFER-ENCODING:' '8bit'
   'X-MOZILLA-STATUS:' '0011')
```

Of course this approach does not work with multiline headers, except
somewhat kludgously. If the lines are separated by CR+LF, there is left
one trailing CR at the end of each value part string.

</div>

</div>

  

</div>

</div>

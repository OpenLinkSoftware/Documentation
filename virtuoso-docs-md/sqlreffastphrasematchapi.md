<div id="sqlreffastphrasematchapi" class="section">

<div class="titlepage">

<div>

<div>

### 9.33.2. Phrase Set Configuration API

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="fn_ann_phrase_class_add.html" class="link"
  title="DB.DBA.ANN_PHRASE_CLASS_ADD"><code
  class="function">DB.DBA.ANN_PHRASE_CLASS_ADD</code></a>

- <a href="fn_ann_phrase_class_del.html" class="link"
  title="DB.DBA.ANN_PHRASE_CLASS_DEL"><code
  class="function">DB.DBA.ANN_PHRASE_CLASS_DEL</code></a>

- <a href="fn_ap_build_match_list.html" class="link"
  title="AP_BUILD_MATCH_LIST"><code
  class="function">AP_BUILD_MATCH_LIST</code>:</a> The report R is a
  vector of 6 elements:

  <div class="orderedlist">

  1.  R\[0\] vector of all distinct phrase classes for phrase sets of
      found phrases; every pair of items represents one phrase class:
      first item is an integer APC_ID of a class, second item is a
      description of phrase class as vector of APC_NAME, APC_CALLBACK
      and APC_APP_ENV;

  2.  R\[1\] vector of all distinct phrase sets of found phrases; every
      pair of items represents one phrase set: first item is an integer
      APS_ID of a class, second item is a vector of APS_NAME,
      APS_APC_ID, index of phrase class description in R\[0\] and
      APS_APP_ENV;

  3.  R\[2\] vector of all distinct found phrases; every item represents
      a phrase as a vector of AP_APS_ID, index of phrase set description
      in R\[1\], AP_TEXT and application-specific data from AP_LINK_DATA
      or AP_LINK_DATA_LONG;

  4.  R\[3\] vector of all composed arrows for the text; every item
      represents one place in a text, as an "arrow" described below;

  5.  R\[4\] vector of indexes of arrows that point to words in the
      text; every item is an integer that is index in R\[3\];

  6.  R\[5\] vector of descriptions of occurrences of annotation phrases
      in text; every item represents one occurrence as vector of index
      of first word in R\[3\], index of last word in R\[3\], index of
      found phrase in R\[2\], index of previous occurrence of same
      phrase in R\[5\].

  7.  Every "arrow" A is vector of length 5 or 6, it is longer when
      arrow points inside occurrence of some annotation phrase.

      <div class="orderedlist">

      1.  A\[0\] integer that indicates type of text fragment:

          <div class="itemizedlist">

          - 0 is for plain word (only this type occurs in reports for
            plain text),

          - 1 is for text of opening tag,

          - 2 is for text of closing tag,

          - 3 is something exceptional like unrecoverable HTML syntax
            error

          </div>

      2.  A\[1\] integer offset of the first byte of a fragment in the
          text

      3.  A\[2\] integer offset of the first byte after the end of a
          fragment

      4.  A\[3\] integer that is a bit-mask of opened but not yet closed
          tags

      5.  A\[4\] integer index of the arrow of the innermost tag that is
          opened but not yet closed where the arrow begins

      6.  A\[5\] may absent, if presents then it is a vector of indexes
          in R\[2\] of all containing phrases.

      </div>

  8.  Bit mask of opened but not yet closed tags consists of the
      following bits:

      ``` programlisting
      0x00000001  PCDATA containers (such as OPTION, TEXTAREA, XBODY, XHEAD)
      0x00000002  Inlined highlight tags (such as ABBR, ACRONYM, B, BDO, BIG, CITE, CODE, DFN, EM, FONT, I, KBD, Q, S, SAMP, SMALL, SPAN, STRIKE, STRONG, SUB, SUP, TT, U)
      0x00000004  Tag A
      0x00000008  Tag LABEL

      0x00000010  Inlined content (such as ADDRESS, APPLET, H1-H6, LABEL, LEGEND, P, PRE, and all blocks of content except MAP)
      0x00000020  Blocks (such as BLOCKQUOTE, BUTTON, DD, DIV, DL, DT, FIELDSET, FORM, IFRAME, LI, NOFRAMES, NOSCRIPT, OBJECT, TABLE, TBODY, TD, TFOOT, TH, THEAD, TR, XBODY, XHEAD)

      0x00000100  Tags of list and ordered list (MENU, OL, UL)
      0x00000200  Tag LI
      0x00000400  Tag DL
      0x00000800  Tags DD and DT

      0x00001000  Tag FORM
      0x00002000  Tag SELECT
      0x00004000  Tag OPTGROUP
      0x00008000  Tag BUTTON

      0x00010000  Tag TABLE
      0x00020000  Tags inside TABLE but outside table rows (such as TBODY, TFOOT, THEAD)
      0x00040000  Tag TR
      0x00080000  Tags TH and TD

      0x00FFFFFF  Tags XBODY and XHEAD

      0x01000000  Tag HEAD
      0x02000000  Tag FRAMESET
      0x04000000  Tag NOFRAMES

      0x10000000  Tag HTML
      0x20000000  Tag BODY
      0x40000000  Tags INS and DEL
      0x80000000  Tag XMP
      ```

      For long document, the report may be too long, esp. vectors R\[3\]
      and R\[4\]. A simple application may not need locations of every
      tag and every word of the document. The report_flags argument is a
      bitmask, and some bits control the size of the report. If bit 1 is
      set then closing tags are excluded from report. If bit 2 is set
      then only words in found phrase are placed to the report, the rest
      of phrases is excluded.

  </div>

</div>

</div>

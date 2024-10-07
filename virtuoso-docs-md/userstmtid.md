<div id="userstmtid" class="section">

<div class="titlepage">

<div>

<div>

### 9.6.3. USE Statement, USE identifier

</div>

</div>

</div>

This sets the default qualifier for the connection in question. The
identifier cannot be an expression. The identifier is subject to
whatever case conversions may be in effect.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="catidentifiers.html" class="link"                        
                              title="9.4. Identifier Case &amp; Quoting">CaseMode Configuration  
                              parameter</a> .                                                    |

</div>

A quoted identifier will always pass in the case it is entered. An
unquoted identifier will be converted to upper case if CaseMode so
specifies.

</div>

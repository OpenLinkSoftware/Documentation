<div id="tipsdbnotstart" class="section">

<div class="titlepage">

<div>

<div>

### 3.14.2. DBMS Server will not start

</div>

</div>

</div>

If the Virtuoso DBMS server won't start, there could be 3 reasons.

|                                                                           |
|---------------------------------------------------------------------------|
| It is already running                                                     |
| It died earlier                                                           |
| It terminated normally earlier, but the virtuoso.lck file was not deleted |

When the DBMS server starts up, it creates a file in the bin directory
named "virtuoso.lck". If this file is present, a new instance cannot
run. If you are certain that the DBMS isn't running, then you can delete
the virtuoso.lck file and then start it from the Services icon in the
Control Panel, or by using the command "<span class="emphasis">*virtuoso
+service start*</span> " in the virtuoso directory. You can check if
virtuoso is running from the Task Manager, and you can shut it down
using the command "<span class="emphasis">*virtuoso +service
stop*</span> ".

<div class="figure-float">

<div id="image32" class="figure">

**Figure 3.58. Command Prompt**

<div class="figure-contents">

<div class="mediaobject">

![Command Prompt](images/virttour32.gif)

</div>

</div>

</div>

  

</div>

</div>

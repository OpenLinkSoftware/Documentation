<div id="newssrvadm" class="section">

<div class="titlepage">

<div>

<div>

### 6.2.11. Conductor News Server Administration

</div>

</div>

</div>

<div id="newsgrpsadm" class="section">

<div class="titlepage">

<div>

<div>

#### Conductor Newsgroups Administration

</div>

</div>

</div>

From Conductor the NNTP tab allows you to view and configure Newsgroups
associated with the Virtuoso News Server. Like Virtuoso's virtual
database, Virtuoso can "link" in newsgroups from remote news servers.
This interface allows you to view the configuration and control the
newsgroups both local and remote.

The Virtuoso News server component will need to be enabled in the
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">Virtuoso.ini</a> file by specifying
the NewsServerPort number.

The tab "NNTP Servers" shows list of the registered News servers.

<div class="figure-float">

<div id="id15780" class="figure">

**Figure 6.175. News Server Administration**

<div class="figure-contents">

<div class="mediaobject">

![News Server Administration](images/ui/news_adm_01.png)

</div>

</div>

</div>

  

</div>

Click the "Edit" link to change the news server settings, or click the
"Delete" link to remove the news server.

<div class="figure-float">

<div id="id15786" class="figure">

**Figure 6.176. Edit News Server Properties**

<div class="figure-contents">

<div class="mediaobject">

![Edit News Server Properties](images/ui/news_adm_01a.png)

</div>

</div>

</div>

  

</div>

Click the "Edit Groups" link for a current News Server in order to
manage the list of available newsgroups.

<div class="figure-float">

<div id="id15792" class="figure">

**Figure 6.177. News Groups List**

<div class="figure-contents">

<div class="mediaobject">

![News Groups List](images/ui/news_adm_01b.png)

</div>

</div>

</div>

  

</div>

You can also <span class="emphasis">*update*</span> the cache list of
newsgroups. Newsgroup names are (re)fetched in a batch background
scheduled task. This is because the list can be very long or the
connection to the news server could be slow. The status of the fetch is
indicated in the grey bar at the foot of the newsgroup list table.

For each newsgroup listed for a news server you can
<span class="emphasis">*update*</span> the messages fetched, view and
edit the <span class="emphasis">*Properties*</span> of the group, or
<span class="emphasis">*Remove*</span> the group from the list. Also you
can get previous 500 messages or to get new messages by clicking the
links at the bottom of the form shown below.

<div class="figure-float">

<div id="id15803" class="figure">

**Figure 6.178. Manage subscribed for Newsgroup**

<div class="figure-contents">

<div class="mediaobject">

![Manage subscribed for Newsgroup](images/ui/news_adm_01c.png)

</div>

</div>

</div>

  

</div>

<div id="newsaddgrp" class="section">

<div class="titlepage">

<div>

<div>

##### Add Newsgroup

</div>

</div>

</div>

From the "NNTP Servers" tab click on the "Edit Groups" link for a
registered News Server. Then click the <span class="emphasis">*Subscribe
to newsgroups*</span> link to subscribe to newsgroups on the server.

<div class="figure-float">

<div id="id15812" class="figure">

**Figure 6.179. Add Newsgroup**

<div class="figure-contents">

<div class="mediaobject">

![Add Newsgroup](images/ui/news_addgrp_01.png)

</div>

</div>

</div>

  

</div>

Once groups are selected you can use the
<span class="emphasis">*Subscribe Selected*</span> button to add the
groups.

Use the <span class="emphasis">*Back to servers list*</span> link to
return to the News Servers List page.

</div>

<div id="newssrvadd" class="section">

<div class="titlepage">

<div>

<div>

##### Adding New News Server

</div>

</div>

</div>

From Conductor NNTP/NNTP Servers you can add remote servers. The values
you need to provide in the form are as follows:

<span class="emphasis">*Server Address*</span> is the IP address or
hostname of the external news server.

<span class="emphasis">*Server Port*</span> is the port number that the
news server is listening on. By default news servers listen on port 119.

<span class="emphasis">*Username*</span> and
<span class="emphasis">*Password*</span> allow you to provide login
credentials if the server requires them.

<div class="figure-float">

<div id="id15831" class="figure">

**Figure 6.180. News Server Administration**

<div class="figure-contents">

<div class="mediaobject">

![News Server Administration](images/ui/news_add_01.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="newscliui" class="section">

<div class="titlepage">

<div>

<div>

##### Viewing Newsgroups

</div>

</div>

</div>

You can view the messages of a newsgroup either using the Conductor UI
going to NNTP/NNTP Servers/News Server/News Group, or using the ODS
Framework UI. In the second case you need to have the
ods_framework_dav.vad package and the ods_discussion_dav.vad package
installed. Then you can go from ODS to tab "Discussions" where will be
shown the list of available newsgroups. Each one has shown as link its
name, which leads to page where are listed its messages.

<div class="figure-float">

<div id="id15839" class="figure">

**Figure 6.181. View of messages in a newsgroup in ODS Discussions.**

<div class="figure-contents">

<div class="mediaobject">

![View of messages in a newsgroup in ODS
Discussions.](images/ui/news_lclsrvr_01.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="newsmsgft" class="section">

<div class="titlepage">

<div>

<div>

#### News Message Free Text Search

</div>

</div>

</div>

You can perform Free Text Search using the ODS search option.

</div>

</div>

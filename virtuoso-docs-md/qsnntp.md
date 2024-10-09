<div>

<div>

<div>

<div>

## 3.10. NNTP

</div>

</div>

</div>

Virtuoso supports the Network News Transfer Protocol used by Internet
newsgroup forums. NNTP servers manage the global network of collected
newsgroup postings and represent a vast repository of targeted
information archives. As an NNTP aggregator, Virtuoso enables
integration of multiple news forums around the world. All news content
in Virtuoso is dynamically indexed to provide keyword searches, enabling
rapid transformation of disparate text data into information. Virtuoso
also acts as an NNTP server, enabling creation of new Internet and
Intranet News Forums to leverage the global knowledge base into
eBusiness Intelligence.

<div>

<div>

<div>

<div>

### 3.10.1. NNTP Server Setup

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Enable Server

</div>

</div>

</div>

Before the NNTP server can be used, it has to be enabled to listen on
the NNTP port. This change is made in the configuration file.

For more details, refer to
<a href="newsserver.html#newssrvenable" class="link"
title="19.5.1. Enabling the NNTP Server">Enable NNTP Server</a> section.

</div>

<div>

<div>

<div>

<div>

#### Create/Attach News Groups

</div>

</div>

</div>

The definition of news groups is held in system tables.

For more details on inserting news groups by SQL command, refer to
<a href="newssrvadm.html#newssrvadd" class="link"
title="Adding New News Server">Add Groups to NNTP Server</a> section.
See also the <a href="newssrvadm.html" class="link"
title="6.2.11. Conductor News Server Administration">Conductor News
Server and Newsgroups Administration</a> section, to setup the groups in
the Visual Server Administration Interface.

</div>

<div>

<div>

<div>

<div>

#### Limit Groups

</div>

</div>

</div>

This is an optional step, appropriate if a news group is to be limited
for internal use only, or by a group of IP addresses. This is achieved
by creating an Access Control List (ACL) in the DB.DBA.NEWS_ACL table.
If no ACL is defined, then all groups are public readable and writable.

For table details, refer to <a href="newssrvtables.html" class="link"
title="23.6.10. NNTP Server Tables">NNTP Server Tables</a> section.

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 6.2.8. Replication & Synchronization

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Snapshot Replication

</div>

</div>

</div>

<div>

Conductor "Replication" offers manage Virtuoso Replication. You are
offered with "Basic", "Incremental", "Bidirectional Snapshot" and
"Transactional" sub-tabs.

<div>

- From

  <span class="emphasis">*Replication/Basic/Query(Table select)to
  local*</span>

  to replicate local table(s) to another data source click

  <span class="emphasis">*Create New Snapshot*</span>

  and follow the wizard.

- To copy the changes from the local table to the remote select some
  replications and press

  <span class="emphasis">*Synchronize*</span>

- To drop the replication definition without dropping the destination
  table select some replications and press

  <span class="emphasis">*Remove*</span>

- To drop the replication definition and the destination table select
  some replications and press

  <span class="emphasis">*Remove & Drop Remote*</span>

- To copy the changes from the local table to the remote automatically
  select some replications, enter minutes in

  <span class="emphasis">*Scheduled Interval*</span>

  and press

  <span class="emphasis">*Schedule*</span>

- To remove scheduled update select the replications enter 0 in
  "Scheduled Interval" and press Schedule

</div>

- <div>

  <div>

  **Figure 6.102. Snapshot Replication**

  <div>

  <div>

  ![Snapshot Replication](images/ui/replt_ss_01.png)

  </div>

  </div>

  </div>

    

  </div>

- <div>

  <div>

  **Figure 6.103. Snapshot Replication**

  <div>

  <div>

  ![Snapshot Replication](images/ui/replt_ss_add_01.png)

  </div>

  </div>

  </div>

    

  </div>

- <div>

  <div>

  **Figure 6.104. Snapshot Replication**

  <div>

  <div>

  ![Snapshot Replication](images/ui/replt_ss_add_02.png)

  </div>

  </div>

  </div>

    

  </div>

- <div>

  <div>

  **Figure 6.105. Snapshot Replication**

  <div>

  <div>

  ![Snapshot Replication](images/ui/replt_ss_add_03.png)

  </div>

  </div>

  </div>

    

  </div>

- <div>

  <div>

  **Figure 6.106. Snapshot Replication**

  <div>

  <div>

  ![Snapshot Replication](images/ui/replt_ss_add_05.png)

  </div>

  </div>

  </div>

    

  </div>

- <div>

  <div>

  **Figure 6.107. Snapshot Replication**

  <div>

  <div>

  ![Snapshot Replication](images/ui/replt_ss_add_06.png)

  </div>

  </div>

  </div>

    

  </div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Transactional Replication

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Publications

</div>

</div>

</div>

The Transaction Publication screen lists publications. You can add, edit
or remove publications as necessary, each time using the guide-lines of
the wizard.

<div>

<div>

**Figure 6.108. Transaction Replication - Publications**

<div>

<div>

![Transaction Replication - Publications](images/ui/repltranspub001.png)

</div>

</div>

</div>

  

</div>

|                                                                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Add a new publication by clicking on the <span class="emphasis">*Create*</span> button.                                                                            |
| Edit an existing publication by clicking on publication name.                                                                                                      |
| Remove publications by selecting their checkbox and clicking on the <span class="emphasis">*Delete*</span> button. Use caution, as this action cannot be reverted. |

When creating a new publication you must supply a name. At this point
you have the option to create an updateable publication - see the
<a href="bidirtransrepl.html" class="link"
title="13.3.6. Bi-Directional Transactional Replication">Bi-Directional
Transactional Replication</a> section for more details - which allows
updates to come from subscribers rather than being limited to
originating from the publisher only.

<div>

<div>

**Figure 6.109. Transaction Replication - New Publication**

<div>

<div>

![Transaction Replication - New
Publication](images/ui/repltranspub002.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.110. Transaction Replication - List of Publications**

<div>

<div>

![Transaction Replication - List of
Publications](images/ui/repltranspub002a.png)

</div>

</div>

</div>

  

</div>

Once a new publication has been made you can add database objects to it
using the <span class="emphasis">*Add ...*</span> buttons, or remove
them by selecting their checkbox and using the
<span class="emphasis">*Remove*</span> button. To add a new table to the
publication click on <span class="emphasis">*Add Table/Procedure*</span>
. Follow the wizard by choosing the appropriate database/catalog by
clicking on its name, you will then be presented with the tables within
it.

<div>

<div>

**Figure 6.111. Transaction Replication - Publish Tables and
Procedures**

<div>

<div>

![Transaction Replication - Publish Tables and
Procedures](images/ui/repltranspub003.png)

</div>

</div>

</div>

  

</div>

Select the tables to publish using the checkboxes and press
<span class="emphasis">*Add to Publication*</span> to add the tables and
continue.

Once returned the publication screen, the published tables will be
listed. Updatable publication will need conflict resolvers in case of
conflicting data arriving from a subscriber. Click on the table name to
manage the resolvers list.

<div>

<div>

**Figure 6.112. Transaction Replication - Published Items**

<div>

<div>

![Transaction Replication - Published
Items](images/ui/repltranspub004.png)

</div>

</div>

</div>

  

</div>

Use the <span class="emphasis">*Add*</span>
/<span class="emphasis">*Remove*</span> to add or remove selected
resolvers.

Click on Publication Item -\> <span class="emphasis">*New
Resolver*</span> to add a new resolver. You have the following details
to contend with:

<div>

- <span class="emphasis">*Name Suffix*</span>

  Conflict resolver name suffix.

- <span class="emphasis">*Order*</span>

  Resolver order number.

- <span class="emphasis">*Type*</span>

  The resolver type, one of: Insert, Update, or Delete for resolving
  such SQL queries.

- <span class="emphasis">*Class*</span>

  The kind of resolver. Class can be one of the following:

  |                                                                                                                                          |
  |------------------------------------------------------------------------------------------------------------------------------------------|
  | <span class="emphasis">*'max'*</span> row with maximum value of specified column wins                                                    |
  | <span class="emphasis">*'min'*</span> row with minimum value of specified column wins                                                    |
  | <span class="emphasis">*'ave'*</span> new value of specified column is calculated as: `current_val = (current_val + new_val) / 2`        |
  | <span class="emphasis">*'add'*</span> new value of specified column is calculated as: `current_val = current_val + (new_val - old_val) ` |
  | <span class="emphasis">*'pub_wins'*</span>                                                                                               |
  | <span class="emphasis">*'custom'*</span> publisher always wins                                                                           |
  | <span class="emphasis">*'sub_wins'*</span> subscriber always wins                                                                        |

- <span class="emphasis">*Column*</span>

  This should specify the column name if `class` is not one of
  'pub_wins', 'sub_wins' or 'custom'.

</div>

<div>

<div>

**Figure 6.113. Transaction Replication - Resolvers**

<div>

<div>

![Transaction Replication - Resolvers](images/ui/repltranspub006.png)

</div>

</div>

</div>

  

</div>

Click on Publication -\> <span class="emphasis">*Advanced
Options*</span> to set additional settings such as split size, default
copy mode of publication item, etc.

<div>

<div>

**Figure 6.114. Transaction Replication - Advanced**

<div>

<div>

![Transaction Replication - Advanced](images/ui/repltranspub005.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Subscriptions

</div>

</div>

</div>

<div>

- To add new subscription click at New Subscription and follow the
  wizard.

- Click Edit to change properties.

- To drop subscription click at link Drop.

- To synchronize subscription click the Sync button.

- To disconnect all subscriptions click at Disconnect all button.

- To load image file click at Load image button and follow the wizard.

</div>

<div>

<div>

**Figure 6.115. Transaction Replication - Subscription**

<div>

<div>

![Transaction Replication -
Subscription](images/ui/replt_trans_sub_01.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.116. Transaction Replication - Subscription**

<div>

<div>

![Transaction Replication -
Subscription](images/ui/replt_trans_sub_02.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

</div>

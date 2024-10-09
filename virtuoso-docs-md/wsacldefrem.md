<div>

<div>

<div>

<div>

### 14.2.2. ACL Definition/Removal

</div>

</div>

</div>

ACL's can be managed from the administration web interface using the
following steps.

<div>

- From Admin UI main menu open "System Admin" node.

- Go to Security -\> Access Control

- By default three default ACLs are listed:

  |                                                                                            |
  |--------------------------------------------------------------------------------------------|
  | HTTP - rules for the Web server                                                            |
  | NEWS - rules for the Internet News                                                         |
  | PROXY - rules for the Web Proxy Server                                                     |
  | PSH and PSH-SSL - available only when the <a                                               
   href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/pubsubhub_dav.vad"  
   class="ulink" target="_top">pubsubhub_dav.vad</a> is installed.                             |

  <div>

  <div>

  **Figure 14.13. Access Control**

  <div>

  <div>

  ![Access Control](images/ui/admacl.png)

  </div>

  </div>

  </div>

    

  </div>

- New ACLs can be added by entering a list name and clicking "Add"
  button.

- Existing ACLs can be edited by clicking on the link "Edit" beside each
  listed ACL.

- To add new rules, enter the requested information and press button
  "Add".

- To change the order of the rules use the "top", "bottom", "up" and
  "down" links.

- ACL's can be removed using the Delete button.

</div>

Alternately the HTTP_ACL table can be directly manipulated with SQL. To
add new rule:

``` programlisting
INSERT INTO HTTP_ACL (HA_LIST, HA_ORDER, HA_CLIENT_IP, HA_RATE, HA_FLAG) values
('list_name', <order number>, '*pattern*', <hits_per_second_number>, [1/0]);
```

To remove existing rule:

``` programlisting
DELETE from HTTP_ACL where HA_LIST = 'list_name' and HA_ORDER = <order number>
and HA_FLAG = [1/0] and HA_CLIENT_IP = '*pattern*';
```

</div>

<div>

<div>

<div>

<div>

### 17.15.5. Process archiving

</div>

</div>

</div>

When an instance of a BPEL process is completed it will be archived and
purged from system after a configurable time interval. The interval is
settable via 'InstanceExpiryDelay' configuration option (see below how
to change). The default interval for archiving is one day.

The archive file contains status of the instance which is archived,
execution path of the activities when execution is completed, value of
the variables and partner links.

The format of the archive file is as follows:

``` programlisting
<instances>
  <instance
xml:id="[instance id]">
    <status code="[2 - success |3 - error]" error="[error description]"/>
    <execution>
    <node
xml:id="[activity id]" type="[activity type]"/>
    ... more nodes may follow ...
    </execution>
    <variables>
    <variable name="[name of the variable]">... variable value ...</variable>
    ... more variables may follow ...
    </variables>
    <partnerLinks>
      <partnerLink name="[name of the partner link]">
        <EndpointReference>
        <Address>... partner link endpoint ...</Address>
        </EndpointReference>
      </partnerLink>
      ... more partner links may follow ...
    </partnerLinks>
  </instance>
</instances>
      
```

</div>

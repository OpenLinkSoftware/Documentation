<div id="virtuosospongerfacentexamples" class="section">

<div class="titlepage">

<div>

<div>

### 16.12.2. Examples

</div>

</div>

</div>

Note: in all examples the default namespace
xmlns="http://openlinksw.com/services/facets/1.0/" is omitted for
brevity.

For people called Mike:

``` programlisting
<query>
  <text>Mike</text>
  <view type="text"/>
</query>
```

To open the list of people who Mike knows:

``` programlisting
<query>
  <text>Mike</text>
  <view type="properties"/>
</query>
```

To show the list of subjects Mike knows:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <view type="list" />
  </property>
</query>
```

To show the properties of people Mike knows:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <view type="properties" />
  </property>
</query>
```

To show the names:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <view type="list" />
    </property>
  </property>
</query>
```

To specify one named Joe:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
     <property iri="foaf:name>
        <value>Joe</value>
     </property>
    <view type="properties" />
  </property>
</query>
```

This lists the properties of the friends of Mike that are called Joe.

To show the Mikes that know a Joe, one would change the shown variable
in the navigation and get:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
   </property>
   <view type="text" />
</query>
```

This would be the search summaries of subjects with Mike in some field
that know a subject with name Joe.

Now to specify that Mike must be a member of a discussion board:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
     <value>Joe</value>
   </property>
  </property>
  <view type="property-in" />
</query>
```

This lists the properties of triples whom object is Mike. Pick
sioc:member_of

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
  </property>
  <property-of iri="sioc:member_of>
    <view type="list" />
  </property-of>
</query>
```

This would show things where Mike is a member. To specify that the thing
must be a forum:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
  </property>
  <property-of iri="sioc:member_of>
    <view type="classes" />
  </property-of>
</query>
```

This shows classes of things where Mike is a member Clicking on
sioc:Forum gives:

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
  </property>
  <property-of iri="sioc:member_of>
    <class iri="sioc:Forum" />
    <view type="classes"/>
  </property-of>
</query>
```

The view stays with classes, but now scoped to the classes of things
where Mike is a member that are instances of sioc:Forum.

To go look at the list of Mikes with the added restriction, click the
shown variable in the navigation and set it to s1.

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
  </property>
  <property-of iri="sioc:member_of>
   <class iri="sioc:Forum" />
  </property-of>
  <view type="list"/>
</query>
```

To say that Joe must also have a geekCode, One clicks the shown variable
and sets it to s2 and the view to properties.

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
    <view type="properties"/>
  </property>
  <property-of iri="sioc:member_of>
    <class iri="sioc:Forum" />
   </property-of>
</query>
```

Pick geekCode

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
    <property iri="geekCode">
      <view type="list"/>
    </property>
  </property>
  <property-of iri="sioc:member_of>
    <class iri="sioc:Forum" />
  </property-of>
</query>
```

We specify no restriction on the geekCode. Click the shown variable to
take the focus back to Mike.

``` programlisting
<query>
  <text>Mike</text>
  <property iri="foaf:knows>
    <property iri="foaf:name>
      <value>Joe</value>
    </property>
    <property iri="geekCode"></property>
  </property>
  <property-of iri="sioc:member_of>
    <class iri="sioc:Forum" />
  </property-of>
  <view type="text"/>
</query>
```

</div>

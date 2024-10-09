<div>

<div>

<div>

<div>

### 15.4.4. XML Schema & DTD Functions

</div>

</div>

</div>

The following functions can be used to generate XML Schema or DTD
information about a given SQL query:

|                                                                        |
|------------------------------------------------------------------------|
| <a href="fn_xml_auto_schema.html" class="link"                         
 title="xml_auto_schema"><code                                           
 class="function">xml_auto_schema()</code></a>                           |
| <a href="fn_xml_auto_dtd.html" class="link" title="xml_auto_dtd"><code 
 class="function">xml_auto_dtd()</code></a>                              |

<div>

**Example 15.12. Generating XML Schema and DTD Data**

<div>

This example shows trivial use of the two functions `xml_auto_schema()`
and `xml_auto_dtd()` .

``` programlisting
SQL> select xml_auto_schema('select u_name from sys_users', 'root');
callret
VARCHAR
_______________________________________________________________________________

<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">

 <xsd:annotation>
  <xsd:documentation>
   Schema for output of the following SQL statement:

   <![CDATA[select u_name from sys_users]]>

  </xsd:documentation>
 </xsd:annotation>

 <xsd:element name="root" type="root__Type"/>

 <xsd:complexType name="root__Type">
  <xsd:sequence>
   <xsd:element name="SYS_USERS" type="SYS_USERS_Type" minOccurs="0" maxOccurs="unbounded"/>
  </xsd:sequence>
 </xsd:complexType>

 <xsd:complexType name="SYS_USERS_Type">
  <xsd:attribute name="U_NAME" type="xsd:string"/>
 </xsd:complexType>

</xsd:schema>

1 Rows. -- 1843 msec.
SQL> select xml_auto_dtd('select u_name from sys_users', 'root');
callret
VARCHAR
_______________________________________________________________________________

<!-- dtd for output of the following SQL statement:
select u_name from sys_users
-->

<!ELEMENT root (#PCDATA | SYS_USERS)* >
<!ELEMENT SYS_USERS (#PCDATA)* >
<!ATTLIST SYS_USERS
        U_NAME  CDATA   #IMPLIED        >

1 Rows. -- 411 msec.
```

</div>

</div>

  

</div>

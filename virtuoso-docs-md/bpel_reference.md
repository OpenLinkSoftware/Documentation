<div>

<div>

<div>

<div>

## 17.15. BPEL Reference

</div>

</div>

</div>

**Introduction. ** Business Process Execution Language for Web Services
(called BPEL4WS or simply BPEL in the rest of this chapter) provides a
means of specifying interactions between web services for accomplishing
a potentially long running business task.

**Used terms . **

<div>

- **WSDL . ** Web Services Description Language as described in the
  corresponding W3C proposed recommendation. This is a notation for
  declaring services and the types of data they accept and produce. Also
  the term may be used to refer to the document containing a WSDL
  description.

- **partner . ** A service or application which interacts with a BPEL
  process.

- **(BPEL) script . ** A document containing BPEL compatible XML
  constructs.

- **(BPEL process) instance . ** An instance of a BPEL process, can be
  running, suspended, aborted or finished.

- **activity . ** An activity is a building block of a BPEL script.
  Receiving data, invoking other web services, programming language like
  control structures are all examples of activities.

- **portType . ** Container for set of abstract operations see below.

- **operation . ** An abstract black-box that have an XML input or/and
  output. Services potentially supports four types of operations:
  one-way, request-response, notification and solicit-response; this
  depends of input and/or output allowed and what is their order. The
  BPEL4WS uses one-way and request-response operations. Operations are
  grouped in 'ports' which define what operations a particular service
  supports.

- **message . ** An abstract XML fragment that is used for operation
  input and output. In particular this is used inside SOAP Envelope and
  for value of the BPEL variables. Also the WSDL specification specifies
  how abstract messages will be used as concrete messages using the SOAP
  protocol and which encoding will be used.

</div>

<div>

<div>

<div>

<div>

### 17.15.1. Activities

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Common attributes and elements

</div>

</div>

</div>

Every BPEL activity accepts the following standard attributes: 'name',
'joinCondition' and 'suppressJoinFailure'. The 'name' attribute is an
optional unique within the script NCName (as defined in the XMLSchema)
identifying the activity. The 'joinCondition' is a boolean expression
which determine how incoming links' state will be tested, by default
this is 'true()' which means the logical OR of the states of incoming
links. The 'suppressJoinFailure' is a flag to raise or not exception if
join condition fails, by default this is 'no'.

The common elements for every activity are 'target' and 'source'. These
elements are used together with links and used to designate which link
the current activity depends on or for which one it is a prerequisite.
See also section for 'flow' activity below.

</div>

<div>

<div>

<div>

<div>

#### receive

</div>

</div>

</div>

This allows the business process to do a blocking wait for a particular
message to arrive.

A BPEL process instance is created by a receive activity with the
createInstance attribute set to true.

<div>

<span class="term">partnerLink </span>  
name of a partner declared in the script from which the process is to
receive a message.

<span class="term">portType </span>  
name of the 'port' as declared in corresponding WSDL file.

<span class="term">operation </span>  
name of the operation

<span class="term">variable </span>  
name of the variable to which the received message will be assigned.

<span class="term">createInstance </span>  
used to make instance of the BPEL process and start its execution.

</div>

``` programlisting
<receive partnerLink="ncname" portType="qname" operation="ncname"
    variable="ncname"? createInstance="yes|no"?
    standard-attributes>
    standard-elements
    <correlations>?
        <correlation set="ncname" initiate="yes|no"?/>+
    </correlations>
</receive>
          
```

</div>

<div>

<div>

<div>

<div>

#### reply

</div>

</div>

</div>

allows the business process to send a message in reply to a message that
was received through a \<receive\>

<div>

<span class="term">partnerLink </span>  
name of a partner declared in the script to which to send a message.

<span class="term">portType </span>  
name of the 'port' as declared in corresponding WSDL file.

<span class="term">operation </span>  
name of the operation

<span class="term">variable </span>  
name of the variable whose value will be used as output message.

<span class="term">faultName </span>  

</div>

``` programlisting
<reply partnerLink="ncname" portType="qname" operation="ncname"
    variable="ncname"? faultName="qname"?
    standard-attributes>
    standard-elements
    <correlations>?
        <correlation set="ncname" initiate="yes|no"?/>+
    </correlations>
</reply>
          
```

</div>

<div>

<div>

<div>

<div>

#### invoke

</div>

</div>

</div>

This allows the business process to invoke a one-way or request-response
operation on a portType offered by a partner. When both 'inputVariable'
and 'outputVariable' are specified this means request-response operation
will be performed. Please note that the operation is defined primarily
in the partner's WSDL.

<div>

<span class="term">partnerLink </span>  
name of a partner declared in the script to who send a message and
optionally receive a response.

<span class="term">portType </span>  
name of the 'port' as declared in corresponding WSDL file.

<span class="term">operation </span>  
name of the operation to invoke

<span class="term">inputVariable </span>  
name of the variable whose value will be used as the message to the
partner.

<span class="term">outputVariable </span>  
name of the variable to which the response will be assigned.

</div>

``` programlisting
<invoke partnerLink="ncname" portType="qname" operation="ncname"
    inputVariable="ncname"? outputVariable="ncname"?
    standard-attributes>
    standard-elements
    <correlations>?
        <correlation set="ncname" initiate="yes|no"?
            pattern="in|out|out-in"/>+
    </correlations>
    <catch faultName="qname" faultVariable="ncname"?>*
        activity
    </catch>
    <catchAll>?
        activity
    </catchAll>
    <compensationHandler>?
        activity
    </compensationHandler>
</invoke>
          
```

</div>

<div>

<div>

<div>

<div>

#### assign

</div>

</div>

</div>

can be used to update the values of variables with new data. An
\<assign\> construct can contain any number of elementary assignments
(copy sub-elements).

``` programlisting
<assign standard-attributes>
    standard-elements
    <copy>+
        from-spec
        to-spec
    </copy>
</assign>
```

<div>

<div>

<div>

<div>

##### from-spec

</div>

</div>

</div>

This represents in \<copy\> the right part of the assignment.

``` programlisting
<from variable="ncname" part="ncname"? query="xpath-expression"?/>
<from partnerLink="ncname" endpointReference="myRole|partnerRole"/>
<from variable="ncname" property="qname"/>
<from expression="general-expr"/>
<from>literal value</from>
```

</div>

<div>

<div>

<div>

<div>

##### to-spec

</div>

</div>

</div>

This represents in \<copy\> the l-value of the assignment.

``` programlisting
<from variable="ncname" part="ncname"? query="xpath-expression"?/>
<from partnerLink="ncname" endpointReference="myRole|partnerRole"/>
<from variable="ncname" property="qname"/>
```

</div>

</div>

<div>

<div>

<div>

<div>

#### throw

</div>

</div>

</div>

generates a fault from inside the business process

<div>

<span class="term">faultName </span>  
the fault code to be thrown.

<span class="term">faultVariable </span>  

</div>

``` programlisting
<throw faultName="qname" faultVariable="ncname"? standard-attributes>
    standard-elements
</throw>
          
```

</div>

<div>

<div>

<div>

<div>

#### terminate

</div>

</div>

</div>

Used to immediately terminate the execution of a business process
instance.

``` programlisting
<terminate standard-attributes>
    standard-elements
</terminate>
          
```

</div>

<div>

<div>

<div>

<div>

#### wait

</div>

</div>

</div>

Wait until a given point in time or for a specified duration.

<div>

<span class="term">for </span>  
an duration expression as defined in XMLSchema (for example PT10S)

<span class="term">until </span>  
an date time expression as defined in XMLSchema

</div>

``` programlisting
<wait (for="duration-expr" | until="deadline-expr") standard-attributes>
    standard-elements
</wait>
          
```

</div>

<div>

<div>

<div>

<div>

#### empty

</div>

</div>

</div>

insert a "no-op" instruction into a business process

``` programlisting
<empty standard-attributes>
    standard-elements
</empty>
          
```

</div>

<div>

<div>

<div>

<div>

#### sequence

</div>

</div>

</div>

define a collection of activities to be performed sequentially in
lexical order

``` programlisting
<sequence standard-attributes>
    standard-elementsactivity+
</sequence>
          
```

</div>

<div>

<div>

<div>

<div>

#### switch

</div>

</div>

</div>

Select exactly one branch of activity from a set of choices

<div>

<span class="term">case </span>  
the branch which will be executed if 'condition' attribute returns true.

<span class="term">otherwise </span>  
will be executed if all 'case' conditions are evaluated to false.

</div>

``` programlisting
<switch standard-attributes>
    standard-elements
    <case condition="bool-expr">+
        activity
    </case>
    <otherwise>?
        activity
    </otherwise>
</switch>
          
```

</div>

<div>

<div>

<div>

<div>

#### while

</div>

</div>

</div>

Repeat activity while a condition is true.

<div>

<span class="term">condition </span>  
an XPath expression which will be evaluated every time before contained
activities. If this evaluates to false the loop finishes.

</div>

``` programlisting
<while condition="bool-expr" standard-attributes>
    standard-elementsactivity
</while>
          
```

</div>

<div>

<div>

<div>

<div>

#### pick

</div>

</div>

</div>

This blocks and waits for a suitable message to arrive or for a time-out
expire. When one of the events specified in the body of the pick occurs
the pick completes. Only one of the activities in the body of the pick
will actually take place.

<div>

<span class="term">createInstance </span>  
This is an alternative of the 'receive' to make a new process instance.
And can be expressed as: 'pick' plus 'onMessage' equals to 'receive'
activity.

</div>

``` programlisting
<pick createInstance="yes|no"? standard-attributes>
    standard-elements
    <onMessage partnerLink="ncname" portType="qname"
        operation="ncname" variable="ncname"?>+
        <correlations>?
        <correlation set="ncname" initiate="yes|no"?/>+
    </correlations>
    activity
    </onMessage>
    <onAlarm (for="duration-expr" | until="deadline-expr")>*
    activity
    </onAlarm>
</pick>
```

<div>

<div>

<div>

<div>

##### onMessage

</div>

</div>

</div>

This is to wait for an incoming message from given partner.

The attributes are the same as for
<a href="#bpelact_receive" class="ulink" target="_top">receive</a>
activity

</div>

<div>

<div>

<div>

<div>

##### onAlarm

</div>

</div>

</div>

This will register a time-wait object whose expiration will trigger the
pick. Obviously no more than one can be specified in a given 'pick'

The attributes are the same as for the
<a href="#bpelact_wait" class="ulink" target="_top">wait</a> activity

</div>

</div>

<div>

<div>

<div>

<div>

#### scope

</div>

</div>

</div>

defines a nested activity with its own associated variables, fault
handlers, and compensation handler

<div>

<span class="term">variableAccessSerializable </span>  

</div>

``` programlisting
<scope variableAccessSerializable="yes|no" standard-attributes>
    standard-elements
    <variables/>?
    <correlationSets/>?
    <faultHandlers/>?
    <compensationHandler/>?
    <eventHandlers/>?
    activity
</scope>
          
```

</div>

<div>

<div>

<div>

<div>

#### flow

</div>

</div>

</div>

Specifies one or more activities to be performed concurrently.

``` programlisting
<flow standard-attributes>
    standard-elements
    <links>?
        <link name="ncname"/>+
    </links>
    activity+
</flow>
          
```

</div>

<div>

<div>

<div>

<div>

#### compensate

</div>

</div>

</div>

This is used to invoke compensation on an inner scope that has already
completed normally. This construct can be invoked only from within a
fault handler or another compensation handler

``` programlisting
<compensate scope="ncname"? standard-attributes>
    standard-elements
</compensate>
          
```

</div>

<div>

<div>

<div>

<div>

#### compensationHandler

</div>

</div>

</div>

``` programlisting
<compensationHandler>?
    activity
</compensationHandler>
          
```

</div>

<div>

<div>

<div>

<div>

#### faultHandlers

</div>

</div>

</div>

``` programlisting
<faultHandlers>?
    <catch faultName="qname"? faultVariable="ncname"?>*
        activity
    </catch>
    <catchAll>?
        activity
    </catchAll>
</faultHandlers>
          
```

<div>

<div>

<div>

<div>

##### catch

</div>

</div>

</div>

This container will be executed whose 'faultName' attribute value
matches the thrown fault.

</div>

<div>

<div>

<div>

<div>

##### catchAll

</div>

</div>

</div>

This container will be executed if non of the 'catch' containers are
matched, so if no 'catchAll' is specified, the contained scopes will be
compensated and the fault will be re-thrown to the outer scope.

</div>

</div>

<div>

<div>

<div>

<div>

#### eventHandlers

</div>

</div>

</div>

This is a container for events, thus it can contain onMessage or/and
onAlarm events. Semantic of the onMessage and onAlarm is same as defined
in <a href="#bpelact_pick" class="ulink" target="_top">pick</a>
activity, the difference is that here these can be executed
asynchronously while the events of the defining scope are running. The
events in an event handler section may thus interrupt the execution of
the body of the scope. This feature can be used for supporting
asynchronous cancel messages or timeouts imposed on a whole sequence of
operations..

``` programlisting
<eventHandlers>?
    <onMessage partnerLink="ncname" portType="qname"
    operation="ncname"
    variable="ncname"?>*

    <correlations>?
        <correlation set="ncname" initiate="yes|no"/>+
    </correlations>
    activity
    </onMessage>
    <onAlarm for="duration-expr"? until="deadline-expr"?>*
    activity
    </onAlarm>
</eventHandlers>
          
```

</div>

<div>

<div>

<div>

<div>

#### exec

</div>

</div>

</div>

This is a specific extension of the Virtuoso BPEL implementation. The
exec activity allows executing SQL code from inside a BPEL process
without having to define a distinct SOAP service for this.

<div>

<span class="term">binding </span>  
only "SQL", "JAVA" and "CLR" are currently permitted.

</div>

``` programlisting
<bpelv:exec binding="SQL">
    insert into dummy values ('hello world');
</bpelv:exec>
          
```

<div>

<div>

<div>

<div>

##### SQL execution

</div>

</div>

</div>

The additional procedures BPEL.BPEL.setVariableData and
BPEL.BPEL.getVariableData allow manipulating BPEL variables. See
<a href="#bpelapi" class="ulink" target="_top">SQL API</a> for details.

All errors occurring during the SQL execution are translated into BPEL
errors.

</div>

<div>

<div>

<div>

<div>

##### Java execution

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Configuration

</div>

</div>

</div>

First of all, the java support in BPEL4WS is available only for java
enabled virtuoso servers. In order to enable java support the following
administration steps need to be taken:

<div>

- 1\. Make java compiler (javac) available for virtuoso server

- 2\. Enable "system" call by setting the AllowOSCalls? parameter in
  virtuoso.ini to 1.

- 3\. Add "classlib" directory to CLASSPATH

</div>

After the BPEL4WS package has been installed, the server needs to be
restarted.

The BPEL4WS package creates the classlib directory in the server's root
with BpelVarsAdaptor?.class. This directory and this file are necessary
for the proper operation of the Java interface.

</div>

<div>

<div>

<div>

<div>

###### Using java code in BPEL4WS

</div>

</div>

</div>

There are two elements which support java execution in BPEL4WS scripts:
\<bpelv:exec binding="JAVA" import?\> (namespace is
"http://www.openlinksw.com/virtuoso/bpel") and the Oracle compatible
form \<bpelx:exec import?\> (namespace is
"http://schemas.oracle.com/bpel/extension"). These tags are equal.

If the tag contains the "import" attribute the appropriate package will
be imported. Example:

``` programlisting
<bpelx:exec import="java.util.*"/>
        
```

Otherwise, the included code will be executed. It is suggested to use
\<\![CDATA\[ statement for representing the java code. Example:

``` programlisting
<bpelx:exec>
   System.out.println("getVariableData returned: " + getVariableData ("request", "req_payload", "/v:destRequest/v:city"));

   setVariableData ("res",
         "repl_payload",
         "/v:destResponse/v:country",
         "KZ");
</bpelx:exec>
        
```

The two "functions" are available for accessing script variables:
setVariableData and getVariableData (analogs of the xpath functions with
same names).

``` programlisting
void setVariableData (String var_name, String part, String query_path, Object value);
        
```

sets the variable. The value to be set is restricted to be string or
integer in this version.

``` programlisting
getVariableData
        
```

is a full analog of xpath function getVariableData. See details below.

Note, the activity does not commit changes to the database until it
finishes successfully, so if in a case of exception the variables are
kept untouched. This also means that deadlocks can occur.

The communication errors must be handled and processed in the java code
itself.

If some unhandled exception occurs in java code, it will be translated
to a BPEL error. See details in the next section.

</div>

<div>

<div>

<div>

<div>

###### Errors

</div>

</div>

</div>

Two types of errors can be signalled:

<div>

- 1\. upload time exceptions

- 2\. runtime exceptions

</div>

The first type exceptions are related to configuration and java syntax
errors. These are as follows:

<div>

- 1\. \[BPELX\] The "system" call is disabled, it is needed for use java
  code in BPEL4WS scripts. \* This error is signalled when the
  "AllowOSCalls" is set to 0. So the engine can not call java compiler.
  It One must set this parameter in ini file to 1 and restart the server
  to resolve this issue.

- 2\. \[BPELX\] Compilation of java code for NAME failed. Try to call
  "javac NAME.java" for details. \* The compilation of generated class
  for the activity has failed. Try to call the suggested operation from
  command prompt with the same PATH and CLASSPATH global variables to
  see the javac output.

</div>

Runtime errors not handled by java method itself are translated to the
BPEL fault in the following form:

``` programlisting
<bpws:javaFault sqlState="SQLSTATE">
 error message
</bpws:javaFault>
        
```

this error can be handled by BPEL fault handler. Here is an example:

``` programlisting
...
    <receive partnerLink="caller" portType="v:dest" operation="check_dest" variable="request" createInstance="yes"/>
    <scope>
      <faultHandlers>
        <catch faultName="bpws:javaFault" faultVariable="error">
          <assign>
            <copy>
              <from variable="error" query="/javaFault"/>
              <to variable="res" part="repl_payload" query="/destResponse/country"/>
            </copy>
          </assign>
        </catch>
      </faultHandlers>
      <bpelv:exec binding="JAVA" name="invokeSomething"><![CDATA[
   System.out.println("Executing Java exec in BPEL");
   System.out.println("getVariableData returned: " + getVariableData ("request", "req_payload", "/v:destRequest/v:city"));

   setVariableData ("res",
         "repl_payload",
         "/destResponse/country",
         "UK");
   if (true)
     throw (new Exception("test"));
   ]] >
       </bpelv:exec>
     </scope>
    <reply partnerLink="caller" portType="v:dest" operation="check_dest" variable="res"/>
...
        
```

In this code the handler for java exception is set:

``` programlisting
...
        <catch faultName="bpws:javaFault" faultVariable="error">
          <assign>
            <copy>
              <from variable="error" query="/javaFault"/>
              <to variable="res" part="repl_payload" query="/destResponse/country"/>
            </copy>
          </assign>
        </catch>
...
        
```

The handler takes the error message from the variable which holds it
("error") and puts it into the response variable.

</div>

<div>

<div>

<div>

<div>

###### BPEL variables accessors

</div>

</div>

</div>

``` programlisting
void setVariableData (String var_name, String part, String query_path,
        Object value)
        
```

\- changes BPEL variable named var_name. The "part" is a part of the
message stored in the variable. "query_path" selects the data in the
variable to be changed. The "value" can be only string or integer, so if
several subdata need to be changed the setVariableData must be called
several times. If the "part" and "query_path" must be ignored their can
be passed as empty strings ("").

``` programlisting
String getVariableData (String var_name, String part, String query)
        
```

\- returns selected data from the part named by "part" argument of
variable named by "var_name" argument. If the selection failed the NULL
is returned.

</div>

<div>

<div>

<div>

<div>

###### Special variables

</div>

</div>

</div>

There are two special variables: "variables" and "xmlnss_pre". They can
be changed in the java code, in this case the behaviour of the engine is
unpredictable. So, it is strongly recommended do not use these
variables.

</div>

<div>

<div>

<div>

<div>

###### JavaMail usage example

</div>

</div>

</div>

``` programlisting
<?xml version="1.0"?>
<process xmlns:jsm="urn:java:sendMail"
    xmlns="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
    name="javaSendMail"
    targetNamespace="urn:java:sendMail"
    xmlns:bpelx="http://schemas.oracle.com/bpel/extension"
    xmlns:bpelv="http://www.openlinksw.com/virtuoso/bpel">

  <bpelv:exec binding="JAVA" import="java.io.*"/>
  <bpelv:exec binding="JAVA" import="java.net.InetAddress"/>
  <bpelv:exec binding="JAVA" import="java.util.Properties"/>
  <bpelv:exec binding="JAVA" import="java.util.Date"/>
  <bpelv:exec binding="JAVA" import="javax.mail.*"/>
  <bpelv:exec binding="JAVA" import="javax.mail.internet.*"/>
  <bpelv:exec binding="JAVA" import="com.sun.mail.smtp.*"/>

  <partnerLinks>
    <partnerLink name="caller" partnerLinkType="jsm:dest"/>
  </partnerLinks>

  <variables>
    <variable name="request" messageType="jsm:destRequestMessage"/>
    <variable name="res" messageType="jsm:destResponseMessage"/>
  </variables>
  <sequence>
    <receive partnerLink="caller" portType="jsm:dest" operation="send" variable="request" createInstance="yes"/>
    <bpelv:exec binding="JAVA" name="sendMail"><![CDATA[
    String  to, subject = null, from = null;
    String mailhost = (String) getVariableData ("request", "req_payload", "/jsm:destRequest/jsm:mailhost");
    String mailer = "OpenLink Virtuoso[BPEL script]";
    try {
            to = (String) getVariableData ("request", "req_payload", "/jsm:destRequest/jsm:to");
            subject = (String) getVariableData ("request", "req_payload", "/jsm:destRequest/jsm:subject");

        Properties props = System.getProperties();
        props.put("mail.smtp.host", mailhost);
        Session session = Session.getInstance(props, null);

        Message msg = new MimeMessage(session);
        if (from != null)
            msg.setFrom(new InternetAddress(from));
        else
            msg.setFrom();
        msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to, false));
        msg.setSubject(subject);
            msg.setText ((String)getVariableData ("request", "req_payload", "/jsm:destRequest/jsm:text"));

        msg.setHeader("X-Mailer", mailer);
        msg.setSentDate(new Date());
        SMTPTransport t = (SMTPTransport)session.getTransport("smtp");
        try {
            t.connect();
            t.sendMessage(msg, msg.getAllRecipients());
        } finally {
            System.out.println("Response: " +
                        t.getLastServerResponse());
            t.close();
        }

            System.out.println("\nMail was sent successfully.");
        setVariableData ("res",
            "repl_payload",
            "/jsm:destResponse/jsm:status",
            "OK");

    } catch (Exception e) {
        String err_str = "Failed: " + e.toString();
        e.printStackTrace();
        if (e instanceof SendFailedException) {
        MessagingException sfe = (MessagingException)e;
        if (sfe instanceof SMTPSendFailedException) {
            SMTPSendFailedException ssfe =
                    (SMTPSendFailedException)sfe;
            System.out.println("SMTP SEND FAILED:");
            System.out.println(ssfe.toString());
            System.out.println("  Command: " + ssfe.getCommand());
            System.out.println("  RetCode: " + ssfe.getReturnCode());
            System.out.println("  Response: " + ssfe.getMessage());
        } else {
            System.out.println("Send failed: " + sfe.toString());
        }
        Exception ne;
        while ((ne = sfe.getNextException()) != null &&
            ne instanceof MessagingException) {
            sfe = (MessagingException)ne;
            if (sfe instanceof SMTPAddressFailedException) {
            SMTPAddressFailedException ssfe =
                    (SMTPAddressFailedException)sfe;
            System.out.println("ADDRESS FAILED:");
            System.out.println(ssfe.toString());
            System.out.println("  Address: " + ssfe.getAddress());
            System.out.println("  Command: " + ssfe.getCommand());
            System.out.println("  RetCode: " + ssfe.getReturnCode());
            System.out.println("  Response: " + ssfe.getMessage());
            } else if (sfe instanceof SMTPAddressSucceededException) {
            System.out.println("ADDRESS SUCCEEDED:");
            SMTPAddressSucceededException ssfe =
                    (SMTPAddressSucceededException)sfe;
            System.out.println(ssfe.toString());
            System.out.println("  Address: " + ssfe.getAddress());
            System.out.println("  Command: " + ssfe.getCommand());
            System.out.println("  RetCode: " + ssfe.getReturnCode());
            System.out.println("  Response: " + ssfe.getMessage());
            }
        }
        }
        setVariableData ("res",
            "repl_payload",
            "/jsm:destResponse/jsm:status",
            err_str);
    }

    ]] ></bpelv:exec>
    <reply partnerLink="caller" portType="jsm:dest" operation="send" variable="res"/>
  </sequence>
</process>
        
```

and support WSDL file:

``` programlisting
<?xml version="1.0"?>
<definitions name="javaSendMail"
  targetNamespace="urn:java:sendMail"
  xmlns:jsm="urn:java:sendMail"
  xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
  xmlns="http://schemas.xmlsoap.org/wsdl/">
  <types>
    <schema attributeFormDefault="qualified" elementFormDefault="qualified"
      targetNamespace="urn:java:sendMail"
      xmlns="http://www.w3.org/2001/XMLSchema">
      <element name="destRequest">
        <complexType>
          <sequence>
            <element name="mailhost" type="string"/>
            <element name="to" type="string"/>
            <element name="subject" type="string"/>
            <element name="text" type="string"/>
          </sequence>
        </complexType>
      </element>
      <element name="destResponse">
        <complexType>
          <sequence>
        <element name="status" type="string"/>
          </sequence>
        </complexType>
      </element>
    </schema>
  </types>
  <message name="destRequestMessage">
    <part name="req_payload" element="jsm:destRequest"/>
  </message>
  <message name="destResponseMessage">
    <part name="repl_payload" element="jsm:destResponse"/>
  </message>
  <portType name="dest">
    <operation name="send">
      <input  message="jsm:destRequestMessage" />
      <output message="jsm:destResponseMessage"/>
    </operation>
   </portType>
   <plnk:partnerLinkType name="dest">
     <plnk:role name="destProvider">
       <plnk:portType name="jsm:dest"/>
     </plnk:role>
   </plnk:partnerLinkType>
</definitions>
        
```

</div>

</div>

<div>

<div>

<div>

<div>

##### .NET CLR execution

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Configuration

</div>

</div>

</div>

The CLR is available only for CLR enabled Virtuoso servers. In order to
configure the server for CLR support in BPEL4WS engine the following
administration steps need to be taken:

<div>

- 1\. Initiate "CLRAssembliesDir" configuration entry ("Directory where
  .NET CLR assemblies must be stored") by the path where
  "virt_bpel4ws.dll", "virtclr.dll" etc are stored.

</div>

</div>

<div>

<div>

<div>

<div>

###### Using the C# code in BPEL4WS

</div>

</div>

</div>

The tag for supporting CLR is \<exec binding="CLR" \[using \| ref \]\>.

\<exec\> with "using" attribute relates to "using" directive in C# code.

``` programlisting
<bpelv:exec binding="CLR" using="System"/>
      
```

in BPEL file is a substitution of

``` programlisting
using System;
        
```

statement in the C# code.

To import assemblies (with a manifest) the \<exec\> element with "ref"
attribute must be used:

``` programlisting
<bpelv:exec binding="CLR" ref="metad1.dll"/>
<bpelv:exec binding="CLR" ref="d:\\myassemblies\\sms_service.dll"/>
        
```

If the tag does not contain these attributes then the content of the tag
is treated as C# code. It is suggested to use CDATA sections for the
code. Example:

``` programlisting
<bpelv:exec binding="CLR" name="invokeSomething"><![CDATA[

    Console.WriteLine("Executing CLR assembly in BPEL");
    Console.WriteLine("getVariableData returned: " + getVariableData ("request", "req_payload", "/tns:destRequest/tns:city"));

    setVariableData ("res",
            "repl_payload",
            "/destResponse/country",
            "UK");
]] ></bpelv:exec>
        
```

Two "functions" are available for accessing script variables:
setVariableData and getVariableData (analogs of the xpath functions with
same names).

``` programlisting
void setVariableData (String var_name, String part, String query_path, Object value);
        
```

sets the variable. The value to be set is restricted to be string or
integer in this version.

``` programlisting
Object getVariableData (String var_name, String part, String query)
        
```

is a full analog of xpath function getVariableData. See details below.

Note, the activity does not commit changes to the database until it
finishes successfully, so in a case of exception the variables are kept
untouched. This also means that deadlocks can not occur during C# code
execution (naturally, this statement is not true if the code contains
direct invocation of SQL through the "in-process" .NET provider).

If the some unhandled exception occurred in C# code, it will be
translated to a BPEL error. See details in the next section.

</div>

<div>

<div>

<div>

<div>

###### Runtime Errors

</div>

</div>

</div>

Runtime errors not handled by CLR itself are translated to the BPEL
fault in the following form:

``` programlisting
<bpws:clrFault sqlState="SQLSTATE">
 error message

</bpws:javaFault>
```

this error can be handled by BPEL fault handler. Here is an example:

``` programlisting
...
    <scope>
      <faultHandlers>
        <catch faultName="bpws:clrFault" faultVariable="error">
          <assign>
            <copy>
              <from variable="error" query="/clrFault/text()"/>
              <to variable="res" part="repl_payload" query="/clr:destResponse/clr:status"/>
            </copy>
          </assign>
        </catch>
      </faultHandlers>
      <bpelv:exec binding="CLR" name="Hotmail"><![CDATA[
         String login, passwd;
            login = (String) getVariableData ("request", "req_payload", "/clr:destRequest/clr:login");
            passwd = (String) getVariableData ("request", "req_payload", "/clr:destRequest/clr:password");
        Console.WriteLine ("user:" + login + " password:" + passwd);

        HotmailUsage usage = new HotmailUsage();
        Console.WriteLine ("Result: " + usage.Call_Hotmail (login, passwd));

        setVariableData ("res",
            "repl_payload",
            "/clr:destResponse/clr:status",
            "OK");
    ]] ></bpelv:exec>
    </scope>
    <reply partnerLink="caller" portType="clr:dest" operation="send" variable="res"/>
...
    
```

In this code the handler for CLR exception is set:

``` programlisting
...
        <catch faultName="bpws:clrFault" faultVariable="error">
          <assign>
            <copy>
              <from variable="error" query="/clrFault/text()"/>
              <to variable="res" part="repl_payload" query="/clr:destResponse/clr:status"/>
            </copy>
          </assign>
        </catch>
...
        
```

The handler takes the error message from the variable which holds it
("error") and puts it into the response variable.

</div>

<div>

<div>

<div>

<div>

###### BPEL variable accessors

</div>

</div>

</div>

The name and the signature of BPEL accessors for CLR are fully equal to
the java accessors. See
<a href="#bpelact_exec_java_accessors" class="ulink" target="_top">java
section</a> for details.

</div>

<div>

<div>

<div>

<div>

###### Special variables

</div>

</div>

</div>

The special variables for CLR are the same as for Java. See
<a href="#bpelact_exec_java_vars" class="ulink" target="_top">java
section</a> for details.

</div>

<div>

<div>

<div>

<div>

###### CLR Sample

</div>

</div>

</div>

``` programlisting
<?xml version="1.0"?>
<process xmlns:clr="urn:clr:Hotmail"
        xmlns="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
        name="clrHotmail"
        targetNamespace="urn:clr:Hotmail"
        xmlns:bpelx="http://schemas.oracle.com/bpel/extension"
        xmlns:bpelv="http://www.openlinksw.com/virtuoso/bpel">

  <bpelv:exec binding="CLR" using="HotmailUsageChecker"/>
  <bpelv:exec binding="CLR" ref="l:\\distrib_3_0\\bin\\Hotmail.dll"/>
  <bpelv:exec binding="CLR" using="System"/>

  <partnerLinks>
    <partnerLink name="caller" partnerLinkType="clr:dest"/>
  </partnerLinks>

  <variables>
    <variable name="request" messageType="clr:destRequestMessage"/>
    <variable name="res" messageType="clr:destResponseMessage"/>
  </variables>
  <sequence>
    <receive partnerLink="caller" portType="clr:dest" operation="send" variable="request" createInstance="yes"/>
    <scope>
      <faultHandlers>
        <catch faultName="bpws:clrFault" faultVariable="error">
          <assign>
            <copy>
              <from variable="error" query="/clrFault/text()"/>
              <to variable="res" part="repl_payload" query="/clr:destResponse/clr:status"/>
            </copy>
          </assign>
        </catch>
      </faultHandlers>
      <bpelv:exec binding="CLR" name="Hotmail"><![CDATA[
             String login, passwd;
                login = (String) getVariableData ("request", "req_payload", "/clr:destRequest/clr:login");
                passwd = (String) getVariableData ("request", "req_payload", "/clr:destRequest/clr:password");
                Console.WriteLine ("user:" + login + " password:" + passwd);

                HotmailUsage usage = new HotmailUsage();
                Console.WriteLine ("Result: " + usage.Call_Hotmail (login, passwd));

                setVariableData ("res",
                        "repl_payload",
                        "/clr:destResponse/clr:status",
                        "OK");
        ]]></bpelv:exec>
        </scope>
    <reply partnerLink="caller" portType="clr:dest" operation="send" variable="res"/>
  </sequence>
</process>
      
```

</div>

</div>

</div>

</div>

</div>

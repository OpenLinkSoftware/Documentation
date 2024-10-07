<div id="bpelerrors" class="section">

<div class="titlepage">

<div>

<div>

### 17.15.12. Errors

</div>

</div>

</div>

During the BPEL process execution we may consider following types of
errors:

<div class="itemizedlist">

- Server failure - This means that the server as a whole has stopped
  operations and requires manual intervention. This is the case for: out
  of disk or database corruption.

- Network - This category applies to possibly transient conditions of
  not being able to contact partners. The server remains in operation
  for unaffected partners.

- Process Instance - This category applies to process instances getting
  an unhandled error condition. The process instance is out of service
  until the condition is resolved. This may indicate a bug in the
  process itself or a component used by it.

</div>

These errors will be logged in the file system
(bpel_audit/server_log.txt) . If logging fails, an email is sent to the
operator. The errors are also logged in the 'BPEL.BPEL.error_log' table
so as to avoid repeatedly sending the same message.

During uploading the BPEL process we may consider following types of
errors:

<div class="itemizedlist">

- bpel.xml file contains non-absolute paths and must be changed to
  absolute in order the uploading to be successful. This is in case user
  uses import_script api.

- wsdl file contains non-absolute paths at importing other wsdl file or
  xsd and must be changed to absolute in order the uploading to be
  successful. This is in case user uses upload process by choosing
  url/file for bpel and wsdl.

- process name already exists. This means there is already uploaded a
  process with the given name.

- at least one activity "receive" or "pick" must be declared at script
  source. Otherwise will be reported error this condition to be
  accomplished.

</div>

<div id="bpelerrors_conn" class="section">

<div class="titlepage">

<div>

<div>

#### Connection Errors

</div>

</div>

</div>

The communication error can be caught by explicit fault handler in the
script. In this case the \<catch\> handler must catch the fault
"bpws:communicationFault":

``` programlisting
  <catch faultName="bpws:communicationFault" faultVariable="error">
   ...
  </catch>
    
```

The error variable "error" will contain the following fault structure:

``` programlisting
 <comFault sqlState="xxxxx" message="text-of-message"
   partnerLink="plinkname" activity="name of activity" partnerURI="uri of
partner">
   <message>-- copy of the message being sent when fault occurred -- </message>
 </comFault>
    
```

which can be used for reporting, recovery etc... The "sqlState"
attribute contains SQL error state and the "message" stores the first
line of SQL error message.

If the script does not handle this fault, the script will be frozen
until explicit or implicit restart.

Here is an example of explicit communication handling:

``` programlisting
<process xmlns:tns="urn:echo:echoService" xmlns="http://schemas.xmlsoap.org/ws/2003/03/business-process/" name="faultHTCLI" targetNamespace="urn:echo:echoService"  xmlns:bpelv="http://www.openlinksw.com/virtuoso/bpel">
  <partnerLinks>
    <partnerLink name="caller" partnerLinkType="tns:echoSLT"/>
    <partnerLink name="test" partnerLinkType="tns:testSLT" partnerRole="service"/>
  </partnerLinks>
  <variables>
    <variable name="request" messageType="tns:StringMessageType"/>
    <variable name="res" messageType="tns:StringMessageType"/>
    <variable name="n_tries" messageType="tns:IntMessageType"/>
  </variables>
  <sequence name="EchoSequence">
    <assign>
      <copy>
        <from expression="3"/>
    <to variable="n_tries" part="value" query="/value"/>
      </copy>
    </assign>
    <receive partnerLink="caller" portType="tns:echoPT" operation="echo" variable="request" createInstance="yes" name="EchoReceive"/>
    <while condition="getVariableData ('n_tries', 'value', '/value')
       &gt; 0">
      <sequence>
    <scope>
      <faultHandlers>
        <catch faultName="bpws:communicationFault" faultVariable="error">
          <sequence>
        <bpelv:exec binding="SQL">
          dbg_obj_print (BPEL.BPEL.getVariableData ('error'));
          dbg_obj_print (BPEL.BPEL.getVariableData ('n_tries'));
        </bpelv:exec>
        <assign>
          <copy>
            <from variable="error" query="/comFault/@sqlState"/>
            <to variable="res" part="echoString" query="/echoString"/>
          </copy>
          <copy>
            <from expression="getVariableData ('n_tries',
              'value', '/value') - 1"/>
            <to variable="n_tries" part="value" query="/value"/>
          </copy>
        </assign>
        <wait for="PT10S"/>
          </sequence>
        </catch>
        <catchAll>
          <empty/>
        </catchAll>
      </faultHandlers>
      <sequence>
        <invoke partnerLink="test" portType="tns:SOAPPortType" operation="test" inputVariable="request" outputVariable="res"/>
        <assign>
          <copy>
        <from expression="0"/>
        <to variable="n_tries" part="value" query="/value"/>
          </copy>
        </assign>
      </sequence>
    </scope>
      </sequence>
    </while>
    <reply partnerLink="caller" portType="tns:echoPT" operation="echo" variable="res" name="EchoReply"/>
  </sequence>
</process>
    
```

In this example the process in a case of communication exception makes 3
reconnection retries to the remote service. Each reconnection is made
after waiting 10 seconds.

</div>

<div id="bpelerrors_deadlock" class="section">

<div class="titlepage">

<div>

<div>

#### Deadlock Errors

</div>

</div>

</div>

During concurrent execution of several BPEL scripts deadlock conditions
can be signalled. That is why Virtuoso BPEL engine contains implicit
deadlock detection and retry capability. When the deadlock is detected,
the engine tries to wait some time, and retry the transaction. If the
number of retries exceeds some maximum number the script execution will
be aborted and mail will be sent to the operator with an appropriate
message.

The time to wait before retry and the maximum number of retries can be
configured on the configuration page of the administration UI.

</div>

</div>

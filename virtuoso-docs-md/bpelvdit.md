<div id="bpelvdit" class="section">

<div class="titlepage">

<div>

<div>

### 17.15.4. Using virtual directories

</div>

</div>

</div>

To allow a process to make new instances or to receive messages from
remote services in asynchronous way it needs an endpoint. Endpoint means
an URL that allows to accept and process known SOAP messages.

Every process has a default endpoint which is accessible via the
'http://\[host:port\]/BPELGUI/bpel.vsp?script=\[process_name\]' URL.
Also it has a default WSDL document describing the process at URL
http://\[host:port\]/BPELGUI/bpel.vsp?script=\[process_name\]&wsdl. Upon
compilation a different virtual directory can be specified for the
process. For example if '/Service' is specified the
'http://\[host:port\]/Service' would be the endpoint URL also in this
case the WSDL will be available on 'http://\[host:port\]/Service?wsdl'.

It is important to note that changing the virtual directory when a
process is redefined will force all clients to update their
configuration. This is the case when a major changes are made to the
process and clients need to be re-linked against new WSDL. So when
changes are small there will be no need of a new virtual directory. (See
section 'Process life-cycle' above for process versions).

</div>

<div id="bpelsut" class="section">

<div class="titlepage">

<div>

<div>

### 17.15.8. Deployment file suitcase format

</div>

</div>

</div>

The relation between a BPEL process and different partner links can be
stored in a deployment file. This file contains a description for every
partner link mention in the process. The descriptor file simplifies
deployment. Entering the URL of this file through the web administration
interface will download and register all sources needed for the process
compilation.

The format of the deployment file is as follows:

``` programlisting
    <BPELSuitcase>
        <BPELProcess
xml:id="[process id]" src="[URI of the file containing BPEL script]">
        <partnerLinkBindings>
            <partnerLinkBinding name="[name of the partner]">
                <property name="wsdlLocation">[URI of the WSDL for the partner]</property>
            </partnerLinkBinding>
            ... more partnerLinkBinding may follow ...
        </partnerLinkBindings>
    </BPELProcess>
    </BPELSuitcase>
```

</div>

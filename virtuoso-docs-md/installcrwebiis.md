<div>

<div>

<div>

<div>

### 2.10.4. Deploy With IIS

</div>

</div>

</div>

To create and test this simple Web Service we have used the Visual
Studio Development Server. This section describes how to deploy the
service using IIS.

<div>

<div>

<div>

<div>

#### Web Service

</div>

</div>

</div>

To deploy the service using IIS:

<div>

- Open the RDFWebDemo project in Visual Studio, go to the

  <span class="emphasis">*Project*</span>

  menu and select RDFWebDemo

  <span class="emphasis">*Properties*</span>

  .

- Select the

  <span class="emphasis">*Web*</span>

  tab and scroll down to the

  <span class="emphasis">*Servers*</span>

  section. Select

  <span class="emphasis">*Use local IIS Server*</span>

  . The project URL defaults to using localhost.

- Click the

  <span class="emphasis">*Create Virtual Directory*</span>

  button then check that the Service works on localhost.

- Build the project then start without debugging (ctrl F5).

</div>

The start page that you see when you test the service will look the same
as before but the address in the browser bar will be something like
http://example.com/RDFWebDemo1/WebDataService1.svc/. You can now access
your service remotely using the hostname or IP address of your server.

If at this point you get an Access is denied error, 401.3, then you will
need to add the Internet Guest Account (IUSR_XXX where XXX is your
computer name) to the users allowed to access the folder containing the
RDFWebDemo project.

</div>

<div>

<div>

<div>

<div>

#### Web Application

</div>

</div>

</div>

You will now need to modify RDFWebApp to access the service at the new
address. At the same time we will also change RDFWebApp so that it too
is deployed using IIS

<div>

- Open The RDFWebApp project in Visual Studio.

- Go to the

  <span class="emphasis">*Project*</span>

  menu and select RDFWebApp

  <span class="emphasis">*Properties*</span>

  .

- Select the

  <span class="emphasis">*Web*</span>

  tab and scroll down to the

  <span class="emphasis">*Servers*</span>

  section. Select

  <span class="emphasis">*Use local IIS Server*</span>

  . The project URL defaults to using localhost.

- Click the

  <span class="emphasis">*Create Virtual Directory*</span>

  button. The web application will then run on the local IIS.

  ``` programlisting
  DemoModel.DemoEntities svc = new DemoModel.DemoEntities(new Uri("http://example.com/WebDataService1.svc"));
  ```

  to

  ``` programlisting
  DemoModel.DemoEntities svc = new DemoModel.DemoEntities(new Uri("http://example.com/RDFWebDemo/WebDataService1.svc/"));
  ```

- To reference the web service running on IIS you will need to edit
  Default.aspx.cs. Change

- Build the project then start without debugging (ctrl F5).

</div>

The web application is accessible on
http://example.com/RDFWebApp/Default.aspx and can also be accessed using
the hostname or IP address of you server e.g.
http://192.168.7.129/RDFWebApp/Default.aspx

<div>

<div>

**Figure 2.166. Default.aspx**

<div>

<div>

![Default.aspx](images/ui/sparqlwinf31.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Next Steps

</div>

</div>

</div>

The next example shows you how to quickly create an ADO.Net Data Service
that exposes RDF data in Virtuoso and how to create a basic Web
application to consume that service. The next step is to
<a href="installsilver.html" class="link"
title="2.11. Creating a Silverlight Application to consume the service">create
a Silverlight Application to consume the same service</a> .

</div>

</div>

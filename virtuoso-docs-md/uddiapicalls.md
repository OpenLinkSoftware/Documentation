<div>

<div>

<div>

<div>

### 17.12.5. UDDI API Calls

</div>

</div>

</div>

This section describes the Virtuoso UDDI-related messages. These
messages are divided into APIs for authentication, inquiry, and
publication.

<div>

<div>

<div>

<div>

#### Authorization API

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_authtoken_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_authtoken.html" class="link"
title="uddi_get_authToken">me_uddi_get_authtoken</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_registeredinfo_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_registeredinfo.html" class="link"
title="uddi_get_registeredInfo">me_uddi_get_registeredinfo</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_discard_authtoken_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_discard_authtoken.html" class="link"
title="uddi_discard_authToken">me_uddi_discard_authtoken</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

</div>

<div>

<div>

<div>

<div>

#### Inquiry API Functions

</div>

</div>

</div>

The inquiry API messages *`find_binding`* , *`find_business`* ,
*`find_service`* , and *`find_tModel`* all accept an optional element
named *`findQualifiers`* . This argument provides a means to allow the
caller to override default search behaviors.

The messages in this section represent inquiries that anyone can make of
any UDDI-enabled server at any time. These messages all behave
synchronously and are required to be exposed via HTTP POST only. Other
synchronous or asynchronous mechanisms may be provided at the discretion
of the individual UDDI-enabled server or compatible registry.

The publicly accessible queries are:

<div>

- <span class="emphasis">*find_binding:*</span> Used to locate specific
  bindings within a registered *`businessService`*. Returns a
  *`bindingDetail`* message.

- <span class="emphasis">*find_business:*</span> Used to locate
  information about one or more businesses. Returns a *`businessList`*
  message.

- <span class="emphasis">*find_service:*</span> Used to locate specific
  services within a registered *`businessEntity`*. Returns a
  *`serviceList`* message.

- <span class="emphasis">*find_tModel:*</span> Used to locate one or
  more *`tModel`* information structures. Returns a *`tModelList`*
  structure.

- <span class="emphasis">*get_bindingDetail:*</span> Used to get full
  *`bindingTemplate`* information suitable for making one or more
  service requests. Returns a *`bindingDetail`* message.

- <span class="emphasis">*get_businessDetail:*</span> Used to get the
  full *`businessEntity`* information for a one or more businesses.
  Returns a *`businessDetail`* message.

- <span class="emphasis">*get_businessDetailExt:*</span> Used to get
  extended *`businessEntity`* information. Returns a
  *`businessDetailExt`* message.

- <span class="emphasis">*get_serviceDetail:*</span> Used to get full
  details for a given set of registered *`businessService`* date.
  Returns a *`serviceDetail`* message.

- <span class="emphasis">*get_tModelDetail:*</span> Used to get full
  details for a given set of registered *`tModel`* data. Returns a
  *`tModelDetail`* message.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_find_binding_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_find_binding.html" class="link"
title="uddi_find_binding">me_uddi_find_binding</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_find_business_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_find_business.html" class="link"
title="uddi_find_business">me_uddi_find_business</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_find_service_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_find_service.html" class="link"
title="uddi_find_service">me_uddi_find_service</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_find_tmodel_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_find_tmodel.html" class="link"
title="uddi_find_tModel">me_uddi_find_tmodel</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_bindingdetail_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_bindingdetail.html" class="link"
title="uddi_get_bindingDetail">me_uddi_get_bindingdetail</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_businessdetail_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_businessdetail.html" class="link"
title="uddi_get_businessDetail">me_uddi_get_businessdetail</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_businessdetailext_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_businessdetailext.html" class="link"
title="uddi_get_businessDetailExt">me_uddi_get_businessdetailext</a> in
the <a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_servicedetail_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_servicedetail.html" class="link"
title="uddi_get_serviceDetail">me_uddi_get_servicedetail</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_get_tmodeldetail_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_get_tmodeldetail.html" class="link"
title="uddi_get_tModelDetail">me_uddi_get_tmodeldetail</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

</div>

<div>

<div>

<div>

<div>

#### Publishing API Functions

</div>

</div>

</div>

The messages in this section represent inquiries that require
authenticated access to an operator site. Each business should initially
select one UDDI-enabled server to host their information. Once chosen,
information can only be updated at the site originally selected.

The messages defined in this section all behave synchronously and are
only callable via HTTP-POST. HTTPS is used exclusively for all the calls
defined in this publisher's API.

<div>

- <span class="emphasis">*save_binding:*</span> Used to register new
  *`bindingTemplate`* information or update existing *`bindingTemplate`*
  information. Use this to control information about technical
  capabilities exposed by a registered business.

- <span class="emphasis">*save_business:*</span> Used to register new
  *`businessEntity`* information or update existing *`businessEntity`*
  information. Use this to control the overall information about the
  entire business. Of all the save messages, this one has the broadest
  effect.

- <span class="emphasis">*save_service:*</span> Used to register or
  update complete information about a *`businessService`* exposed by a
  specified *`businessEntity`*.

- <span class="emphasis">*save_tModel:*</span> Used to register or
  update complete information about a *`tModel`*.

- <span class="emphasis">*delete_binding:*</span> Used to remove an
  existing *`bindingTemplate`* from the bindingTemplates collection that
  is part of a specified *`businessService`* structure.

- <span class="emphasis">*delete_business:*</span> Used to delete
  registered *`businessEntity`* information from the registry.

- <span class="emphasis">*delete_service:*</span> Used to delete an
  existing *`businessService`* from the businessServices collection that
  is part of a specified *`businessEntity`*.

- <span class="emphasis">*delete_tModel:*</span> Used to delete
  registered information about a *`tModel`*. If there are any references
  to a *`tModel`* when this call is made, the *`tModel`* will be marked
  deleted instead of being physically removed.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_save_binding_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_save_binding.html" class="link"
title="uddi_save_binding">me_uddi_save_binding</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_save_business_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_save_business.html" class="link"
title="uddi_save_business">me_uddi_save_business</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_save_service_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_save_service.html" class="link"
title="uddi_save_service">me_uddi_save_service</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_save_tmodel_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_save_tmodel.html" class="link"
title="uddi_save_tModel">me_uddi_save_tmodel</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_delete_binding_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_delete_binding.html" class="link"
title="uddi_delete_binding">me_uddi_delete_binding</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_delete_business_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_delete_business.html" class="link"
title="uddi_delete_business">me_uddi_delete_business</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_delete_service_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_delete_service.html" class="link"
title="uddi_delete_service">me_uddi_delete_service</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

<div>

<div>

<div>

<div>

##### me_uddi_delete_tmodel_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="me_uddi_delete_tmodel.html" class="link"
title="uddi_delete_tModel">me_uddi_delete_tmodel</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

</div>

</div>

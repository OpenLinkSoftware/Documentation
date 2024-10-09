<div>

<div>

<div>

<div>

### 17.12.3. Supported API Calls

</div>

</div>

</div>

The UDDI APIs always return a SOAP entity body which contains messages
as described in UDDI v1 XML Schema (uddi_1.xsd).

<div>

- <span class="emphasis">*Authorization API*</span> - Used to establish
  authentication mechanism (tokens), dropping already established
  connections.

  <div>

  - <span class="emphasis">*discard_authToken:*</span> Used to inform a
    UDDI enabled server that a previously provided authentication token
    is no longer valid.

  - <span class="emphasis">*get_authToken:*</span> Used to request an
    authentication token from a UDDI-enabled server. Authentication
    tokens are required to use all other APIs defined in the publishers
    API. This function serves as the program's equivalent of a login
    request.

  - <span class="emphasis">*get_registeredInfo:*</span> Used to request
    an abbreviated synopsis of all information currently managed by a
    given individual.

  </div>

- <span class="emphasis">*Searching API* </span> The publicly accessible
  queries are:

  <div>

  - <span class="emphasis">*find_binding:* </span> Used to locate
    specific bindings within a registered *`businessService`*. Returns a
    *`bindingDetail`* message.

  - <span class="emphasis">*find_business:*</span> Used to locate
    information about one or more businesses . Returns a
    *`businessList`* message.

  - <span class="emphasis">*find_service:*</span> Used to locate
    specific services within a registered *`businessEntity`*. Returns a
    *`serviceList`* message.

  - <span class="emphasis">*find_tModel:*</span> Used to locate one or
    more *`tModel`* information structures. Returns a *`tModelList`*
    structure.

  - <span class="emphasis">*get_bindingDetail:*</span> Used to get full
    *`bindingTemplate`* information suitable for making one or more
    service requests. Returns a *`bindingDetail`* message.

  - <span class="emphasis">*get_businessDetail:*</span> Used to get full
    *`businessEntity`* information for one or more businesses. Returns a
    *`businessDetail`* message.

  - <span class="emphasis">*get_businessDetailExt:*</span> Used to get
    extended *`businessEntity`* information. Returns a
    *`businessDetailExt`* message.

  - <span class="emphasis">*get_serviceDetail:*</span> Used to get full
    details for a given set of registered *`businessService`* data.
    Returns a *`serviceDetail`* message.

  - <span class="emphasis">*get_tModelDetail:*</span> Used to get full
    details for a given set of registered *`tModel`* data. Returns a
    *`tModelDetail`* message.

  </div>

- <span class="emphasis">*Repository Manipulation API* </span>

  <div>

  - <span class="emphasis">*delete_binding:* </span> Used to remove an
    existing *`bindingTemplate `* from the *`bindingTemplate`*s
    collection that is part of a specified *`businessService`*
    structure.

  - <span class="emphasis">*delete_business:*</span> Used to delete
    registered *`businessEntity`* information from the registry.

  - <span class="emphasis">*delete_service:*</span> Used to delete an
    existing *`businessService`* from the businessServices collection
    that is part of a specified *`businessEntity`*.

  - <span class="emphasis">*delete_tModel:*</span> Used to delete
    registered information about a *`tModel`*. If there are any
    references to a *`tModel`* when this call is made, the *`tModel`*
    will be marked deleted instead of being physically removed.

  - <span class="emphasis">*save_binding:*</span> Used to register new
    *`bindingTemplate`* information or update existing
    *`bindingTemplate`* information. Use this to control information
    about technical capabilities exposed by a registered business.

  - <span class="emphasis">*save_business:*</span> Used to register new
    *`businessEntity`* information or update existing *`businessEntity`*
    information. Use this to control the overall information about the
    entire business. Of all the save APIs this one has the broadest
    effect.

  - <span class="emphasis">*save_service:*</span> Used to register or
    update complete information about a *`businessService`* exposed by a
    specified *`businessEntity`*.

  - <span class="emphasis">*save_tModel:*</span> Used to register or
    update complete information about a *`tModel`*.

  </div>

</div>

</div>

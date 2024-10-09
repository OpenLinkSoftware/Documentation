<div>

<div>

<div>

<div>

### 2.8.2. Getting Started: Creating Data Services

</div>

</div>

</div>

<span class="emphasis">*Pre-requisites*</span>

In order to create a data service using ADO.NET Data Services in your
own environment you will need Microsoft Visual Studio 2008 SP1. The
ADO.NET Entity Framework runtime and associated tools are included in
Visual Studio 2008 SP1.

<span class="emphasis">*Selecting a Data Source*</span>

The ADO.NET Data Service server framework is comprised of two halves.
The top-half is the runtime itself; this part is "fixed", and it
implements URI translation, the Atom/JSON wire formats, the interaction
protocol, etc. This is what makes an ADO.NET Data Service look like an
ADO.NET Data Service. The bottom half is the data-access layer and is
pluggable. Communication between layers happens in terms of the
IQueryable interface plus a set of conventions to map CLR graphs into
the URI/payload patterns of ADO.NET Data Services.

The first step in creating an ADO.NET Data Service is to determine the
data source that is to be exposed as a set of REST-based endpoints (ie.
select or create a data access layer). For relational data stored in
Microsoft SQL Server or other 3rd Party databases, ADO.NET Data Services
currently enables easily exposing a conceptual model created using the
ADO.NET Entity Framework (EF). For all other data sources (XML section,
web service, application logic layer, etc) or to use additional database
access technologies (ex. LINQ to SQL), a mechanism is provided which
enables any data source, as per the plug-in model described above, to be
exposed as an ADO.NET Data Service.

To create a data service which exposes a relational database through an
Entity Framework conceptual model see "Creating a Data Service using the
ADO.NET Entity Framework". To create a data service which exposes
another data source see "Creating a Data Service from any Data Source".

</div>

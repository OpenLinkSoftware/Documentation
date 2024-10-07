<div id="virtuosotipsandtricksenableadonetvs2010" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.11. How to enable the Virtuoso Entity Framework 3.5 ADO.Net Provider in Visual Studio 2010?

</div>

</div>

</div>

The Virtuoso Entity Framework 3.5 ADO.Net Provider is current only list
as a Visible control in the Visual Studio 2008 IDE as the current
installers only create the necessary registry entries for Visual Studio
2008. To make it visible in the Visual Studio 2010's IDE the following
registry settings need to be manually updated and manual addtions to
some of the VS 2010 XML configuration files:

<div class="orderedlist">

1.  Export following registry keys to .reg files and using a text
    editor, such as Wordpad, edit the Visual Studio version numbers from
    8.0 or 9.0 to 10.0:

    ``` programlisting
    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\8.0\DataProviders\{EE00F82B-C5A4-4073-8FF1-33F815C9801D}
    - and -
    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\8.0\DataSources\{90FBCAF2-8F42-47CD-BF1A-88FF41173060}
    ```

2.  Once edited, save and double click them to create the new registry
    entries under:

    ``` programlisting
    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\10.0....
    ```

3.  In addition, locate the file
    C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\CONFIG\machine.config,
    locate the node, then locate the

    <span class="emphasis">*\<add name="VirtuosoClient3? Data Provider"
    ...*</span>

    node within it:

    ``` programlisting
    <add name="VirtuosoClient3 Data Provider" invariant="OpenLink.Data.Virtuoso"
        description=".NET Framework Data Provider for Virtuoso" type="OpenLink.Data.Virtuoso.VirtuosoClientFactory, virtado3, Version=6.2.3128.2, Culture=neutral, PublicKeyToken=391bf132017ae989" />
    ```

</div>

and copy is to the equivalent
C:\WINDOWS\Microsoft.NET\Frameworks\v4.0.30128\CONFIG\machine.config
location.

Visual Studio 2010 will then have the necessary information to locate
and load the Virtuoso ADO.Net provider in its IDE.

The registry should typically contain the following entries for Visual
Studio 2010 as a result:

``` programlisting
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}]
@=".NET Framework Data Provider for Virtuoso"
"AssociatedSource"="{4D90D7C5-69A6-43EE-83ED-59A0E442D260}"
"CodeBase"="C:\\Windows\\assembly\\GAC_MSIL\\virtado3\\6.2.3128.1__391bf132017ae989\\virtado3.dll"
"Description"="Provider_Description, OpenLink.Data.Virtuoso.DDEX.Net3.DDEXResources, virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"
"DisplayName"="Provider_DisplayName, OpenLink.Data.Virtuoso.DDEX.Net3.DDEXResources, virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"
"InvariantName"="OpenLink.Data.Virtuoso"
"PlatformVersion"="2.0"
"ShortDisplayName"="Provider_ShortDisplayName, OpenLink.Data.Virtuoso.DDEX.Net3.DDEXResources, virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"
"Technology"="{77AB9A9D-78B9-4ba7-91AC-873F5338F1D2}"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IDSRefBuilder]
@="Microsoft.VisualStudio.Data.Framework.DSRefBuilder"
"Assembly"="Microsoft.VisualStudio.Data.Framework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataAsyncCommand]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataCommand]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataConnectionProperties]
@="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoDataConnectionProperties"
"Assembly"="virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataConnectionSupport]
@="Microsoft.VisualStudio.Data.Framework.AdoDotNet.AdoDotNetConnectionSupport"
"Assembly"="Microsoft.VisualStudio.Data.Framework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataConnectionUIControl]
@="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoDataConnectionUIControl"
"Assembly"="virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataConnectionUIProperties]
@="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoDataConnectionProperties"
"Assembly"="virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataMappedObjectConverter]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataObjectIdentifierResolver]
@="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoDataObjectIdentifierResolver"
"Assembly"="virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataObjectSupport]
@="Microsoft.VisualStudio.Data.Framework.DataObjectSupport"
"Assembly"="Microsoft.VisualStudio.Data.Framework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
"XmlResource"="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoObjectSupport"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataSourceInformation]
@="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoDataSourceInformation"
"Assembly"="virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataTransaction]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}\SupportedObjects\IVsDataViewSupport]
@="Microsoft.VisualStudio.Data.Framework.DataViewSupport"
"Assembly"="Microsoft.VisualStudio.Data.Framework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
"XmlResource"="OpenLink.Data.Virtuoso.DDEX.Net3.VirtuosoViewSupport"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataSources\{4D90D7C5-69A6-43EE-83ED-59A0E442D260}]
@="OpenLink Virtuoso Data Source"
"DefaultProvider"="{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataSources\{4D90D7C5-69A6-43EE-83ED-59A0E442D260}\SupportingProviders]

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\DataSources\{4D90D7C5-69A6-43EE-83ED-59A0E442D260}\SupportingProviders\{0886A2BB-03D0-4E00-8A3D-F235A5DC0F6D}]
"Description"="DataSource_Description, OpenLink.Data.Virtuoso.DDEX.Net3.DDEXResources, virtado3, Version=6.2.3128.1, Culture=neutral, PublicKeyToken=391bf132017ae989"
```

The next Virtuoso releases, 6.3+ will support this new Visual Studio
2010 release out of the box.

</div>

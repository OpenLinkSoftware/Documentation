<div id="syncml" class="section">

<div class="titlepage">

<div>

<div>

## 17.11. SyncML

</div>

</div>

</div>

SyncML is a protocol for synchronization of data collections between two
devices - a SyncML Client and SyncML Server using an XML data
representation. The client is typically some mobile device or mobile PC.
The Virtuoso server implements the SyncML server protocol over HTTP.

The SyncML server maintains the data collections within the WebDAV
repository. The items (resources) in the collections (folders)
represents items found on the client, e.g. VCARD, vcalendar records. As
the WebDAV repository does not restrict the type of data that can be
stored, likewise there are no restrictions on the type of data that can
be synchronized. Also every WebDAV virtual directory can act as a SyncML
server endpoint, the SyncML processing is triggered via the
`Content-Type` , detected on the POST request (see below).

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                 |
|:--------------------------:|:----------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                       |
|                            | <a href="syncmlschema.html" class="link"                        
                              title="23.6.13. SyncML Schema Objects">SyncML Schema Tables</a>  |

</div>

The SyncML server detects the following formats from the `Content-Type `
header string:

|                                                                                             |
|---------------------------------------------------------------------------------------------|
| <span class="emphasis">*`application/vnd.syncml+wbxml `*</span> - WBXML coded XML documents |
| <span class="emphasis">*`application/vnd.syncml+xml `*</span> - plain text XML document     |

These are detected during the POST request to a WebDAV virtual directory
thus triggering SyncML processing. When a device makes creates
'`application/vnd.syncml+wbxml` ' session, the SyncML server will
respond with the WBXML format. Otherwise plain XML will be used to
encode SyncML messages.

Basic and MD5 digest SyncML authorization schemes are supported. The
WebDAV enabled user accounts are used to perform authentication.

It is possible to query the HTTP authentication type supported by the
target device by assigning an authentication hook to a given virtual
directory. By default SyncML authentication is digest-md5, so HTTP
authentication is off (note that HTTP authentication is different from
SyncML authentication).

The following synchronization methods are supported:

|                   |
|-------------------|
| Two-way sync      |
| Slow two-way sync |

Every item sent from the client device is mapped to a WebDAV resource
under a given WebDAV collection. Every device database, such as
contacts, calendar, usually requires that a different WebDAV collection
be specified because the devices usually can not maintain items of
different kinds with a single database. For example, when synchronizing
the Contacts of a Nokia 9210 with the server, we can specify
`./contacts/` , and likewise for the Calendar database, `./calendar/` .
This keeps VCARDS (contacts) and vCalendars in separate collections
(folders) on a given virtual directory. It is not possible to keep
calendar and contacts (for example) in the same WebDAV collection,
unless the device supports such items in a single database.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                             |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Important Note:                                                                                                                                                                                                                                                             |
|                              | The target folders (Virtuoso server-side collections) must exists and must be accessible by the WebDAV account used to authenticate against the SyncML server. If credentials or permissions are insufficient then an Error 403 (Forbidden) will be returned to the client. |

</div>

<div id="ex_syncmlsession" class="example">

**Example 17.38. Example of a SyncML session**

<div class="example-contents">

The client begins initial request

``` programlisting
  <SyncML>
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>1</MsgID>
      <Target>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Target>
      <Source>
        <LocURI>IMEI:57471724140229</LocURI>
      </Source>
      <Meta>
        <MaxMsgSize>10000</MaxMsgSize>
      </Meta>
    </SyncHdr>
    <SyncBody>
      <Alert>
        <CmdID>1</CmdID>
        <Data>201</Data>
        <Item>
          <Target>
            <LocURI>./calendar</LocURI>
          </Target>
          <Source>
            <LocURI>./C\System\Data\Calendar</LocURI>
          </Source>
          <Meta>
            <Anchor>
              <Next>20031202T165103Z</Next>
            </Anchor>
          </Meta>
        </Item>
      </Alert>
      <Put>
        <CmdID>2</CmdID>
        <Meta>
          <Type>application/vnd.syncml-devinf+wbxml</Type>
        </Meta>
        <Item>
          <Source>
            <LocURI>./devinf10</LocURI>
          </Source>
          <Data>
            <DevInf>
              <VerDTD>1.0</VerDTD>
              <Man>NOKIA</Man>
              <Mod>9210</Mod>
              <SwV>256</SwV>
              <HwV>1.0</HwV>
              <DevID>IMEI:57471724140229</DevID>
              <DevTyp>phone</DevTyp>
          ....
            </DevInf>
          </Data>
        </Item>
      </Put>
      <Get>
        <CmdID>3</CmdID>
        <Meta>
          <Type>application/vnd.syncml-devinf+wbxml</Type>
        </Meta>
        <Item>
          <Target>
            <LocURI>./devinf10</LocURI>
          </Target>
        </Item>
      </Get>
      <Final/>
    </SyncBody>
  </SyncML>
```

Server rejects credential, because no credentials.

``` programlisting
  <SyncML xmlns:n0="syncml:SYNCML1.0">
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>1</MsgID>
      <Target>
        <LocURI>IMEI:57471724140229</LocURI>
      </Target>
      <Source>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Source>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>1</CmdID>
        <MsgRef>1</MsgRef>
        <CmdRef>0</CmdRef>
        <TargetRef>http://192.168.1.1:6666/</TargetRef>
        <SourceRef>IMEI:57471724140229</SourceRef>
        <Cmd>SyncHdr</Cmd>
        <Chal>
          <Meta>
            <Type xmlns:n2="syncml:metinf">syncml:auth-md5</Type>
            <Format xmlns:n2="syncml:metinf">b64</Format>
            <NextNonce xmlns:n2="syncml:metinf">NzcyYTgyMDRjMGM2NzRlYTZjYWVmNGY4ZjNjMGYzMDk=</NextNonce>
          </Meta>
        </Chal>
        <Data>401</Data>
      </Status>
      ....
      <Final/>
    </SyncBody>
  </SyncML>
```

Client sends back credentials.

``` programlisting
  <SyncML>
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>2</MsgID>
      <Target>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Target>
      <Source>
        <LocURI>IMEI:57471724140229</LocURI>
        <LocName>imitko</LocName>
      </Source>
      <Cred>
        <Meta>
          <Format>b64</Format>
          <Type>syncml:auth-md5</Type>
        </Meta>
        <Data>X8uGR8CX4ogw8Ux+ZWIzkg==</Data>
      </Cred>
      <Meta>
        <MaxMsgSize>10000</MaxMsgSize>
      </Meta>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>1</CmdID>
        <MsgRef>1</MsgRef>
        <CmdRef>0</CmdRef>
        <Cmd>SyncHdr</Cmd>
        <TargetRef>IMEI:57471724140229</TargetRef>
        <SourceRef>http://192.168.1.1:6666/</SourceRef>
        <Data>200</Data>
      </Status>
      <Alert>
        <CmdID>2</CmdID>
        <Data>201</Data>
        <Item>
          <Target>
            <LocURI>./calendar</LocURI>
          </Target>
          <Source>
            <LocURI>./C\System\Data\Calendar</LocURI>
          </Source>
          <Meta>
            <Anchor>
              <Next>20031202T165103Z</Next>
            </Anchor>
          </Meta>
        </Item>
      </Alert>
      <Put>
        <CmdID>3</CmdID>
        <Meta>
          <Type>application/vnd.syncml-devinf+wbxml</Type>
        </Meta>
        <Item>
          <Source>
            <LocURI>./devinf10</LocURI>
          </Source>
          <Data>
            <DevInf>
              <VerDTD>1.0</VerDTD>
              <Man>NOKIA</Man>
              <Mod>9210</Mod>
              <SwV>256</SwV>
              <HwV>1.0</HwV>
              <DevID>IMEI:57471724140229</DevID>
              <DevTyp>phone</DevTyp>
          ...
            </DevInf>
          </Data>
        </Item>
      </Put>
      <Get>
        <CmdID>4</CmdID>
        <Meta>
          <Type>application/vnd.syncml-devinf+wbxml</Type>
        </Meta>
        <Item>
          <Target>
            <LocURI>./devinf10</LocURI>
          </Target>
        </Item>
      </Get>
      <Final/>
    </SyncBody>
  </SyncML>
```

Server accepts the request.

``` programlisting
  <SyncML xmlns="syncml:SYNCML1.0">
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>2</MsgID>
      <Target>
        <LocURI>IMEI:57471724140229</LocURI>
      </Target>
      <Source>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Source>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>5</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>0</CmdRef>
        <TargetRef>http://192.168.1.1:6666/</TargetRef>
        <SourceRef>IMEI:57471724140229</SourceRef>
        <Cmd>SyncHdr</Cmd>
        <Data>212</Data> <!-- Authenticated for session -->

      </Status>
      <Status>
        <CmdID>7</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>2</CmdRef>
        <Cmd>Alert</Cmd>
        <Data>200</Data> <!- two-way alert accepted, 'next' anchor echoed -->

        <Item>
          <Data>
            <Anchor xmlns:n2="syncml:metinf">
              <Next>20031202T165103Z</Next>
            </Anchor>
          </Data>
        </Item>
      </Status>
      <Status>
        <CmdID>8</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>3</CmdRef>
        <Cmd>Put</Cmd>
        <Data>200</Data> <!-- the 'put' command succeeded;
                              device info is written ->
      </Status>
      <Results> <!-- the following are server's device info  -->

        <CmdID>9</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>4</CmdRef>
        <Meta>
          <Type xmlns:n2="syncml:metinf">application/vnd.syncml-devinf+wbxml</Type>
        </Meta>
        <Item>
          <Source>
            <LocURI>./devinf10</LocURI>
          </Source>
          <Data>
            <DevInf xmlns:n2="syncml:devinf">
              <VerDTD>1.0</VerDTD>
              <Man>OpenLink Software Ltd</Man>
              <Mod>Virtuoso</Mod>
              <OEM>OpenLink</OEM>
              <FwV>3.5</FwV>
              <SwV>2602</SwV>
              <HwV>0</HwV>
              <DevID>http://example.com/</DevID>
              <DevTyp>server</DevTyp>
              <SyncCap>
                <SyncType>1</SyncType>
                <SyncType>2</SyncType>
              </SyncCap>
          ...
              <UTC/>
              <SupportLargeObjs/>
              <SupportNumberOfChanges/>
            </DevInf>
          </Data>
        </Item>
      </Results>
      <Alert>
        <CmdID>6</CmdID>
        <Data>201</Data> <!-- the ./calendar/ is new empty collection;
                              server asks client for slow two-way sync.  -->

        <Item>
          <Target>
            <LocURI>./C\System\Data\Calendar</LocURI>
          </Target>
          <Source>
            <LocURI>./calendar/</LocURI>
          </Source>
          <Meta>
            <Anchor xmlns:n2="syncml:metinf">
              <Last>1970-01-01T00:00:00.000+02:00</Last>
              <Next>2003-12-02T18:51:05.000+02:00</Next>
            </Anchor>
          </Meta>
        </Item>
      </Alert>
      <Final/>
    </SyncBody>
  </SyncML>
```

Client sends to server all calendar items. See 'Sync' element below.

``` programlisting
  <SyncML>
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>3</MsgID>
      <Target>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Target>
      <Source>
        <LocURI>IMEI:57471724140229</LocURI>
      </Source>
      <Meta>
        <MaxMsgSize>10000</MaxMsgSize>
      </Meta>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>1</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>0</CmdRef>
        <Cmd>SyncHdr</Cmd>
        <TargetRef>IMEI:57471724140229</TargetRef>
        <SourceRef>http://192.168.1.1:6666/</SourceRef>
        <Data>200</Data>
      </Status>
      <Status>
        <CmdID>2</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>9</CmdRef>
        <Cmd>Results</Cmd>
        <Data>200</Data>
      </Status>
      <Status>
        <CmdID>3</CmdID>
        <MsgRef>2</MsgRef>
        <CmdRef>6</CmdRef>
        <Cmd>Alert</Cmd>
        <TargetRef>./C\System\Data\Calendar</TargetRef>
        <SourceRef>./calendar/</SourceRef>
        <Data>200</Data>
        <Item>
          <Data>
            <Anchor>
              <Next>2003-12-02T18:51:05.000+02:00</Next>
            </Anchor>
          </Data>
        </Item>
      </Status>
      <Sync>
        <CmdID>4</CmdID>
        <Target>
          <LocURI>./calendar</LocURI>
        </Target>
        <Source>
          <LocURI>./C\System\Data\Calendar</LocURI>
        </Source>
        <Meta>
          <Mem>
            <FreeMem>7627614408</FreeMem>
            <FreeID>59590737</FreeID>
          </Mem>
        </Meta>
        <Replace> <!-- the client uses 'Replace' command -->

          <CmdID>5</CmdID>
          <Meta>
            <Type>text/x-vcalendar</Type>
          </Meta>
          <Item>
            <Source>
              <LocURI>2</LocURI>
            </Source>
            <Data>
        BEGIN:VCALENDAR
        VERSION:1.0
        BEGIN:VEVENT
        UID:2
        DESCRIPTION:tests
        DTSTART:20031127T090000
        DTEND:20031127T090000
        X-EPOCAGENDAENTRYTYPE:APPOINTMENT
        CLASS:PUBLIC
        DCREATED:20031128T000000
        LAST-MODIFIED:20031201T123500
        END:VEVENT
        END:VCALENDAR
            </Data>
          </Item>
        </Replace>
        <Replace>
          <CmdID>6</CmdID>
          <Meta>
            <Type>text/x-vcalendar</Type>
          </Meta>
          <Item>
            <Source>
              <LocURI>3</LocURI>
            </Source>
            <Data>
        BEGIN:VCALENDAR
        VERSION:1.0
        BEGIN:VEVENT
        UID:3
        DESCRIPTION:tests more
        DTSTART:20031128T090000
        DTEND:20031128T190000
        X-EPOCAGENDAENTRYTYPE:APPOINTMENT
        CLASS:PUBLIC
        DCREATED:20031128T000000
        LAST-MODIFIED:20031201T123500
        END:VEVENT
        END:VCALENDAR
            </Data>
          </Item>
        </Replace>
        <Replace>
          <CmdID>7</CmdID>
          <Meta>
            <Type>text/x-vcalendar</Type>
          </Meta>
          <Item>
            <Source>
              <LocURI>5</LocURI>
            </Source>
            <Data>
        BEGIN:VCALENDAR
        VERSION:1.0
        BEGIN:VEVENT
        UID:5
        DESCRIPTION:today integration
        DTSTART:20031201T090000
        DTEND:20031201T090000
        X-EPOCAGENDAENTRYTYPE:APPOINTMENT
        CLASS:PUBLIC
        DCREATED:20031201T000000
        LAST-MODIFIED:20031201T125400
        END:VEVENT
        END:VCALENDAR
            </Data>
          </Item>
        </Replace>
      </Sync>
      <Final/>
    </SyncBody>
  </SyncML>
```

Server stores new items.

``` programlisting
  <SyncML xmlns:n0="syncml:SYNCML1.0">
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>3</MsgID>
      <Target>
        <LocURI>IMEI:57471724140229</LocURI>
      </Target>
      <Source>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Source>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>10</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>0</CmdRef>
        <TargetRef>http://192.168.1.1:6666/</TargetRef>
        <SourceRef>IMEI:57471724140229</SourceRef>
        <Cmd>SyncHdr</Cmd>
        <Data>212</Data>
      </Status>
      <Status>
        <CmdID>11</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>5</CmdRef>
        <Cmd>Replace</Cmd>
        <Data>201</Data> <!-- 201 (Added) is used to indicate
                              that item is added as new. -->

      </Status>
      <Status>
        <CmdID>12</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>6</CmdRef>
        <Cmd>Replace</Cmd>
        <Data>201</Data>
      </Status>
      <Status>
        <CmdID>13</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>7</CmdRef>
        <Cmd>Replace</Cmd>
        <Data>201</Data>
      </Status>
      <Status>
        <CmdID>15</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>4</CmdRef>
        <TargetRef>./calendar/</TargetRef>
        <SourceRef>./C\System\Data\Calendar</SourceRef>
        <Cmd>Sync</Cmd>
        <Data>200</Data>
      </Status>
      <Sync> <!-- an empty Sync is sent from server. -->

        <CmdID>14</CmdID>
        <Source>
          <LocURI>./calendar/</LocURI>
        </Source>
        <Target>
          <LocURI>./C\System\Data\Calendar</LocURI>
        </Target>
      </Sync>
      <Final/>
    </SyncBody>
  </SyncML>
```

Final SyncML message from client with status to server's Sync command.

``` programlisting
  <SyncML>
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>4</MsgID>
      <Target>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Target>
      <Source>
        <LocURI>IMEI:57471724140229</LocURI>
      </Source>
      <Meta>
        <MaxMsgSize>10000</MaxMsgSize>
      </Meta>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>1</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>0</CmdRef>
        <Cmd>SyncHdr</Cmd>
        <TargetRef>IMEI:57471724140229</TargetRef>
        <SourceRef>http://192.168.1.1:6666/</SourceRef>
        <Data>200</Data>
      </Status>
      <Status>
        <CmdID>2</CmdID>
        <MsgRef>3</MsgRef>
        <CmdRef>14</CmdRef>
        <Cmd>Sync</Cmd>
        <TargetRef>./C\System\Data\Calendar</TargetRef>
        <SourceRef>./calendar/</SourceRef>
        <Data>200</Data>
      </Status>
      <Final/>
    </SyncBody>
  </SyncML>
```

Final message from SyncML server; no more commands issued.

``` programlisting
  <SyncML xmlns:n0="syncml:SYNCML1.0">
    <SyncHdr>
      <VerDTD>1.0</VerDTD>
      <VerProto>SyncML/1.0</VerProto>
      <SessionID>88</SessionID>
      <MsgID>4</MsgID>
      <Target>
        <LocURI>IMEI:57471724140229</LocURI>
      </Target>
      <Source>
        <LocURI>http://192.168.1.1:6666/</LocURI>
      </Source>
    </SyncHdr>
    <SyncBody>
      <Status>
        <CmdID>16</CmdID>
        <MsgRef>4</MsgRef>
        <CmdRef>0</CmdRef>
        <TargetRef>http://192.168.1.1:6666/</TargetRef>
        <SourceRef>IMEI:57471724140229</SourceRef>
        <Cmd>SyncHdr</Cmd>
        <Data>212</Data>
      </Status>
      <Final/>
    </SyncBody>
  </SyncML>
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                         |
|:--------------------------:|:------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                               |
|                            | <a href="http://www.syncml.org/" class="ulink" target="_top">References 
                              : www.syncml.org</a>                                                     |

</div>

</div>

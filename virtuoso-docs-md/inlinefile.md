<div id="inlinefile" class="section">

<div class="titlepage">

<div>

<div>

### 14.3.4. /INLINEFILE HTTP Server Pseudo-Directory

</div>

</div>

</div>

This pseudo directory provides a way for a VSP page to have full control
over the data sent to the client user-agent, for example to send files
to it and to handle the HTTP response attributes.

URIs starting with /INLINEFILE are handled through a VSP procedure
instead of being searched for in the HTTP root directory. This special
URI has the following syntax:

``` programlisting
/INLINEFILE/some_file_name?VSP=some_vsp&arg1=x&arg2=y.....
```

Upon receipt of such a URI, Virtuoso will execute the "some_vsp" VSP
page with the parameters following the VSP parameter. The VSP page can
adjust the HTTP response header attributes using the `http_header()`
function to reflect the content of the HTTP body, such as specifying the
encoding through "Content-Encoding" attribute, or a MIME type through
"Content-Type" attribute).

<div id="ex_inlinefile" class="example">

**Example 14.9. Using /INLINEFILE**

<div class="example-contents">

Here is a simple example for showing JPEG images stored in DAV. The page
will list the first ten images found in the DAV resources table as
hyper-links. Clicking on them will fetch the content and display using
/INLINEFILE.

``` programlisting
<?vsp
  if ({?'getfile'} <> '')
    {
      http_header ('Content-type: image/jpg\t\n');         -- set the header to jpg
      declare image any;
      select RES_CONTENT into image from WS..SYS_DAV_RES
        where RES_ID = atoi({?'id'});                      -- download image from WebDAV
      http(image);                                         -- table and display
      return;
    }
  ?>
<html>
 <body>
 <h1>Using /INLINEFILE to display images from the database</h1>

 <table>
  <tr>
   <td>

<?vsp for (select top 10 RES_ID, RES_NAME from WS..SYS_DAV_RES where right(RES_NAME, 3) = 'jpg') do {?>
 <a href="?id=<?=RES_ID?>"><?=RES_NAME?></a><br>
<?vsp } ?>

   </td>
   <td>
    <p><img src="/INLINEFILE/picture.jpg?VSP=<?/http_path()?>&getfile=yes&id=<?={?'id'}?>"></p>
    <p><a href="/INLINEFILE/picture.jpg?VSP=<?/http_path()?>&getfile=yes&id=<?/{?'id'}?>">download</a></p>
   </td>
  </tr>
 </table>
 </body>
</html>
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>Note the use of the
<code class="function">http_path()</code> function to find the full path
of the originating VSP file.</p>
<p>Also note the call to <code class="function">http_header()</code> to
set the appropriate content type for the returned data. When Virtuoso
retrieves files normally, it will consult the system table <code
class="computeroutput">WS.WS.SYS_DAV_RES_TYPES</code> for types based on
the file extension. We do not need to refer to the table in our example
because we are making sure that only JPEGs are being returned.</p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_http_header.html" class="link" title="http_header"><code
class="function">http_header()</code></a></p>
<p><a href="fn_http_path.html" class="link" title="http_path"><code
class="function">http_path()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

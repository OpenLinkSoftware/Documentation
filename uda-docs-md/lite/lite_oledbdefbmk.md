<div id="lite_oledbdefbmk" class="section">

<div class="titlepage">

<div>

<div>

## 7.5. Controlling the Default Bookmark Setting for Rowsets

</div>

</div>

</div>

The extended property keyword “BookmarkDefault” controls whether rowsets
are created with or without a bookmark column by default. OLE DB does
not specify what the default behaviour should be. The OpenLink provider
includes a bookmark column by default. Normally it should not be
necessary to change this setting. To explicitly turn bookmarks on or
off, use an entry of the form: BookmarkDefault=On\|Off.

</div>

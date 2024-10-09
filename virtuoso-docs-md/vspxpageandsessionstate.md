<div>

<div>

<div>

<div>

### 14.4.3. Keeping Page and Session State

</div>

</div>

</div>

VSPX does not require any particular session management to be in effect
to operate. It is in its default form entirely stateless on the server
side. There is a mechanism called view state for keeping track of data
between consecutive post backs of a single page. This is simply an
automatically maintained hidden field which will keep the state of
controls which have a state that may be persisted. The view state
mechanism does not however safeguard data across different pages but is
fine for remembering entered form data or a bookmark in a scrolled list
across page reloads.

To keep real sessions and session variables, a `v:login` control is
offered.

</div>

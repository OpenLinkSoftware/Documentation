
/***********************************************************************/
/* ECMAScript script for OpenLink-specific modifications above DocBook */
/***********************************************************************/

if(!String.format) {
    String.format = function(format) {
        var args = Array.prototype.slice.call(arguments, 1);
        return format.replace(/{(\d+)}/g, function(match, number) { 
            return typeof args[number] != 'undefined'
                ? args[number] 
                : match
            ;
        });
    };
};

function setupNavigation() {
    var navheader=$("div.navheader")[0];
    var prevlink=$("link[rel='prev']");
    var uplink=$("link[rel='up']");
    var nextlink=$("link[rel='next']");
    var pagetitle=$("title")[0].innerHTML;

    var up=""; var left=""; var right="";
    if(uplink.attr("href")) {
        up='Up: <a href="' + uplink.attr("href") + '">' + uplink.attr("title") + "</a>";
    }
    if(prevlink.attr("href")) {
        left='&lt; <a accesskey="p" href="' + prevlink.attr('href') + '">'+ prevlink.attr("title") + "</a>";
    }
    if(nextlink.attr("href")) {
        right='<a accesskey="n" href="' + nextlink.attr('href') + '">'+ nextlink.attr("title") + "</a> &gt;";
    }
    
    navheader.innerHTML=String.format(' \
<div class="wide navup">{0}</div> \
<div class="wide navtitle">{1}</div> \
<div class="half left navleft">{2}</div> \
<div class="half right navright">{3}</div>',
                                      up, pagetitle, left, right);
}


function setupChapter() {
    var navheader=$("div.navheader")[0];
    var navup=$("div.navheader div.navup")[0];
    navup.innerHTML='<select id="chaptersel" class="half left" style="display:inline"></select>' + navup.innerHTML;

    var sel=$("#chaptersel");
    $("link[rel='chapter']").each(
        function() {
            $(sel).append('<option value="' + $(this).attr("href") + '">' + $(this).attr("title") + '</option>');
        }
    );
    sel.change(navigateChapter);
}

function navigateChapter() {
    var sel=$("#chaptersel").val();
    document.location=sel;
}

function pageOnLoad() {
    setupNavigation();
    setupChapter();
}

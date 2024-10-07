<div id="xmlstoragesystem_10" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.22. E-mail Notifications

</div>

</div>

</div>

The blog implementation offers a two kind of notifications: notify via
e-mail a blog owner when a comment is posted; or one could subscribe to
receive blog posts via e-mail. Both notifications are disabled by
default and can be turned on using Weblog UI. When this flag is on a
scheduled job will send e-mail to the blogger for every new comment
posted to the given blog.

The blog owner notification can be turned on as setting
BI_COMMENTS_NOTIFY to 1 in table SYS_BLOG_INFO for corresponding blog
entry. Other way is to use Weblog settings UI.

If blog owner decide, can define a notification route. To do that he can
add a routing job of type SMTP to the routing table. See "Blog
Upstreaming" discussed earlier in this chapter how to do that. Also it's
possible via Weblog settings UI to add such route via "Notification"
link. Note that when define such route , better practice is to designate
a category which to be considered as for subscription.

Once such routing job is defined for given blog, users can subscribe and
therefore receive e-mails for posts which blogger assign to a category
for notification.

</div>

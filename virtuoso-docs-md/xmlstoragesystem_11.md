<div id="xmlstoragesystem_11" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.24. Subscription Harmonizer API

</div>

</div>

</div>

Considering situation where blogger have many subscribed channels and
wish these to be in sync on different places it usually
subscribe/unsubscribe in home, work public blog. To be easiest for one
to keep all mirrored blog instances (see Upstreaming discussed above) to
have same channel subscription can be used Subscription Harmonizer API.
This API consist of four methods available via XML-RPC , so developers
can use them to put in sync blogger channel subscriptions.

"subsHarmonizer.setup" (in username varchar, in "password" varchar, in
array any) This is used to setup on server channels which are subscribed
locally. The user authenticates using name and password and sends to
server list of RSS URLs in "array" parameter. This action is usually
performed once , on initial subscription.

"subsHarmonizer.subscribe" (in username varchar, in "password" varchar,
in array any) This is used when in local blog instance blogger makes new
subscription(s), the "array" will contains only entries have been added
since last call to that or subsHarmonizer.setup call. The target server
will resolve URL list and will make records in SYS_BLOG_CHANNEL and
SYS_BLOG_CHANNEL_INFO tables.

"subsHarmonizer.unsubscribe" (in username varchar, in "password"
varchar, in array any) This function is opposite of subsHarmonizer.setup
, it is used when blogger unsubscribe from some channels. The server
action is to remove channel subscriptions from blog instance. Note that
in this case server keeps channel definition , so it can be re-used when
another user get subscribed to it, this is to minimize bandwidth
consumption for channel characteristics retrieval.

All of the above returns boolean.

"subsHarmonizer.startup" (in username varchar, in "password" varchar)
This function is used from blog application to get from server list of
subscriptions which are currently registered. In that case blog
application uses the array of URLs returned to set it's local list of
channels.

</div>

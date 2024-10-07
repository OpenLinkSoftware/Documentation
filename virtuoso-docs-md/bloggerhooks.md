<div id="bloggerhooks" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.10. Blog Hooks - Customizing the Blog Server

</div>

</div>

</div>

Virtuoso provides the default system for blogging using one of the
supported . Virtuoso provides several PL hooks to customize the blog
server. The following hooks are available for definition:

|                                                                       |
|-----------------------------------------------------------------------|
| authenticate\_\<appkey\> (in req blogRequest)                         |
| newPost\_\<appkey\> (in req blogRequest)                              |
| editPost\_\<appkey\> (in req blogRequest)                             |
| deletePost\_\<appkey\> (in req blogRequest)                           |
| getPost\_\<appkey\> (in req blogRequest)                              |
| getRecentPosts\_\<appkey\> (in req blogRequest, in numberOfPosts int) |

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                    |
|:--------------------------:|:---------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                          |
|                            | <a href="xmlrpc.html" class="link" shape="rect"    
                              title="17.10. XML-RPC support">XML-RPC section</a>  |

</div>

blogRequest is a UDT defined as follows:

``` programlisting
create type "blogPost" as (
              "content" varchar,        -- message
              "dateCreated" datetime,   -- timestamp
              "postid" varchar,     -- message ID
              "userid" int          -- creator
            ) temporary self as ref
;

create type "blogRequest" under "blogPost"
            as
            (
              user_name varchar,        -- user name
              passwd varchar,       -- credentials
                  appkey varchar,       -- application key
              blogid varchar,       -- web log ID
                  postId varchar,       -- message ID
              auth_userid integer,      -- user ID
                          publish smallint,     -- not used, but still in API
              struct DB.DBA.MWeblogPost     -- used in WebMetaLog
            ) temporary self as ref

constructor method blogRequest (
              appkey varchar,
              blogid varchar,
              postId varchar,
              user_name varchar,
              passwd varchar
              )
;
```

<div id="ex_customblog" class="example">

**Example 14.61. Customizing the BLOG Server**

<div class="example-contents">

``` programlisting
-- SIMPLE BLOG APPLICATION
-- application key: 0123456789
--
-- the following UDTs are used in API calls
--
-- single message
-- create type "blogPost" as (
--            "content" varchar,
--            "dateCreated" datetime,
--            "postid" varchar,
--            "userid" int
--          ) temporary self as ref
--
--
-- a blog request
-- create type "blogRequest" under "blogPost"
--          as
--          (
--            user_name varchar,
--            passwd varchar,
--                appkey varchar,
--            blogid varchar,
--                postId varchar,
--            auth_userid integer,
--                        publish smallint
--          ) temporary self as ref
--
-- as metaWeblog API not not have appkey, we are assuming 'META_WEBLOG' for it.

drop table BLOG;

create table BLOG (
            B_APPKEY varchar,
            BLOG_ID varchar,
            B_CONTENT long varchar,
            B_POST_ID varchar,
            B_TS timestamp,
            B_USER_ID integer,
            primary key (B_APPKEY, BLOG_ID, B_POST_ID)
);

-- APPLICATION LEVEL HOOKS
create procedure authenticate_app (inout req blogRequest)
{
    declare pwd varchar;
    declare id int;
    dbg_obj_print ('auth');
    whenever not found goto nf;
    select U_PWD, U_ID into pwd, id from WS.WS.SYS_DAV_USER where U_NAME = req.user_name;
    if (isstring (pwd))
      {
        if ((pwd[0] = 0 and pwd_magic_calc (req.user_name, req.passwd) = pwd)
                            or (pwd[0] <> 0 and pwd = req.passwd))
          {
            req.auth_userid := id;
            return;
          }
      }
  nf:
    signal ('42000', 'Access denied');
}
;

create procedure
authenticate_0123456789 (in req blogRequest)
{
  authenticate_app (req);
}
;

create procedure
newPost_0123456789 (in req blogRequest)
{
   req.postId := cast (sequence_next ('blogger.postid') as varchar);
   insert into BLOG (B_APPKEY, BLOG_ID, B_CONTENT, B_POST_ID, B_USER_ID)
       values (req.appkey, req.blogid, req.content, req.postId, req.auth_userid);
}
;

create procedure
editPost_0123456789 (in req blogRequest)
{
   update BLOG set B_CONTENT = req.content where B_APPKEY = req.appkey and B_POST_ID = req.postId;
}
;

create procedure
deletePost_0123456789  (in req blogRequest)
{
  delete from BLOG where B_APPKEY = req.appkey and B_POST_ID = req.postId;
}
;

create procedure
getPost_0123456789  (in req blogRequest)
{
      declare content, datecreated, userid any;
      declare post blogPost;

      whenever not found goto nf;
      select sprintf ('%V', blob_to_string (B_CONTENT)), B_TS, B_USER_ID into content, datecreated, userid
        from BLOG where B_APPKEY = req.appkey and B_POST_ID = req.postId;

      post := new blogPost ();
      post."content" := content;
      post."dateCreated" := datecreated;
      post."postid" := req.postId;
      post."userid" := userid;
      dbg_obj_print ('getPost', post);
      return post;
    nf:
      signal ('22023', 'Cannot find a post with Id = ' || req.postId);
}
;

create procedure
getRecentPosts_0123456789  (in req blogRequest, in numberOfPosts int)
{
  declare ret, elm any;
  declare post blogPost;

  ret := vector ();
  for select sprintf ('%V', blob_to_string (B_CONTENT)) as B_CONTENT, B_TS, B_USER_ID, B_POST_ID
    from BLOG where B_APPKEY = req.appkey and BLOG_ID = req.blogId order by B_TS desc do
   {
     post := new blogPost ();
     post."content" := B_CONTENT;
     post."dateCreated" := B_TS;
     post."postid" := B_POST_ID;
     post."userid" := B_USER_ID;
     ret := vector_concat (ret, vector (post));
     numberOfPosts := numberOfPosts - 1;
     if (numberOfPosts <= 0)
       goto endg;
   }
endg:
  return ret;
}
;
```

</div>

</div>

  

</div>

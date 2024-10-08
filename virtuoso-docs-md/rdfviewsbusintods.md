<div>

<div>

<div>

<div>

### 16.8.7. Virtuoso ODS to RDF

</div>

</div>

</div>

<span class="emphasis">*Linked Data View for ODS (the consolidated
Graph)*</span>

``` programlisting
SPARQL drop quad map virtrdf:ODS_DS . ;

SPARQL prefix ods: <http://www.openlinksw.com/virtuoso/ods/>
       create iri class ods:graph "http://^{URIQADefaultHost}^/dataspace/%U" (in uname varchar not null)
                option (returns "http://^{URIQADefaultHost}^/dataspace/%U") .
       create iri class ods:user "http://^{URIQADefaultHost}^/dataspace/%U#user" (in uname varchar not null)
                option (returns "http://^{URIQADefaultHost}^/dataspace/%U#user") .
       create iri class ods:user_group "http://^{URIQADefaultHost}^/dataspace/%U#group" (in uname varchar not null)
                option (returns "http://^{URIQADefaultHost}^/dataspace/%U#group") .
       create iri class ods:person "http://^{URIQADefaultHost}^/dataspace/%U#this" (in uname varchar not null)
                option (returns "http://^{URIQADefaultHost}^/dataspace/%U#this") .
       create iri class ods:mbox "mailto:%s" (in email varchar not null)
                option (returns "mailto:%s") .
       create iri class ods:phone "tel:%s" (in tel varchar not null)
                    option (returns "tel:%s") .
       create iri class ods:geo_point "http://^{URIQADefaultHost}^/dataspace/%U#geo" (in uname varchar not null)
                    option (returns "http://^{URIQADefaultHost}^/dataspace/%U#geo") .
       create iri class ods:forum "http://^{URIQADefaultHost}^/dataspace/%U/%U/%U"
        ( in uname varchar not null, in forum_type varchar not null, in forum_name varchar not null)
                    option (returns "http://^{URIQADefaultHost}^/dataspace/%U/%U/%U") .
       create iri class ods:proxy "http://^{URIQADefaultHost}^/proxy/%U" (in url varchar not null)
                    option (returns  "http://^{URIQADefaultHost}^/proxy/%U") .
       create iri class ods:site "http://^{URIQADefaultHost}^/dataspace/%U#site" (in uname varchar not null)
                    option (returns "http://^{URIQADefaultHost}^/dataspace/%U#site") .
       create iri class ods:role "http://^{URIQADefaultHost}^/dataspace/%U/%U/%U#%U"
        (in uname varchar not null, in tp varchar not null, in inst varchar not null, in role_name varchar not null)
                option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/%U/%U#%U" ) .
    # Blog
    create iri class ods:blog_forum "http://^{URIQADefaultHost}^/dataspace/%U/weblog/%U"
        (in uname varchar not null, in forum_name varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/weblog/%U") .
    create iri class ods:blog_post "http://^{URIQADefaultHost}^/dataspace/%U/weblog/%U/%U"
        (in uname varchar not null, in forum_name varchar not null, in postid varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/weblog/%U/%U" ) .
    create iri class ods:blog_comment "http://^{URIQADefaultHost}^/dataspace/%U/weblog/%U/%U/%d"
        (in uname varchar not null, in forum_name varchar not null, in postid varchar not null, in comment_id int not null)
            option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/weblog/%U/%U/%d" ) .
    create iri class ods:tag "http://^{URIQADefaultHost}^/dataspace/%U/concept#%U"
        (in uname varchar not null, in tag varchar not null)
                option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/concept#%U") .
    create iri class ods:blog_post_text "http://^{URIQADefaultHost}^/dataspace/%U/weblog-text/%U/%U"
        (in uname varchar not null, in forum_name varchar not null, in postid varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/weblog-text/%U/%U" ) .
    #Feeds
    create iri class ods:feed "http://^{URIQADefaultHost}^/dataspace/feed/%d" (in feed_id integer not null)
            option (returns "http://^{URIQADefaultHost}^/dataspace/feed/%d" ) .
    create iri class ods:feed_item "http://^{URIQADefaultHost}^/dataspace/feed/%d/%d" (in feed_id integer not null, in item_id integer not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/feed/%d/%d" ) .
    create iri class ods:feed_item_text "http://^{URIQADefaultHost}^/dataspace/feed/%d/%d/text" (in feed_id integer not null, in item_id integer not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/feed/%d/%d/text" ) .
    create iri class ods:feed_mgr "http://^{URIQADefaultHost}^/dataspace/%U/feeds/%U" (in uname varchar not null, in inst_name varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/feeds/%U" ) .
    create iri class ods:feed_comment "http://^{URIQADefaultHost}^/dataspace/%U/feeds/%U/%d/%d"
        (in uname varchar not null, in inst_name varchar not null, in item_id integer not null, in comment_id integer not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/feeds/%U/%d/%d" ) .
    #Bookmark
    create iri class ods:bmk_post "http://^{URIQADefaultHost}^/dataspace/%U/bookmark/%U/%d"
        (in uname varchar not null, in inst_name varchar not null, in bmk_id integer not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/bookmark/%U/%d") .
    create iri class ods:bmk_post_text "http://^{URIQADefaultHost}^/dataspace/%U/bookmark/%U/%d/text"
        (in uname varchar not null, in inst_name varchar not null, in bmk_id integer not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/bookmark/%U/%d/text" ) .
    create iri class ods:bmk_forum "http://^{URIQADefaultHost}^/dataspace/%U/bookmark/%U"
        ( in uname varchar not null, in forum_name varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/bookmark/%U") .
    #Photo
    create iri class ods:photo_forum "http://^{URIQADefaultHost}^/dataspace/%U/photos/%U"
        (in uname varchar not null, in inst_name varchar not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/photos/%U") .
    create iri class ods:photo_post "http://^{URIQADefaultHost}^%s"
        (in path varchar not null) option (returns "http://^{URIQADefaultHost}^/DAV/%s") .
    create iri class ods:photo_post_text "http://^{URIQADefaultHost}^%s/text"
        (in path varchar not null) option (returns "http://^{URIQADefaultHost}^/DAV/%s/text") .
    create iri class ods:photo_comment "http://^{URIQADefaultHost}^%s:comment_%d"
        (in path varchar not null, in comment_id int not null)
        option (returns "http://^{URIQADefaultHost}^/DAV/%s:comment_%d") .
    # Community
    create iri class ods:community_forum "http://^{URIQADefaultHost}^/dataspace/%U/community/%U"
        (in uname varchar not null, in forum_name varchar not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/community/%U") .
    # Briefcase
    create iri class ods:odrive_forum "http://^{URIQADefaultHost}^/dataspace/%U/briefcase/%U"
        (in uname varchar not null, in inst_name varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/briefcase/%U" ) .
    create iri class ods:odrive_post "http://^{URIQADefaultHost}^%s"
        (in path varchar not null) option (returns "http://^{URIQADefaultHost}^/DAV/%s") .
    create iri class ods:odrive_post_text "http://^{URIQADefaultHost}^%s/text"
        (in path varchar not null) option (returns "http://^{URIQADefaultHost}^/DAV/%s/text") .
    # Wiki
    create iri class ods:wiki_post "http://^{URIQADefaultHost}^/dataspace/%U/wiki/%U/%U"
        (in uname varchar not null, in inst_name varchar not null, in topic_id varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/wiki/%U/%U") .
    create iri class ods:wiki_post_text "http://^{URIQADefaultHost}^/dataspace/%U/wiki/%U/%U/text"
        (in uname varchar not null, in inst_name varchar not null, in topic_id varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/wiki/%U/%U/text" ) .
    create iri class ods:wiki_forum "http://^{URIQADefaultHost}^/dataspace/%U/wiki/%U"
        ( in uname varchar not null, in forum_name varchar not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/wiki/%U" ) .
    #Calendar
    create iri class ods:calendar_event "http://^{URIQADefaultHost}^/dataspace/%U/calendar/%U/%d"
        (in uname varchar not null, in inst_name varchar not null, in calendar_id integer not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/calendar/%U/%d" ) .
    create iri class ods:calendar_event_text "http://^{URIQADefaultHost}^/dataspace/%U/calendar/%U/%d/text"
        (in uname varchar not null, in inst_name varchar not null, in calendar_id integer not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/%U/calendar/%U/%d/text" ) .
    create iri class ods:calendar_forum "http://^{URIQADefaultHost}^/dataspace/%U/calendar/%U"
        ( in uname varchar not null, in forum_name varchar not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/%U/calendar/%U") .
    # NNTPF
    create iri class ods:nntp_forum "http://^{URIQADefaultHost}^/dataspace/discussion/%U"
        ( in forum_name varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/discussion/%U").
    create iri class ods:nntp_post "http://^{URIQADefaultHost}^/dataspace/discussion/%U/%U"
        ( in group_name varchar not null, in message_id varchar not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/discussion/%U/%U" ) .
    create iri class ods:nntp_post_text "http://^{URIQADefaultHost}^/dataspace/discussion/%U/%U/text"
        ( in group_name varchar not null, in message_id varchar not null)
        option (returns  "http://^{URIQADefaultHost}^/dataspace/discussion/%U/%U/text") .
    create iri class ods:nntp_role "http://^{URIQADefaultHost}^/dataspace/discussion/%U#reader"
        (in forum_name varchar not null)
        option (returns "http://^{URIQADefaultHost}^/dataspace/discussion/%U#reader") .
       ;

SPARQL
    prefix sioc: <http://rdfs.org/sioc/ns#>
    prefix sioct: <http://rdfs.org/sioc/types#>
    prefix atom: <http://atomowl.org/ontologies/atomrdf#>
    prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    prefix foaf: <http://xmlns.com/foaf/0.1/>
    prefix dc: <http://purl.org/dc/elements/1.1/>
    prefix dct: <http://purl.org/dc/terms/>
    prefix skos: <http://www.w3.org/2004/02/skos/core#>
    prefix geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
    prefix bm: <http://www.w3.org/2002/01/bookmark#>
    prefix exif: <http://www.w3.org/2003/12/exif/ns/>
    prefix ann: <http://www.w3.org/2000/10/annotation-ns#>
    prefix wikiont: <http://sw.deri.org/2005/04/wikipedia/wikiont.owl#>
    prefix calendar: <http://www.w3.org/2002/12/cal#>
    prefix ods: <http://www.openlinksw.com/virtuoso/ods/>

    alter quad storage virtrdf:DefaultQuadStorage
      FROM DB.DBA.SIOC_USERS as users
      FROM DB.DBA.SIOC_ODS_FORUMS as forums
      FROM DB.DBA.SIOC_ROLES as roles
      FROM DB.DBA.SIOC_ROLE_GRANTS as grants
      FROM DB.DBA.SIOC_KNOWS as knows
      FROM DB.DBA.ODS_FOAF_PERSON as person
      where (^{person.}^.U_NAME = ^{users.}^.U_NAME)
      where (^{forums.}^.U_NAME = ^{users.}^.U_NAME)
      where (^{knows.}^.TO_NAME = ^{users.}^.U_NAME)
      where (^{knows.}^.FROM_NAME = ^{users.}^.U_NAME)
      where (^{grants.}^.U_NAME = ^{users.}^.U_NAME)
      where (^{roles.}^.U_NAME = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_BLOG_POSTS as blog_posts
      where (^{blog_posts.}^.B_OWNER = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_BLOG_POST_LINKS as blog_links
      where (^{blog_links.}^.B_OWNER = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_BLOG_POST_ATTS as blog_atts
      where (^{blog_atts.}^.B_OWNER = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_BLOG_POST_TAGS as blog_tags
      where (^{blog_tags.}^.U_NAME = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_BLOG_COMMENTS as blog_comms
      where (^{blog_comms.}^.U_NAME = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_BMK_POSTS as bmk_posts
      where (^{bmk_posts.}^.U_NAME = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_BMK_TAGS as bmk_tags
      where (^{bmk_tags.}^.U_NAME = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_ODRIVE_POSTS as odrv_posts
      where (^{odrv_posts.}^.U_MEMBER = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_ODRIVE_TAGS as odrv_tags
      where (^{odrv_tags.}^.U_OWNER = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_FEED_FEED_DOMAIN as feed_domain
      where (^{feed_domain.}^.U_NAME = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_FEED_POSTS as feed_posts
      where (^{feed_posts.}^.EFI_FEED_ID = ^{feed_domain.}^.EF_ID)
      FROM DB.DBA.ODS_FEED_COMMENTS as feed_comments
      where (^{feed_comments.}^.U_NAME = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_FEED_TAGS as feed_tags
      where (^{feed_tags.}^.U_NAME = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_FEED_LINKS as feed_links
      where (^{feed_links.}^.EFI_FEED_ID = ^{feed_domain.}^.EF_ID)
      FROM DB.DBA.ODS_FEED_ATTS as feed_atts
      where (^{feed_atts.}^.EFI_FEED_ID = ^{feed_domain.}^.EF_ID)

      FROM DB.DBA.ODS_PHOTO_POSTS as photo_posts
      where (^{photo_posts.}^.U_MEMBER = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_PHOTO_COMMENTS as photo_comments
      where (^{photo_comments.}^.U_MEMBER = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_PHOTO_TAGS as photo_tags
      where (^{photo_tags.}^.U_MEMBER = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_WIKI_POSTS as wiki_posts
      where (^{wiki_posts.}^.U_NAME = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_COMMUNITIES as community
      where (^{community.}^.C_OWNER = ^{users.}^.U_NAME)

      FROM DB.DBA.ODS_NNTP_GROUPS as nntp_groups
      FROM DB.DBA.ODS_NNTP_POSTS as nntp_posts
      FROM DB.DBA.ODS_NNTP_USERS as nntp_users
      where (^{nntp_users.}^.U_NAME = ^{users.}^.U_NAME)
      FROM DB.DBA.ODS_NNTP_LINKS as nntp_links

    {
    create virtrdf:ODS_DS as graph ods:graph (users.U_NAME) option (exclusive)
      {
        ods:user (users.U_NAME) a sioc:User ;
            sioc:id users.U_NAME ;
            sioc:name users.U_FULL_NAME ;
            sioc:email ods:mbox (users.E_MAIL) ;
            sioc:email_sha1 users.E_MAIL_SHA1 ;
            sioc:account_of ods:person (users.U_NAME) .

        ods:person (person.U_NAME) a foaf:Person ;
            foaf:nick person.U_NAME ;
        foaf:name person.U_FULL_NAME ;
        foaf:mbox ods:mbox (person.E_MAIL) ;
            foaf:mbox_sha1sum person.E_MAIL_SHA1 ;
            foaf:holdsAccount ods:user (person.U_NAME) ;
            foaf:firstName person.FIRST_NAME ;
            foaf:family_name person.LAST_NAME ;
            foaf:gender person.GENDER ;
            foaf:icqChatID person.ICQ ;
            foaf:msnChatID person.MSN ;
            foaf:aimChatID person.AIM ;
            foaf:yahooChatID person.YAHOO ;
            foaf:birthday person.BIRTHDAY ;
            foaf:organization person.ORG ;
            foaf:phone ods:phone (person.PHONE) ;
        foaf:based_near ods:geo_point (person.U_NAME)
        .

        ods:geo_point (person.U_NAME) a geo:Point ;
         geo:lat person.LAT ;
         geo:lng person.LNG .

        ods:person (knows.FROM_NAME) foaf:knows ods:person (knows.TO_NAME) .
        ods:person (knows.TO_NAME) foaf:knows ods:person (knows.FROM_NAME) .

        ods:user_group (grants.G_NAME) a sioc:Usergroup ;
            sioc:id grants.G_NAME ;
        sioc:has_member ods:user (grants.U_NAME) .
        ods:user (grants.U_NAME)  sioc:member_of ods:user_group (grants.G_NAME) .

        ods:role (roles.U_NAME, roles.APP_TYPE, roles.WAM_INST, roles.WMT_NAME)
          sioc:has_scope ods:forum (roles.U_NAME, roles.APP_TYPE, roles.WAM_INST) ;
          sioc:function_of ods:user (roles.U_NAME) .

            ods:forum (roles.U_NAME, roles.APP_TYPE, roles.WAM_INST)
            sioc:scope_of ods:role (roles.U_NAME, roles.APP_TYPE, roles.WAM_INST, roles.WMT_NAME) .
            ods:user (roles.U_NAME)
            sioc:has_function ods:role (roles.U_NAME, roles.APP_TYPE, roles.WAM_INST, roles.WMT_NAME) .

        ods:forum (forums.U_NAME, forums.APP_TYPE, forums.WAM_INST) a sioc:Container ;
            sioc:id forums.WAM_INST ;
        sioc:type forums.APP_TYPE ;
            sioc:description forums.WAI_DESCRIPTION ;
            sioc:link ods:proxy (forums.LINK) ;
            sioc:has_space ods:site (forums.U_NAME) .

            # Weblog
        ods:blog_post (blog_posts.B_OWNER, blog_posts.B_INST, blog_posts.B_POST_ID) a sioct:BlogPost ;
        sioc:link ods:proxy (blog_posts.B_LINK) ;
        sioc:has_creator ods:user (blog_posts.B_CREATOR) ;
        foaf:maker ods:person (blog_posts.B_CREATOR) ;
        sioc:has_container ods:blog_forum (blog_posts.B_OWNER, blog_posts.B_INST) ;
        dc:title blog_posts.B_TITLE ;
        dct:created blog_posts.B_CREATED ;
        dct:modified blog_posts.B_MODIFIED ;
        sioc:content blog_posts.B_CONTENT .

        ods:blog_forum (blog_posts.B_OWNER, blog_posts.B_INST)
        sioc:container_of
        ods:blog_post (blog_posts.B_OWNER, blog_posts.B_INST, blog_posts.B_POST_ID) .

        ods:user (blog_posts.B_CREATOR)
        sioc:creator_of
        ods:blog_post (blog_posts.B_OWNER, blog_posts.B_INST, blog_posts.B_POST_ID) .

        ods:blog_post (blog_links.B_OWNER, blog_links.B_INST, blog_links.B_POST_ID)
        sioc:links_to
        ods:proxy (blog_links.PL_LINK) .
        # end Weblog

            # Bookmark
        ods:bmk_post (bmk_posts.U_NAME, bmk_posts.WAI_NAME, bmk_posts.BD_BOOKMARK_ID)
            a bm:Bookmark ;
        dc:title bmk_posts.BD_NAME;
        dct:created bmk_posts.BD_CREATED ;
        dct:modified bmk_posts.BD_LAST_UPDATE ;
        dc:date bmk_posts.BD_LAST_UPDATE ;
        ann:created bmk_posts.BD_CREATED ;
        dc:creator bmk_posts.U_NAME ;
        bm:recalls ods:proxy (bmk_posts.B_URI) ;
        sioc:link ods:proxy (bmk_posts.B_URI) ;
        sioc:content bmk_posts.BD_DESCRIPTION ;
        sioc:has_creator ods:user (bmk_posts.U_NAME) ;
        foaf:maker ods:person (bmk_posts.U_NAME) ;
        sioc:has_container ods:bmk_forum (bmk_posts.U_NAME, bmk_posts.WAI_NAME) .

            ods:bmk_forum (bmk_posts.U_NAME, bmk_posts.WAI_NAME)
        sioc:container_of
        ods:bmk_post (bmk_posts.U_NAME, bmk_posts.WAI_NAME, bmk_posts.BD_BOOKMARK_ID) .

        ods:user (bmk_posts.U_NAME)
        sioc:creator_of
        ods:bmk_post (bmk_posts.U_NAME, bmk_posts.WAI_NAME, bmk_posts.BD_BOOKMARK_ID) .

        ods:bmk_post (bmk_tags.U_NAME, bmk_tags.WAM_INST, bmk_tags.ITEM_ID)
        sioc:topic
        ods:tag (bmk_tags.U_NAME, bmk_tags.BD_TAG) .

        ods:tag (bmk_tags.U_NAME, bmk_tags.BD_TAG) a skos:Concept ;
        skos:prefLabel bmk_tags.BD_TAG ;
        skos:isSubjectOf ods:bmk_post (bmk_tags.U_NAME, bmk_tags.WAM_INST, bmk_tags.ITEM_ID) .
        # end Bookmark

            # Briefcase
        ods:odrive_post (odrv_posts.RES_FULL_PATH) a foaf:Document ;
        dc:title odrv_posts.RES_NAME ;
        dct:created odrv_posts.RES_CREATED ;
        dct:modified odrv_posts.RES_MODIFIED ;
        sioc:content odrv_posts.RES_DESCRIPTION ;
        sioc:has_creator ods:user (odrv_posts.U_OWNER) ;
        foaf:maker ods:person (odrv_posts.U_OWNER) ;
        sioc:has_container ods:odrive_forum (odrv_posts.U_MEMBER, odrv_posts.WAI_NAME) .

        ods:odrive_forum (odrv_posts.U_MEMBER, odrv_posts.WAI_NAME)
        sioc:container_of
        ods:odrive_post (odrv_posts.RES_FULL_PATH) .

        ods:user (odrv_posts.U_OWNER)
        sioc:creator_of
        ods:odrive_post (odrv_posts.RES_FULL_PATH) .

        ods:odrive_post (odrv_tags.RES_FULL_PATH)
        sioc:topic
        ods:tag (odrv_tags.U_OWNER, odrv_tags.TAG) .

        ods:tag (odrv_tags.U_OWNER, odrv_tags.TAG) a skos:Concept ;
        skos:prefLabel odrv_tags.TAG ;
        skos:isSubjectOf ods:odrive_post (odrv_tags.RES_FULL_PATH) .
            # end Briefcase

            # Feeds
        ods:feed (feed_domain.EF_ID) a atom:Feed ;
        sioc:link ods:proxy (feed_domain.EF_URI) ;
        atom:link ods:proxy (feed_domain.EF_URI) ;
        atom:title feed_domain.EF_TITLE ;
        sioc:has_parent ods:feed_mgr (feed_domain.U_NAME, feed_domain.WAI_NAME) .

        ods:feed_mgr (feed_domain.U_NAME, feed_domain.WAI_NAME)
        sioc:parent_of ods:feed (feed_domain.EF_ID) .

        ods:feed_item (feed_tags.EFI_FEED_ID, feed_tags.EFID_ITEM_ID)
        sioc:topic
        ods:tag (feed_tags.U_NAME, feed_tags.EFID_TAG) .

        ods:tag (feed_tags.U_NAME, feed_tags.EFID_TAG) a skos:Concept ;
        skos:prefLabel feed_tags.EFID_TAG ;
        skos:isSubjectOf ods:feed_item (feed_tags.EFI_FEED_ID, feed_tags.EFID_ITEM_ID) .

        ods:feed_comment (feed_comments.U_NAME, feed_comments.WAI_NAME, feed_comments.EFIC_ITEM_ID, feed_comments.EFIC_ID)
        a sioct:Comment ;
        dc:title feed_comments.EFIC_TITLE ;
        sioc:content feed_comments.EFIC_COMMENT ;
        dct:modified feed_comments.LAST_UPDATE ;
        dct:created feed_comments.LAST_UPDATE ;
        sioc:link ods:proxy (feed_comments.LINK) ;
        sioc:has_container ods:feed (feed_comments.EFI_FEED_ID) ;
        sioc:reply_of ods:feed_item (feed_comments.EFI_FEED_ID, feed_comments.EFIC_ITEM_ID) ;
        foaf:maker ods:proxy (feed_comments.EFIC_U_URL) .

        ods:proxy (feed_comments.EFIC_U_URL) a foaf:Person ;
        foaf:name feed_comments.EFIC_U_NAME;
        foaf:mbox ods:mbox (feed_comments.EFIC_U_MAIL) .

            ods:feed (feed_comments.EFI_FEED_ID)
        sioc:container_of
            ods:feed_comment (feed_comments.U_NAME, feed_comments.WAI_NAME, feed_comments.EFIC_ITEM_ID, feed_comments.EFIC_ID) .

            ods:feed_item (feed_comments.EFI_FEED_ID, feed_comments.EFIC_ITEM_ID)
        sioc:has_reply
        ods:feed_comment (feed_comments.U_NAME, feed_comments.WAI_NAME, feed_comments.EFIC_ITEM_ID, feed_comments.EFIC_ID) .

            ods:feed_item (feed_links.EFI_FEED_ID, feed_links.EFI_ID)
        sioc:links_to
        ods:proxy (feed_links.EFIL_LINK) .

        ods:feed_item (feed_atts.EFI_FEED_ID, feed_atts.EFI_ID)
        sioc:attachment
        ods:proxy (feed_atts.EFIE_URL) .

        ods:feed_item (feed_posts.EFI_FEED_ID, feed_posts.EFI_ID) a atom:Entry ;
        sioc:has_container ods:feed (feed_posts.EFI_FEED_ID) ;
        dc:title feed_posts.EFI_TITLE ;
        dct:created feed_posts.PUBLISH_DATE ;
        dct:modified feed_posts.PUBLISH_DATE ;
        sioc:link ods:proxy (feed_posts.EFI_LINK) ;
        sioc:content feed_posts.EFI_DESCRIPTION ;
        atom:title feed_posts.EFI_TITLE ;
        atom:source ods:feed (feed_posts.EFI_FEED_ID) ;
        atom:published feed_posts.PUBLISH_DATE ;
        atom:updated feed_posts.PUBLISH_DATE ;
        atom:content ods:feed_item_text (feed_posts.EFI_FEED_ID, feed_posts.EFI_ID) .

        ods:feed (feed_posts.EFI_FEED_ID) sioc:container_of ods:feed_item (feed_posts.EFI_FEED_ID, feed_posts.EFI_ID) .

        ods:feed_item_text (feed_posts.EFI_FEED_ID, feed_posts.EFI_ID) a atom:Content ;
        atom:type "text/xhtml" ;
        atom:lang "en-US" ;
        atom:body feed_posts.EFI_DESCRIPTION .

        ods:feed (feed_posts.EFI_FEED_ID)
        atom:contains
        ods:feed_item (feed_posts.EFI_FEED_ID, feed_posts.EFI_ID) .
            # end Feeds

        # Photo
        ods:photo_post (photo_posts.RES_FULL_PATH) a exif:IFD ;
        dc:title photo_posts.RES_NAME ;
        dct:created photo_posts.RES_CREATED ;
        dct:modified photo_posts.RES_MODIFIED ;
        sioc:content photo_posts.RES_DESCRIPTION ;
        sioc:has_creator ods:user (photo_posts.U_OWNER) ;
        foaf:maker ods:person (photo_posts.U_OWNER) ;
        sioc:link ods:proxy (photo_posts.RES_LINK) ;
        sioc:has_container ods:photo_forum (photo_posts.U_MEMBER, photo_posts.WAI_NAME) .

        ods:photo_forum (photo_posts.U_MEMBER, photo_posts.WAI_NAME)
        sioc:container_of
        ods:photo_post (photo_posts.RES_FULL_PATH) .

        ods:user (photo_posts.U_OWNER)
        sioc:creator_of
        ods:photo_post (photo_posts.RES_FULL_PATH) .

        ods:photo_post (photo_tags.RES_FULL_PATH)
        sioc:topic
        ods:tag (photo_tags.U_MEMBER, photo_tags.RES_TAG) .

        ods:tag (photo_tags.U_MEMBER, photo_tags.RES_TAG) a skos:Concept ;
        skos:prefLabel photo_tags.RES_TAG ;
        skos:isSubjectOf ods:photo_post (photo_tags.RES_FULL_PATH) .

        ods:photo_comment (photo_comments.RES_FULL_PATH, photo_comments.COMMENT_ID) a sioct:Comment ;
        sioc:reply_of ods:photo_post (photo_comments.RES_FULL_PATH) ;
        sioc:has_container ods:photo_forum (photo_comments.U_MEMBER, photo_comments.WAI_NAME) ;
        dc:title photo_comments.RES_NAME ;
        dct:created photo_comments.CREATE_DATE ;
        dct:modified photo_comments.MODIFY_DATE ;
        sioc:content photo_comments.TEXT ;
        foaf:maker ods:person (photo_comments.U_MAKER) .

        ods:photo_post (photo_comments.RES_FULL_PATH)
        sioc:has_reply
        ods:photo_comment (photo_comments.RES_FULL_PATH, photo_comments.COMMENT_ID) .
        # end Photo

        # Polls
        # end Polls

        # Mail
        # end Mail

        # Wiki
            ods:wiki_post (wiki_posts.U_NAME, wiki_posts.CLUSTERNAME, wiki_posts.LOCALNAME) a wikiont:Article ;
        dc:title wiki_posts.LOCALNAME ;
        dct:created wiki_posts.RES_CREATED ;
        dct:modified wiki_posts.RES_MODIFIED ;
        sioc:content wiki_posts.RES_CONTENT ;
        sioc:has_creator ods:user (wiki_posts.U_NAME) ;
        foaf:maker ods:person (wiki_posts.U_NAME) ;
        sioc:has_container ods:wiki_forum (wiki_posts.U_NAME, wiki_posts.CLUSTERNAME) .

        ods:wiki_forum (wiki_posts.U_NAME, wiki_posts.CLUSTERNAME)
        sioc:container_of
        ods:wiki_post (wiki_posts.U_NAME, wiki_posts.CLUSTERNAME, wiki_posts.LOCALNAME) .

        ods:user (wiki_posts.U_NAME)
        sioc:creator_of
        ods:wiki_post (wiki_posts.U_NAME, wiki_posts.CLUSTERNAME, wiki_posts.LOCALNAME) .

        # end Wiki

            # Community
        ods:community_forum (community.C_OWNER, community.CM_COMMUNITY_ID) a sioc:Community ;
        sioc:has_part ods:forum (community.A_OWNER, community.A_TYPE, community.CM_MEMBER_APP) .

        ods:forum (community.A_OWNER, community.A_TYPE, community.CM_MEMBER_APP)
        sioc:part_of
        ods:community_forum (community.C_OWNER, community.CM_COMMUNITY_ID) .
            # end Community

        # NNTP
        ods:nntp_forum (nntp_groups.NG_NAME) a sioct:MessageBoard ;
        sioc:id nntp_groups.NG_NAME ;
        sioc:description nntp_groups.NG_DESC .

        ods:nntp_post (nntp_posts.NG_NAME, nntp_posts.NM_ID) a sioct:BoardPost ;
        sioc:content nntp_posts.NM_BODY ;
        dc:title nntp_posts.FTHR_SUBJ ;
        dct:created  nntp_posts.REC_DATE ;
        dct:modified nntp_posts.REC_DATE ;
        foaf:maker ods:proxy (nntp_posts.MAKER) ;
        sioc:reply_of ods:nntp_post (nntp_posts.NG_NAME, nntp_posts.FTHR_REFER) ;
        sioc:has_container ods:nntp_forum (nntp_posts.NG_NAME) .

        ods:nntp_post (nntp_posts.NG_NAME, nntp_posts.FTHR_REFER)
        sioc:has_reply
        ods:nntp_post (nntp_posts.NG_NAME, nntp_posts.NM_ID) .

        ods:nntp_forum (nntp_posts.NG_NAME)
        sioc:container_of
        ods:nntp_post (nntp_posts.NG_NAME, nntp_posts.NM_ID) .

        ods:nntp_role (nntp_groups.NG_NAME)
        sioc:has_scope
        ods:nntp_forum (nntp_groups.NG_NAME) .

        ods:nntp_forum (nntp_groups.NG_NAME)
        sioc:scope_of
        ods:nntp_role (nntp_groups.NG_NAME) .

        ods:user (nntp_users.U_NAME)
        sioc:has_function
        ods:nntp_role (nntp_users.NG_NAME) .

        ods:nntp_role (nntp_users.NG_NAME)
        sioc:function_of
        ods:user (nntp_users.U_NAME) .

        ods:nntp_post (nntp_links.NG_NAME, nntp_links.NML_MSG_ID)
        sioc:links_to
        ods:proxy (nntp_links.NML_URL) .
        # end NNTP

      } .
    } .
;
```

<span class="emphasis">*URL Rewrite Rules for ODS*</span>

``` programlisting
create procedure DB.DBA.URL_REW_ODS_ACCEPT ()
{
  declare accept, ret any;
  accept := http_request_header (http_request_header (), 'Accept');
  if (not isstring (accept))
    return null;
  ret := null;
  if (regexp_match ('(application|text)/rdf.(xml|n3|turtle|ttl)', accept) is not null)
    {
      if (regexp_match ('application/rdf.xml', accept) is not null)
    {
      ret := 'rdf';
    }
      else if (regexp_match ('text/rdf.n3', accept) is not null)
    {
      ret := 'n3';
    }
      else if (regexp_match ('application/rdf.turtle', accept) is not null or
        regexp_match ('application/rdf.ttl', accept) is not null)
    {
      ret := 'n3';
    }
    }
  return ret;
};

create procedure  DB.DBA.URL_REW_ODS_SPQ (in graph varchar, in iri varchar, in acc varchar)
{
  declare q, ret any;
  iri := replace (iri, '''', '%27');
  iri := replace (iri, '<', '%3C');
  iri := replace (iri, '>', '%3E');
  q := sprintf ('define input:inference <%s> DESCRIBE <%s> FROM <%s>', graph, iri, graph);
  ret := sprintf ('/sparql?query=%U&format=%U', q, acc);
  return ret;
};

create procedure DB.DBA.URL_REW_ODS_USER (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (current_proc_name ());
  declare acc, ret any;
  declare q, iri, graph any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      graph := sioc..get_graph ();
      iri := sprintf ('%s/%U', graph, val);
      if (val like 'person/%')
    {
      val := substring (val, 8, length (val));
      ret := sprintf ('/ods/foaf.vsp?uname=%U&fmt=%U', val, acc);
    }
      else
        ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
    }
  else
    {
      http_header (http_header_get ()||sprintf ('X-XRDS-Location: %s\r\n',
        DB.DBA.wa_link (1, '/dataspace/'||val||'/yadis.xrds')));

      if (val like 'person/%')
    val := substring (val, 8, length (val));
      ret := sprintf ('/ods/uhome.vspx?page=1&ufname=%s', val);
    }
  return ret;
};

create procedure DB.DBA.URL_REW_ODS_USER_GEM (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (current_proc_name ());
  declare acc, ret any;
  declare q, iri, graph, path, is_person any;

  path := http_path ();
  if (path like '%.rdf')
    acc := 'rdf';
  else if (path like '%.n3')
    acc := 'n3';
  else if (path like '%.ttl')
    acc := 'n3';
  else if (path like '%/yadis.xrds')
    acc := 'yadis';
  else
    acc := 'rdf';

  if (acc <> 'yadis')
    {
      is_person := matches_like (path, '%/about.%');
      graph := sioc..get_graph ();
      if (is_person)
    {
          --iri := sprintf ('%s/person/%U', graph, val);
      ret := sprintf ('/ods/foaf.vsp?uname=%U&fmt=%U', val, acc);
    }
      else
    {
          iri := sprintf ('%s/%U', graph, val);
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
    }
    }
  else
    {
      ret := sprintf ('/ods/yadis.vsp?uname=%U', val);
    }
  return ret;
};

create procedure DB.DBA.URL_REW_ODS_GEM (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (current_proc_name ());
  declare acc, ret any;
  declare q, iri, graph, path, pos any;

  path := http_path ();
  if (path like '%.rdf')
    acc := 'rdf';
  else if (path like '%.n3')
    acc := 'n3';
  else if (path like '%.ttl')
    acc := 'n3';
  else
    acc := 'rdf';
  graph := sioc..get_graph ();
  pos := strrchr (path, '/');
  path := subseq (path, 0, pos);

  if (val = 'person')
    {
      pos := strrchr (path, '/');
      val := subseq (path, pos+1, length (path));
      ret := sprintf ('/ods/foaf.vsp?uname=%U&fmt=%U', val, acc);
    }
  else
    {
      iri := sprintf ('http://%s%s', sioc..get_cname (), path);
      ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
    }
  return ret;
};

create procedure DB.DBA.URL_REW_ODS_APP (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (current_proc_name (), val);
  if (par = 'app')
    return sprintf (fmt, wa_app_to_type (val));
  return sprintf (fmt, val);
};

create procedure DB.DBA.URL_REW_ODS_BLOG (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (par, fmt, val);
--  dbg_obj_print (current_proc_name (), val);
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'inst')
    {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
    }
      else
    return '';
    }
  else if (par = 'inst')
    {
      declare url any;
      val := split_and_decode (val)[0];
      url := (SELECT WAM_HOME_PAGE FROM WA_MEMBER WHERE WAM_INST = val AND WAM_MEMBER_TYPE = 1);
      if (url is not null)
        val := url;
      return sprintf (fmt, val);
    }
  else if (par = 'id' and val <> '')
    {
      if (atoi (val) = 0 and val <> '0')
    fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
};

create procedure DB.DBA.URL_REW_ODS_NNTP (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (par, fmt, val);
--  dbg_obj_print (current_proc_name (), val);
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
       declare q, iri, graph any;
       graph := sioc..get_graph ();
       iri := 'http://' || sioc..get_cname () || http_path ();
--       dbg_obj_print (iri);
       ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
       return ret;
    }
  else if (par = 'grp')
    {
      declare gid int;
      val := split_and_decode (val)[0];
      gid := (SELECT NG_GROUP FROM DB.DBA.NEWS_GROUPS WHERE NG_NAME = val);
      ret := sprintf ('/nntpf/nntpf_nthread_view.vspx?group=%d', gid);
      return ret;
    }
  else if (par = 'post')
    {
      ret := sprintf ('/nntpf/nntpf_disp_article.vspx?id=%U', encode_base64 (val));
      return ret;
    }
}
;

create procedure DB.DBA.URL_REW_ODS_XD (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (par, fmt, val);
--  dbg_obj_print (current_proc_name (), val);
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
       declare q, iri, graph any;
       graph := sioc..get_graph ();
       iri := 'http://' || sioc..get_cname () || http_path ();
--       dbg_obj_print (iri);
       ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
       return ret;
    }
  else if (par = 'inst')
    {
      val := split_and_decode (val)[0];
      ret := (SELECT WAM_HOME_PAGE FROM WA_MEMBER WHERE WAM_INST = val and WAM_MEMBER_TYPE = 1);
      return ret;
    }
}
;

create procedure DB.DBA.URL_REW_ODS_WIKI (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (par, fmt, val);
--  dbg_obj_print (current_proc_name (), val);
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
       declare q, iri, graph any;
       graph := sioc..get_graph ();
       iri := 'http://' || sioc..get_cname () || http_path ();
--       dbg_obj_print (iri);
       ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
       return ret;
    }
  else if (par = 'inst')
    {
      declare _inst DB.DBA.web_app;
      _inst := (SELECT WAI_INST FROM WA_INSTANCE WHERE WAI_NAME = val);
      ret := _inst.wa_post_url (null, null, val, val);
--      dbg_obj_print ('ret', ret);
      return ret;
    }
  else if (par = 'post')
    {
      return '/'||val;
    }
}
;

create procedure DB.DBA.URL_REW_ODS_PHOTO (in par varchar, in fmt varchar, in val varchar)
{
--  dbg_obj_print (par, fmt, val);
--  dbg_obj_print (current_proc_name (), val);
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
       declare q, iri, graph any;
       graph := sioc..get_graph ();
       iri := 'http://' || sioc..get_cname () || http_path ();
--       dbg_obj_print (iri);
       ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
       return ret;
    }
  else if (par = 'inst')
    {
      val := split_and_decode (val)[0];
      ret := (SELECT WAM_HOME_PAGE FROM WA_MEMBER WHERE WAM_INST = val AND WAM_MEMBER_TYPE = 1);
      return ret;
    }
  else if (par = 'post')
    {
      declare id int;
      declare col, nam varchar;
      declare exit handler for not found
    {
      signal ('22023', sprintf ('The resource %d doesn''t exists', id));
    };
      id := atoi(ltrim(val, '/'));
      SELECT RES_FULL_PATH INTO nam FROM WS.WS.SYS_DAV_RES WHERE RES_ID = id;
      return nam;
    }
}
;

create procedure DB.DBA.URL_REW_ODS_ADDRESSBOOK (in par varchar, in fmt varchar, in val varchar)
{
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'instance')
        {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
          }
      else
          return '';
    }
  else if (par = 'instance')
    {
      declare id, url any;
      val := split_and_decode (val)[0];
      id := AB.WA.domain_id (val);
      if (id is not null) {
        url := AB.WA.ab_url (id);
        if (url is not null)
          val := url;
      }
      return sprintf (fmt, val);
    }
  else if (par = 'params')
    {
      if (atoi (val) = 0 and val <> '0')
        fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
}
;

create procedure DB.DBA.URL_REW_ODS_BOOKMARK (in par varchar, in fmt varchar, in val varchar)
{
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'instance')
        {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
          }
      else
          return '';
    }
  else if (par = 'instance')
    {
      declare id, url any;
      val := split_and_decode (val)[0];
      id := BMK.WA.domain_id (val);
      if (id is not null) {
        url := BMK.WA.bookmark_url (id);
        if (url is not null)
          val := url;
      }
      return sprintf (fmt, val);
    }
  else if (par = 'params')
    {
      if (atoi (val) = 0 and val <> '0')
        fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
}
;

create procedure DB.DBA.URL_REW_ODS_BRIEFCASE (in par varchar, in fmt varchar, in val varchar)
{
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'instance')
        {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
          }
      else
          return '';
    }
  else if (par = 'instance')
    {
      declare id, url any;
      val := split_and_decode (val)[0];
      id := ODRIVE.WA.domain_id (val);
      if (id is not null) {
        url := ODRIVE.WA.odrive_url (id);
        if (url is not null)
          val := url;
      }
      return sprintf (fmt, val);
    }
  else if (par = 'params')
    {
      if (atoi (val) = 0 and val <> '0')
        fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
}
;

create procedure DB.DBA.URL_REW_ODS_CALENDAR (in par varchar, in fmt varchar, in val varchar)
{
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'instance')
        {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
          }
      else
          return '';
    }
  else if (par = 'instance')
    {
      declare id, url any;
      val := split_and_decode (val)[0];
      id := CAL.WA.domain_id (val);
      if (id is not null) {
        url := CAL.WA.calendar_url (id);
        if (url is not null)
          val := url;
      }
      return sprintf (fmt, val);
    }
  else if (par = 'params')
    {
      if (atoi (val) = 0 and val <> '0')
        fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
}
;

create procedure DB.DBA.URL_REW_ODS_FEEDS (in par varchar, in fmt varchar, in val varchar)
{
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'instance')
        {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
          }
      else
          return '';
    }
  else if (par = 'instance')
    {
      declare id, url any;
      val := split_and_decode (val)[0];
      id := ENEWS.WA.domain_id (val);
      if (id is not null) {
        url := ENEWS.WA.enews_url (id) || 'news.vspx';
        if (url is not null)
          val := url;
      }
      return sprintf (fmt, val);
    }
  else if (par = 'params')
    {
      if (atoi (val) = 0 and val <> '0')
        fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
}
;

create procedure DB.DBA.URL_REW_ODS_POLLS (in par varchar, in fmt varchar, in val varchar)
{
  declare acc, ret any;

  acc := DB.DBA.URL_REW_ODS_ACCEPT ();
  if (acc is not null)
    {
      if (par = 'instance')
        {
          declare q, iri, graph any;
          graph := sioc..get_graph ();
          iri := 'http://' || sioc..get_cname () || http_path ();
          ret := DB.DBA.URL_REW_ODS_SPQ (graph, iri, acc);
          return ret;
          }
      else
          return '';
    }
  else if (par = 'instance')
    {
      declare id, url any;
      val := split_and_decode (val)[0];
      id := POLLS.WA.domain_id (val);
      if (id is not null) {
        url := POLLS.WA.polls_url (id);
        if (url is not null)
          val := url;
      }
      return sprintf (fmt, val);
    }
  else if (par = 'params')
    {
      if (atoi (val) = 0 and val <> '0')
        fmt := '%s';
      else
        fmt := '?id=%s';
      return sprintf (fmt, val);
    }
}
;

create procedure DB.DBA.URL_REW_ODS_FOAF_EXT (in par varchar, in fmt varchar, in val varchar)
{
  if (par = '*accept*')
    {
      declare ext any;
      ext := 'rdf';
      if (val = 'text/rdf+n3')
    ext := 'n3';
      return sprintf (fmt, ext);
    }
  else
    return sprintf (fmt, val);
}
;

create procedure ur_ods_rdf_doc (in path varchar)
{
  declare r any;
  r := regexp_match ('[^/]*\x24', path);
  return r||'#this';
};

create procedure ur_ods_html_doc (in path varchar)
{
  declare pos, r any;
  if (path like '%/foaf.%')
    {
      pos := strrchr (path, '/');
    }
  else if (path like '%#%')
    {
      pos := strrchr (path, '#');
    }
  if (pos > 0)
    r := subseq (path, 0, pos);
  else
    r := '/';
  return r;
};
-- ODS Rules

-- http://cname/dataspace/uname
-- http://cname/dataspace/person/uname

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule1', 1,
    '/dataspace/((person/)?[^/#]*)', vector('ufname'), 1,
    '%s', vector('ufname'),
    'DB.DBA.URL_REW_ODS_USER');

-- http://cname/dataspace/uname with Accept will do 303 to the /sparql
DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule2', 1,
    '/dataspace/([^/]*)', vector('ufname'), 1,
    '/sparql?query=define+input%%3Ainference+%%3Chttp%%3A//^{URIQADefaultHost}^/dataspace%%3E+DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/dataspace/%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/dataspace%%3E&format=%U', vector('ufname', '*accept*'),
    null,
    '(application|text)/rdf.(xml|n3|turtle|ttl)',
    0,
    303);

-- http://cname/dataspace/uname/app_type
DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule3', 1,
    '/dataspace/((?!person)[^/]*)/([^\\./]*)', vector('ufname', 'app'), 2,
    '/ods/app_inst.vspx?app=%s&ufname=%s&l=1', vector('app', 'ufname'),
    'DB.DBA.URL_REW_ODS_APP');

-- http://cname/dataspace/uname/file.ext
DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule4', 1,
    '/dataspace/([^/]*)/(sioc|about|yadis)\\.(rdf|n3|ttl|xrds)', vector('ufname', 'file', 'fmt'), 3,
    '%s', vector('ufname'),
    'DB.DBA.URL_REW_ODS_USER_GEM');

-- Rules for FOAF profile

-- http://cname/dataspace/person/uname with Accept, do 303 to http://cname/dataspace/person/uname/foaf.ext
DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule5', 1,
    '/dataspace/person/([^/#]*)/?', vector('ufname'), 1,
    '/dataspace/person/%U/foaf.%s', vector('ufname', '*accept*'),
    'DB.DBA.URL_REW_ODS_FOAF_EXT',
    '(application|text)/rdf.(xml|n3|turtle|ttl)',
    2,
    303);

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule6', 1,
    '/dataspace/person/([^/]*)/page/([^/]*)/?', vector('ufname', 'page'), 1,
    '/dataspace/person/%U/foaf.%s?page=%s', vector('ufname', '*accept*', 'page'),
    'DB.DBA.URL_REW_ODS_FOAF_EXT',
    '(application|text)/rdf.(xml|n3|turtle|ttl)',
    2,
    303);

-- http://cname/dataspace/person/uname/foaf.ext
DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_rule7', 1,
    '/dataspace/person/([^/]*)/foaf.(rdf|n3|ttl)', vector('ufname', 'fmt'), 1,
    '/ods/foaf.vsp?uname=%U&fmt=%U', vector('ufname', 'fmt'),
    null,
    null,
    2,
    null);

-- App Instance Gem

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_post_gem_rule', 1,
    '/dataspace/([^/]*)/([^/]*)/([^/]*/)?([^/]*/)?(sioc|about)\\.(rdf|n3|ttl)', vector('ufname', 'app', 'inst'), 4,
    '%s', vector('ufname'),
    'DB.DBA.URL_REW_ODS_GEM');

-- Weblog Rules

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_blog_rule1', 1,
    '/dataspace/([^/]*)/weblog/([^/]*)', vector('ufname', 'inst'), 2,
    '%s', vector('inst'),
    'DB.DBA.URL_REW_ODS_BLOG');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_blog_rule2', 1,
    '/dataspace/([^/]*)/weblog/([^/]*)/([^/]*)', vector('ufname', 'inst', 'id'), 3,
    '%s%s', vector('inst', 'id'),
    'DB.DBA.URL_REW_ODS_BLOG');

-- Discussion rules

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_nntp_rule1', 1,
    '/dataspace/discussion/([^/]*)', vector('grp'), 1,
    '%s', vector('grp'),
    'DB.DBA.URL_REW_ODS_NNTP');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_nntp_rule2', 1,
    '/dataspace/discussion/([^/]*)/((?!sioc)(?!about)[^/]*)', vector('grp', 'post'), 2,
    '%s', vector('post'),
    'DB.DBA.URL_REW_ODS_NNTP');

-- Community

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_xd_rule1', 1,
    '/dataspace/([^/]*)/community/([^/]*)', vector('ufname', 'inst'), 2,
    '%s', vector('inst'),
    'DB.DBA.URL_REW_ODS_XD');

-- Wiki

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_wiki_rule1', 1,
    '/dataspace/([^/]*)/wiki/([^/]*)', vector('ufname', 'inst'), 2,
    '%s', vector('inst'),
    'DB.DBA.URL_REW_ODS_WIKI');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_wiki_rule2', 1,
    '/dataspace/([^/]*)/wiki/([^/]*)/([^/]*)', vector('ufname', 'inst', 'post'), 2,
    '%s%s', vector('inst', 'post'),
    'DB.DBA.URL_REW_ODS_WIKI');

-- Gallery

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_photo_rule1', 1,
    '/dataspace/([^/]*)/photos/([^/]*)', vector('ufname', 'inst'), 2,
    '%s', vector('inst'),
    'DB.DBA.URL_REW_ODS_PHOTO');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('ods_photo_rule2', 1,
    '/dataspace/([^/]*)/photos/([^/]*)/([^/]*)', vector('ufname', 'inst', 'post'), 2,
    '%s', vector('post'),
    'DB.DBA.URL_REW_ODS_PHOTO');

-- AddressBook

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_addressbook_rule1',
    1,
    '/dataspace/([^/]*)/addressbook/([^/]*)',
    vector('uname', 'instance'),
    2,
    '%s', vector('instance'),
    'DB.DBA.URL_REW_ODS_ADDRESSBOOK');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_addressbook_rule2',
    1,
    '/dataspace/([^/]*)/addressbook/([^/]*)/(.*)',
    vector('uname', 'instance', 'params'),
    3,
    '%s%s',
    vector('instance', 'params'),
    'DB.DBA.URL_REW_ODS_ADDRESSBOOK');

-- Bookmark

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_bookmark_rule1',
    1,
    '/dataspace/([^/]*)/bookmark/([^/]*)',
    vector('uname', 'instance'),
    2,
    '%s', vector('instance'),
    'DB.DBA.URL_REW_ODS_BOOKMARK');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_bookmark_rule2',
    1,
    '/dataspace/([^/]*)/bookmark/([^/]*)/(.*)',
    vector('uname', 'instance', 'params'),
    3,
    '%s%s',
    vector('instance', 'params'),
    'DB.DBA.URL_REW_ODS_BOOKMARK');

-- Briefcase

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_briefcase_rule1',
    1,
    '/dataspace/([^/]*)/briefcase/([^/]*)',
    vector('uname', 'instance'),
    2,
    '%s', vector('instance'),
    'DB.DBA.URL_REW_ODS_BRIEFCASE');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_briefcase_rule2',
    1,
    '/dataspace/([^/]*)/briefcase/([^/]*)/(.*)',
    vector('uname', 'instance', 'params'),
    3,
    '%s%s',
    vector('instance', 'params'),
    'DB.DBA.URL_REW_ODS_BRIEFCASE');

-- Calendar

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_calendar_rule1',
    1,
    '/dataspace/([^/]*)/calendar/([^/]*)',
    vector('uname', 'instance'),
    2,
    '%s', vector('instance'),
    'DB.DBA.URL_REW_ODS_CALENDAR');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_calendar_rule2',
    1,
    '/dataspace/([^/]*)/calendar/([^/]*)/(.*)',
    vector('uname', 'instance', 'params'),
    3,
    '%s%s',
    vector('instance', 'params'),
    'DB.DBA.URL_REW_ODS_CALENDAR');

-- Feeds

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_feeds_rule1',
    1,
    '/dataspace/([^/]*)/feeds/([^/]*)',
    vector('uname', 'instance'),
    2,
    '%s', vector('instance'),
    'DB.DBA.URL_REW_ODS_FEEDS');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_feeds_rule2',
    1,
    '/dataspace/([^/]*)/feeds/([^/]*)/(.*)',
    vector('uname', 'instance', 'params'),
    3,
    '%s%s',
    vector('instance', 'params'),
    'DB.DBA.URL_REW_ODS_FEEDS');

-- Polls

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_polls_rule1',
    1,
    '/dataspace/([^/]*)/polls/([^/]*)',
    vector('uname', 'instance'),
    2,
    '%s', vector('instance'),
    'DB.DBA.URL_REW_ODS_POLLS');

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ods_polls_rule2',
    1,
    '/dataspace/([^/]*)/polls/([^/]*)/(.*)',
    vector('uname', 'instance', 'params'),
    3,
    '%s%s',
    vector('instance', 'params'),
    'DB.DBA.URL_REW_ODS_POLLS');

-- ODS Base rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_base_rule_list1', 1,
        vector(
            'ods_rule1', 'ods_rule2', 'ods_rule3', 'ods_rule4'
          ));

DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_foaf_rule_list1', 1,
        vector(
            'ods_rule5', 'ods_rule6', 'ods_rule7'
          ));

DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_gems_rule_list1', 1,
        vector(
            'ods_post_gem_rule'
          ));

-- ODS Blog rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_blog_rule_list1', 1,
        vector(
        'ods_blog_rule1', 'ods_blog_rule2'
          ));

-- ODS Discussion rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_nntp_rule_list1', 1,
        vector(
        'ods_nntp_rule1', 'ods_nntp_rule2'
          ));

-- ODS Community rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_xd_rule_list1', 1,
        vector(
        'ods_xd_rule1'
          ));

-- ODS Wiki rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_wiki_rule_list1', 1,
        vector(
        'ods_wiki_rule1', 'ods_wiki_rule2'
          ));

-- ODS Gallery rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_photo_rule_list1', 1,
        vector(
        'ods_photo_rule1', 'ods_photo_rule2'
          ));

-- ODS AddressBook rules
DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ods_addressbook_rule_list1',
    1,
    vector (
        'ods_addressbook_rule1',
        'ods_addressbook_rule2'
      ));

-- ODS Bookmark rules
DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ods_bookmark_rule_list1',
    1,
    vector (
        'ods_bookmark_rule1',
        'ods_bookmark_rule2'
      ));

-- ODS Briefcase rules
DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ods_briefcase_rule_list1',
    1,
    vector (
        'ods_briefcase_rule1',
        'ods_briefcase_rule2'
      ));

-- ODS Calendar rules
DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ods_calendar_rule_list1',
    1,
    vector (
        'ods_calendar_rule1',
        'ods_calendar_rule2'
      ));

-- ODS Feeds rules
DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ods_feeds_rule_list1',
    1,
    vector (
        'ods_feeds_rule1',
        'ods_feeds_rule2'
      ));

-- ODS Polls rules
DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ods_polls_rule_list1',
    1,
    vector (
        'ods_polls_rule1',
        'ods_polls_rule2'
      ));

-- All ODS Rules
DB.DBA.URLREWRITE_CREATE_RULELIST ('ods_rule_list1', 1,
        vector(
      'ods_base_rule_list1',
      'ods_foaf_rule_list1',
      'ods_blog_rule_list1',
      'ods_nntp_rule_list1',
      'ods_xd_rule_list1',
      'ods_wiki_rule_list1',
      'ods_photo_rule_list1',
      'ods_addressbook_rule_list1',
      'ods_bookmark_rule_list1',
      'ods_briefcase_rule_list1',
      'ods_calendar_rule_list1',
      'ods_feeds_rule_list1',
      'ods_polls_rule_list1',
      'ods_gems_rule_list1'
          ));

DB.DBA.XML_SET_NS_DECL ('ods', 'http://www.openlinksw.com/virtuoso/ods/', 2);
```

</div>

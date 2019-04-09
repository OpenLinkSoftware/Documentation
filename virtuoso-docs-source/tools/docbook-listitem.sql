-- Scripts for support functions handling docbook whitespace-sensitive elements

drop table  tdh_block_data;
commit work;

create table tdh_block_data (pos integer, elname varchar, elid varchar primary key, elcontent long varchar);

create procedure db.dba.tdh_fix_block(in pos integer, in elname varchar, in elcontent any, in elwhole any)
{
  declare shasum varchar;
  declare normcontent, content long varchar;
  if(elcontent is null or elwhole is null) {
  elwhole:=xtree_doc('<xml></xml>', 0);
  }

 content := serialize_to_UTF8_xml(elwhole);
 normcontent := serialize_to_UTF8_xml(elwhole);

 normcontent := replace(normcontent, '&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; ?&gt;', '');
 normcontent := replace(normcontent, '<?xml version="1.0" encoding="UTF-8" ?>', '');
 normcontent := replace(normcontent, ' xmlns="http://docbook.org/ns/docbook"', '');

 normcontent := replace(normcontent, '\r', '');
 normcontent := replace(normcontent, '\n', '');
 normcontent := replace(normcontent, ' ', '');
 normcontent := replace(normcontent, '\t', '');

 normcontent := regexp_replace(normcontent, '<.*?>', '');

if(normcontent is null or length(normcontent)=0) {
  normcontent:='';
 }

shasum := sha1_digest(normcontent);
dbg_printf('TDH: Searching for a %s with hash [%s]', elname, shasum);

 for(select T.elcontent as _fromtable, T.elname as _elname from tdh_block_data T where elid=shasum) do {
   dbg_printf('TDH: hit!');
   return xtree_doc(_fromtable);
  }
 dbg_printf('TDH: miss!');
 insert into tdh_block_data values (pos, elname, shasum, content);
 return xtree_doc(content);
}
;

grant execute on db.dba.tdh_fix_block to public;


xpf_extension ('http://www.openlinksw.com/virtuoso/xslt/:tdh_fix_block', fix_identifier_case('db.dba.tdh_fix_block'));

dbg_printf('\n\nTDH: to start, there are [%d] things in table', (select count(*) from tdh_block_data));

select xslt_stale('file:DocBook/docbook-fix-listitems.xslt');

dbg_printf('TDH: learning from authoritative document');
xslt('file:DocBook/docbook-fix-listitems.xslt', xtree_doc(file_to_string_output('./alldocs-develop.xml')));

dbg_printf('TDH: learned [%d] things', (select count(*) from tdh_block_data));

dbg_printf('TDH: running on post-fixup valid document');
string_to_file('./alldocs-fixed.xml',
       serialize_to_UTF8_xml(xslt('file:DocBook/docbook-fix-listitems-p2.xslt',
        xtree_doc(file_to_string_output('./alldocs.xml')))), -2);

dbg_printf('TDH: all done!');

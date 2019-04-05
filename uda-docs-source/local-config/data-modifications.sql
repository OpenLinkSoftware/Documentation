
-- Script to modify docs mdata rendered with Inclusion.Engine

sparql insert into <urn:openlink:mdata>  { ?s a schema:TechArticle } where  { ?s a schema:APIReference . } ;

incleng..staleall();


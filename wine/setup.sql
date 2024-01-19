ATTACH_FROM_CSV('spider.wine.grapes','virtuoso-cwd-demos/wine/data/grapes.csv',',','\n',null,1,vector(1));
ATTACH_FROM_CSV('spider.wine.appellations','virtuoso-cwd-demos/wine/data/appellations.csv',',','\n',null,1,vector(1));
ATTACH_FROM_CSV('spider.wine.wine','virtuoso-cwd-demos/wine/data/wine.csv',',','\n',null,1,null);

GRANT SELECT ON spider.wine.grapes TO SPARQL_SELECT;
GRANT SELECT ON spider.wine.appellations TO SPARQL_SELECT;
GRANT SELECT ON spider.wine.wine TO SPARQL_SELECT;

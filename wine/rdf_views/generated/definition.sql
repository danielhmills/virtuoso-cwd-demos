grant select on "spider"."wine"."appellations" to SPARQL_SELECT;
grant select on "spider"."wine"."grapes" to SPARQL_SELECT;
grant select on "spider"."wine"."wine" to SPARQL_SELECT;


SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
create iri class spider-wines:appellations "http://^{URIQADefaultHost}^/spider-wines/appellations/No/%d#this" (in _No integer not null) . ;
SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
create iri class spider-wines:grapes "http://^{URIQADefaultHost}^/spider-wines/grapes/ID/%d#this" (in _ID integer not null) . ;
SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
create iri class spider-wines:wine "http://^{URIQADefaultHost}^/spider-wines/wine/No/%d#this" (in _No integer not null) . ;


drop view "spider"."wine"."spider-wines__Total"; 
create view "spider"."wine"."spider-wines__Total" as select (cnt0*cnt1)+(cnt2*cnt3)+(cnt4*cnt5) AS cnt from 
 (select count(*) cnt0 from "spider"."wine"."appellations") tb0, 
 (select count(*)+1 as cnt1 from DB.DBA.TABLE_COLS where "TABLE" = 'spider.wine.appellations'  and "COLUMN" <> '_IDN') tb1,
 (select count(*) cnt2 from "spider"."wine"."grapes") tb2, 
 (select count(*)+1 as cnt3 from DB.DBA.TABLE_COLS where "TABLE" = 'spider.wine.grapes'  and "COLUMN" <> '_IDN') tb3,
 (select count(*) cnt4 from "spider"."wine"."wine") tb4, 
 (select count(*)+1 as cnt5 from DB.DBA.TABLE_COLS where "TABLE" = 'spider.wine.wine'  and "COLUMN" <> '_IDN') tb5
; 
grant select on "spider"."wine"."spider-wines__Total" to SPARQL_SELECT; 


SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
prefix spider-wines-stat: <http://demo.openlinksw.com/spider-wines/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "spider"."wine"."appellations" as appellations_s
 { 
   create spider-wines:qm-appellations as graph iri ("http://^{URIQADefaultHost}^/spider-wines#")  
    { 
      # Maps from columns of "spider.wine.appellations"
      spider-wines:appellations (appellations_s."No")  a spider-wines:appellations ;
      spider-wines:no appellations_s."No" as spider-wines:wine-appellations-no ;
      spider-wines:appelation appellations_s."Appelation" as spider-wines:wine-appellations-appelation ;
      spider-wines:county appellations_s."County" as spider-wines:wine-appellations-county ;
      spider-wines:state appellations_s."State" as spider-wines:wine-appellations-state ;
      spider-wines:area appellations_s."Area" as spider-wines:wine-appellations-area ;
      spider-wines:isava appellations_s."isAVA" as spider-wines:wine-appellations-isava .

    }
 }

;

SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
prefix spider-wines-stat: <http://demo.openlinksw.com/spider-wines/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "spider"."wine"."grapes" as grapes_s
 { 
   create spider-wines:qm-grapes as graph iri ("http://^{URIQADefaultHost}^/spider-wines#")  
    { 
      # Maps from columns of "spider.wine.grapes"
      spider-wines:grapes (grapes_s."ID")  a spider-wines:grapes ;
      spider-wines:id grapes_s."ID" as spider-wines:wine-grapes-id ;
      spider-wines:grape grapes_s."Grape" as spider-wines:wine-grapes-grape ;
      spider-wines:color grapes_s."Color" as spider-wines:wine-grapes-color .

    }
 }

;

SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
prefix spider-wines-stat: <http://demo.openlinksw.com/spider-wines/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "spider"."wine"."wine" as wine_s
 { 
   create spider-wines:qm-wine as graph iri ("http://^{URIQADefaultHost}^/spider-wines#")  
    { 
      # Maps from columns of "spider.wine.wine"
      spider-wines:wine (wine_s."No")  a spider-wines:wine ;
      spider-wines:no wine_s."No" as spider-wines:wine-wine-no ;
      spider-wines:grape wine_s."Grape" as spider-wines:wine-wine-grape ;
      spider-wines:winery wine_s."Winery" as spider-wines:wine-wine-winery ;
      spider-wines:appelation wine_s."Appelation" as spider-wines:wine-wine-appelation ;
      spider-wines:state wine_s."State" as spider-wines:wine-wine-state ;
      spider-wines:name wine_s."Name" as spider-wines:wine-wine-name ;
      spider-wines:year wine_s."Year" as spider-wines:wine-wine-year ;
      spider-wines:price wine_s."Price" as spider-wines:wine-wine-price ;
      spider-wines:score wine_s."Score" as spider-wines:wine-wine-score ;
      spider-wines:cases wine_s."Cases" as spider-wines:wine-wine-cases ;
      spider-wines:drink wine_s."Drink" as spider-wines:wine-wine-drink .

    }
 }

;

SPARQL
prefix spider-wines: <http://demo.openlinksw.com/schemas/spider-wines/> 
prefix spider-wines-stat: <http://demo.openlinksw.com/spider-wines/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "spider"."wine"."appellationsCount" as appellationscount_s
 from "spider"."wine"."grapesCount" as grapescount_s
 from "spider"."wine"."wineCount" as winecount_s
 from "spider"."wine"."spider-wines__Total" as spider_wines__total_s
 { 
   create spider-wines:qm-VoidStatistics as graph iri ("http://^{URIQADefaultHost}^/spider-wines#") option (exclusive) 
    { 
      # voID Statistics 
      spider-wines-stat: a void:Dataset as spider-wines:dataset-spider ; 
       void:sparqlEndpoint <http://demo.openlinksw.com/sparql> as spider-wines:dataset-sparql-spider ; 
      void:statItem spider-wines-stat:Stat . 
      spider-wines-stat:Stat a scovo:Item ; 
       rdf:value spider_wines__total_s.cnt as spider-wines:stat-decl-spider ; 
       scovo:dimension void:numOfTriples . 

      spider-wines-stat: void:statItem spider-wines-stat:appellationsStat as spider-wines:statitem-spider-appellations . 
      spider-wines-stat:appellationsStat a scovo:Item as spider-wines:statitem-decl-spider-appellations ; 
      rdf:value appellationscount_s.cnt as spider-wines:statitem-cnt-spider-appellations ; 
      scovo:dimension void:numberOfResources as spider-wines:statitem-type-1-spider-appellations ; 
      scovo:dimension spider-wines:appellations as spider-wines:statitem-type-2-spider-appellations .

      spider-wines-stat: void:statItem spider-wines-stat:grapesStat as spider-wines:statitem-spider-grapes . 
      spider-wines-stat:grapesStat a scovo:Item as spider-wines:statitem-decl-spider-grapes ; 
      rdf:value grapescount_s.cnt as spider-wines:statitem-cnt-spider-grapes ; 
      scovo:dimension void:numberOfResources as spider-wines:statitem-type-1-spider-grapes ; 
      scovo:dimension spider-wines:grapes as spider-wines:statitem-type-2-spider-grapes .

      spider-wines-stat: void:statItem spider-wines-stat:wineStat as spider-wines:statitem-spider-wine . 
      spider-wines-stat:wineStat a scovo:Item as spider-wines:statitem-decl-spider-wine ; 
      rdf:value winecount_s.cnt as spider-wines:statitem-cnt-spider-wine ; 
      scovo:dimension void:numberOfResources as spider-wines:statitem-type-1-spider-wine ; 
      scovo:dimension spider-wines:wine as spider-wines:statitem-type-2-spider-wine .

    }
 }
;



-- Virtual directories for instance data
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/spider-wines%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_rule4',
1,
'/spider-wines/stat([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/spider-wines/stat%%23%%3E+%%3Fo+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/spider-wines%%23%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^/spider-wines/stat%%23%%3E+%%3Fp+%%3Fo+}&format=%U',
vector('*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_rule6',
1,
'/spider-wines/objects/([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/spider-wines/objects/%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/spider-wines%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_rule1',
1,
'([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^%U%%23this&graph=http%%3A//^{URIQADefaultHost}^/spider-wines%%23&distinct=0',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_rule7',
1,
'/spider-wines/stat([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^/spider-wines/stat%%23&graph=http%%3A//^{URIQADefaultHost}^/spider-wines%%23',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_rule5',
1,
'/spider-wines/objects/(.*)',
vector('path'),
1,
'/services/rdf/object.binary?path=%%2Fspider-wines%%2Fobjects%%2F%U&accept=%U',
vector('path', '*accept*'),
null,
null,
2,
null
);
DB.DBA.URLREWRITE_CREATE_RULELIST ( 'spider-wines_rule_list1', 1, vector ( 'spider-wines_rule1', 'spider-wines_rule7', 'spider-wines_rule5', 'spider-wines_rule2', 'spider-wines_rule4', 'spider-wines_rule6'));
DB.DBA.VHOST_REMOVE (lpath=>'/spider-wines');
DB.DBA.VHOST_DEFINE (lpath=>'/spider-wines', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'spider-wines_rule_list1')
);

-- Virtual directories for ontology
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_owl_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/schemas/spider-wines%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'spider-wines_owl_rule1',
1,
'([^#]*)',
vector('path'),
1,
'/describe/?url=http://^{URIQADefaultHost}^%U',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_RULELIST ( 'spider-wines_owl_rule_list1', 1, vector ( 'spider-wines_owl_rule1', 'spider-wines_owl_rule2'));
DB.DBA.VHOST_REMOVE (lpath=>'/schemas/spider-wines');
DB.DBA.VHOST_DEFINE (lpath=>'/schemas/spider-wines', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'spider-wines_owl_rule_list1')
);
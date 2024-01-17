CREATE TABLE spider.wine.grapes ( 
	"ID" INTEGER PRIMARY KEY, 
	"Grape" VARCHAR UNIQUE, 
	"Color" VARCHAR 
);

CREATE TABLE spider.wine.appellations ( 
	"No" INTEGER PRIMARY KEY, 
	"Appelation" VARCHAR UNIQUE, 
	"County" VARCHAR, 
	"State" VARCHAR, 
	"Area" VARCHAR, 
	"isAVA" VARCHAR
);

CREATE TABLE spider.wine.wine ( 
	"No" INTEGER, 
	"Grape" VARCHAR, 
	"Winery" VARCHAR, 
	"Appelation" VARCHAR, 
	"State" VARCHAR, 
	"Name" VARCHAR, 
	"Year" INTEGER, 
	"Price" INTEGER, 
	"Score" INTEGER, 
	"Cases" INTEGER, 
	"Drink" VARCHAR,
	FOREIGN KEY (Grape) REFERENCES spider.wine.grapes(Grape),
	FOREIGN KEY (Appelation) REFERENCES spider.wine.appellations(Appelation)
);

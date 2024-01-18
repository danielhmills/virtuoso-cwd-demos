CREATE TABLE spider.inn.rooms ( 
	"RoomId" VARCHAR PRIMARY KEY,
	"roomName" VARCHAR, 
	"beds" INTEGER, 
	"bedType" VARCHAR, 
	"maxOccupancy" INTEGER, 
	"basePrice" INTEGER, 
	"decor" VARCHAR

);

CREATE TABLE spider.inn.reservations ( 
	"Code" INTEGER PRIMARY KEY, 
	"Room" VARCHAR, 
	"CheckIn" VARCHAR, 
	"CheckOut" VARCHAR, 
	"Rate" REAL, 
	"LastName" VARCHAR, 
	"FirstName" VARCHAR, 
	"Adults" INTEGER, 
	"Kids" INTEGER,
	FOREIGN KEY (Room) REFERENCES spider.inn.rooms(RoomId)
);


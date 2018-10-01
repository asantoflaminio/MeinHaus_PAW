CREATE TABLE IF NOT EXISTS users (
	userid 			INTEGER IDENTITY PRIMARY KEY,
	firstName 		varchar(30) NOT NULL,
	lastName 		varchar(30) NOT NULL,
	email 			varchar(30) UNIQUE NOT NULL,
	password		varchar(30) NOT NULL,
	phoneNumber		varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS publications (
	publicationid 	INTEGER IDENTITY PRIMARY KEY,
	title 			varchar(30) NOT NULL,
	address 		varchar(30) NOT NULL,
	neighborhood		varchar(30) NOT NULL,
	city			varchar(30) NOT NULL,
	province		varchar(30) NOT NULL,
	operation 		varchar(30) NOT NULL,
	price 			integer NOT NULL,
	description 	varchar(60) NOT NULL,
	propertyType 	varchar(30) NOT NULL,
	bedrooms 		integer NOT NULL,
	bathrooms 		integer NOT NULL,
	floorSize 		integer NOT NULL,
	parking 		integer NOT NULL,
	userid 			integer REFERENCES users(userid)
);


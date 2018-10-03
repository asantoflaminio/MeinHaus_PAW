CREATE TABLE IF NOT EXISTS users (
	userid 			SERIAL PRIMARY KEY,
	firstName 		varchar(30) NOT NULL,
	lastName 		varchar(30) NOT NULL,
	email 			varchar(250) UNIQUE NOT NULL,
	password		varchar(70) NOT NULL,
	phoneNumber		varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS publications (
	publicationid 	SERIAL PRIMARY KEY,
	title 			varchar(50) NOT NULL,
	address 		varchar(140) NOT NULL,
	neighborhood	varchar(30) NOT NULL,
	city			varchar(30) NOT NULL,
	province		varchar(30) NOT NULL,
	operation 		varchar(30) NOT NULL,
	price 			integer NOT NULL,
	description 	varchar(2500) NOT NULL,
	propertyType 	varchar(30) NOT NULL,
	bedrooms 		integer NOT NULL,
	bathrooms 		integer NOT NULL,
	floorSize 		integer NOT NULL,
	parking 		integer NOT NULL,
	userid 			integer REFERENCES users(userid)
);

CREATE TABLE IF NOT EXISTS images (
   upload_id integer NOT NULL,
   publicationid varchar(30) NOT NULL,
   file_data bytea,
   PRIMARY KEY (upload_id)
);


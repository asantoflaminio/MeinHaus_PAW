CREATE TABLE IF NOT EXISTS users (
	userid 		SERIAL PRIMARY KEY,
	firstName 	varchar(30) NOT NULL,
	lastName 	varchar(30) NOT NULL,
	email 		varchar(30) UNIQUE NOT NULL,
	password	varchar(30) NOT NULL,
	phoneNumber	varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS publications (
	publicationid 	SERIAL PRIMARY KEY,
	title 			varchar(30) NOT NULL,
	address 		varchar(30) UNIQUE NOT NULL,
	operation 		varchar(30) NOT NULL,
	price 			varchar(30) NOT NULL,
	description 	varchar(60) NOT NULL,
	propertyType 	varchar(30) NOT NULL,
	bedrooms 		varchar(3) NOT NULL,
	bathrooms 		varchar(3) NOT NULL,
	flooSize 		varchar(3) NOT NULL,
	parking 		varchar(3) NOT NULL
);



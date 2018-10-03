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

INSERT INTO users(userid, firstName, lastName, email, password, phoneNumber) 
	VALUES (1, 'TestFirstName', 'TestLastName', 'test1@mail.com', 'TestPassword', '1522334455');


INSERT INTO publications(publicationid, title, address, neighborhood, city, province, operation, price, description, 
	propertyType, bedrooms, bathrooms, floorSize, parking, userid)
VALUES (1, 'TestTitle', 'TestAddress', 'TestNeighborhood', 'TestCity', 'TestProvince', 'TestOperation', 4242412, 'TestDescription',
	'TestPropertyType', 3, 1, 50, 1, 1)

INSERT INTO publications(publicationid, title, address, neighborhood, city, province, operation, price, description, 
	propertyType, bedrooms, bathrooms, floorSize, parking, userid)
VALUES (2, 'TestTitle', 'TestAddress1', 'TestNeighborhood', 'TestCity', 'TestProvince', 'TestOperation', 4350000, 'TestDescription',
	'TestType', 2, 1, 50, 1, 1)

INSERT INTO publications(publicationid, title, address, neighborhood, city, province, operation, price, description, 
	propertyType, bedrooms, bathrooms, floorSize, parking, userid)
VALUES (3, 'TestTitle', 'TestAddress2', 'TestNeighborhood', 'TestCity' ,'TestProvince', 'TestOperation', 4350000, 'TestDescription',
	'TestType', 5, 1, 50, 1, 1)
	
INSERT INTO publications(publicationid, title, address, neighborhood, city, province, operation, price, description, 
	propertyType, bedrooms, bathrooms, floorSize, parking, userid)
VALUES (4,'TestTitle','TestAddress2', 'TestNeighborhood', 'TestCity' ,'TestProvince' , 'TestOperation', 430210,'TestDescription',
	'TestType', 2, 1, 50, 1, 1)
	
INSERT INTO publications(publicationid, title, address, neighborhood, city, province, operation, price, description, 
	propertyType, bedrooms, bathrooms, floorSize, parking, userid)
VALUES (5,'TestTitle','TestAddress2', 'TestNeighborhood', 'TestCity' ,'TestProvince' , 'TestOperation', 4350000,'TestDescription',
	'TestType', 5, 1, 50, 1, 1)

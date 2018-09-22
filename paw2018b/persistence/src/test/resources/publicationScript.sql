CREATE TABLE IF NOT EXISTS publications (
	publicationid   INTEGER IDENTITY PRIMARY KEY,
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

insert into publications(publicationid, title, address, operation, price, description, propertyType, bedrooms, bathrooms, flooSize, parking)
values (1,'TitleTest','AddressTest','OperationTest','350','DescriptionTest','TypeTest','3','3','432','3')
CREATE TABLE IF NOT EXISTS publications (
	publicationid   INTEGER IDENTITY PRIMARY KEY,
	title 			varchar(40) NOT NULL,
	address 		varchar(30) UNIQUE NOT NULL,
	operation 		varchar(20) NOT NULL,
	price 			varchar(15) NOT NULL,
	description 	varchar(500) NOT NULL,
	propertyType 	varchar(20) NOT NULL,
	bedrooms 		varchar(2) NOT NULL,
	bathrooms 		varchar(2) NOT NULL,
	floorSize 		varchar(4) NOT NULL,
	parking 		varchar(10) NOT NULL
);

insert into publications(publicationid, title, address, operation, price, description, 
	propertyType, bedrooms, bathrooms, floorSize, parking)
values (1,'TitleTest','AddressTest','OperationTest','4350000','DescriptionTest',
	'TypeTest','2','1','50','1')
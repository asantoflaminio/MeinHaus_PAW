CREATE TABLE IF NOT EXISTS users (
	userid 			INTEGER IDENTITY PRIMARY KEY,
	firstName 		varchar(30) NOT NULL,
	lastName 		varchar(30) NOT NULL,
	email 			varchar(250) UNIQUE NOT NULL,
	password		varchar(70) NOT NULL,
	phoneNumber		varchar(30) NOT NULL
);

INSERT INTO users(userid, firstName, lastName, email, password, phoneNumber) 
	VALUES (1, 'TestFirstName', 'TestLastName', 'test1@mail.com', 'TestPassword', '1522334455');


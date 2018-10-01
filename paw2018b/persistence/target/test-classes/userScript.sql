CREATE TABLE IF NOT EXISTS users (
	userid 			INTEGER IDENTITY PRIMARY KEY,
	firstName 		varchar(30) NOT NULL,
	lastName 		varchar(30) NOT NULL,
	email 			varchar(30) UNIQUE NOT NULL,
	password		varchar(30) NOT NULL,
	phoneNumber		varchar(30) NOT NULL
);

INSERT INTO users(userid, firstName, lastName, email, password, phoneNumber)
VALUES (1, 'TestFirstName', 'TestLastName', 'test1@mail.com', 'TestPassword', '1522334455');
INSERT INTO users(userid, firstName, lastName, email, password, phoneNumber)
VALUES (2, 'TestFirstName1', 'TestLastName1', 'test2@mail.com', 'TestPassword1', '1522334455');

/* INSERT INTO users(userid, firstName, lastName, email, password, phoneNumber)
VALUES (1, 'TestFirstName', 'TestLastName', 'test@mail.com', 'TestPassword', '1522334455'); */
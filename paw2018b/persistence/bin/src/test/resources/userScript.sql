CREATE TABLE IF NOT EXISTS users (
	userid 			INTEGER IDENTITY PRIMARY KEY,
	firstName 		varchar(30) NOT NULL,
	lastName 		varchar(30) NOT NULL,
	email 			varchar(30) UNIQUE NOT NULL,
	password		varchar(30) NOT NULL,
	phoneNumber		varchar(30) NOT NULL
);

insert into users(userid, firstName, lastName, email, password, phoneNumber)
values (1, 'TestFirstName', 'TestLastName', 'test@mail.com', 'TestPassword', '1522334455')

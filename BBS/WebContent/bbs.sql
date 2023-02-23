USE bbs;
CREATE TABLE USER(
	userID VARCHAR(20) PRIMARY KEY,
    userPassword VARCHAR(20),
    userName VARCHAR(20),
	userGender VARCHAR(20),
    userEmail VARCHAR(50)
);

SELECT * FROM USER;
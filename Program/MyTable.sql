CREATE TABLE reg (
    userID smallint UNSIGNED NOT NULL ,
    userName varchar (20) NOT NULL ,
    userPassword varchar (20) NOT NULL
);

ALTER TABLE reg ADD INDEX(userID);

ALTER TABLE reg CHANGE userID userID smallint UNSIGNED NOT NULL AUTO_INCREMENT;

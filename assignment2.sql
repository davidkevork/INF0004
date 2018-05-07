Part 2
Wine_Tour ( T_ID, T_Name, T_Description, T_Current_Price );
PK: T_ID

Tour_Date ( TD_ID, T_ID, TD_Date, TD_Price );
PK: TD_ID
FK: T_ID References Wine_Tour

Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number );
PK: Expert_ID

Tour_Date_Experts ( TD_ID, Expert_ID );
FK: TD_ID References Tour_Date
FK: Expert_ID References  Wine_Experts

Customer ( Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone );
PK: Customer_ID

Brochure ( Request_ID, T_ID, Customer_ID, Request_Date );
PK: Request_ID
FK: T_ID References Wine_Tour
FK: Customer_ID References Customer

Gift ( Gift_ID, Gift_Name );
PK: Gift_ID

Tour_Date_Gift ( TD_ID, Gift_ID );
FK TD_ID References Tour_Date
FK Gift_ID References Gift

Customer_Gift ( Gift_ID, Tour_Date_ID, Customer_ID );
FK: Gift_ID References Gift
FK: TD_ID References Tour_Date
FK: Customer_ID References Customer

Customer_Booking ( Customer_ID, TD_ID );
FK: Customer_ID References Customer
FK: TD_ID References Tour_Date

Part 3


PROMPT *** DROP TABLES ***
DROP TABLE Customer_Booking;
DROP TABLE Tour_Date_Gift;
DROP TABLE Customer_Gift;
DROP TABLE Gift;
DROP TABLE Brochure;
DROP TABLE Customer;
DROP TABLE Tour_Date_Experts;
DROP TABLE Wine_Experts;
DROP TABLE Tour_Date;
DROP TABLE Wine_Tour;

PROMPT *** CREATE TABLE Wine_Tour ***
CREATE TABLE Wine_Tour (
	T_ID VARCHAR(2),
	T_Name VARCHAR2(25),
	T_Description VARCHAR2(255),
	T_Current_Price NUMBER,
	PRIMARY KEY (T_ID)
);

PROMPT *** CREATE TABLE Tour_Date ***
CREATE TABLE Tour_Date (
	TD_ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	T_ID VARCHAR(2),
	TD_Date DATE,
	TD_Price NUMBER,
	PRIMARY KEY(TD_ID),
	FOREIGN KEY (T_ID) REFERENCES Wine_Tour
);

PROMPT *** CREATE TABLE Wine_Experts ***
CREATE TABLE Wine_Experts (
	Expert_ID NUMBER,
	Expert_First_Name VARCHAR2(50),
	Expert_Last_Name VARCHAR2(50),
	Expert_Phone_Number NUMBER,
	PRIMARY KEY (Expert_ID)
);

PROMPT *** CREATE TABLE Tour_Date_Experts ***
CREATE TABLE Tour_Date_Experts (
	TD_ID NUMBER,
	Expert_ID NUMBER,
	FOREIGN KEY (TD_ID) REFERENCES Tour_Date,
	FOREIGN KEY (Expert_ID) REFERENCES Wine_Experts
);

PROMPT *** CREATE TABLE Customer ***
CREATE TABLE Customer (
	CUSTOMER_ID VARCHAR2(4),
	CUSTOMER_FIRST_NAME VARCHAR2(50),
	CUSTOMER_LAST_NAME VARCHAR2(50),
	CUSTOMER_ADDRESS VARCHAR2(50),
	CUSTOMER_PHONE NUMBER,
	PRIMARY KEY (CUSTOMER_ID)
);

PROMPT *** CREATE TABLE Brochure ***
CREATE TABLE Brochure (
	REQUEST_ID NUMBER,
	T_ID VARCHAR(2),
	CUSTOMER_ID VARCHAR2(4),
	REQUEST_DATE VARCHAR2(20),
	PRIMARY KEY(REQUEST_ID),
	FOREIGN KEY (T_ID) REFERENCES Wine_Tour,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer
);

PROMPT *** CREATE TABLE Gift ***
CREATE TABLE Gift (
	GIFT_ID NUMBER,
	GIFT_NAME VARCHAR2(50),
	PRIMARY KEY (GIFT_ID)
);

PROMT *** CREATE TABLE Tour_Date_Gift ***
CREATE TABLE Tour_Date_Gift (
	TD_ID NUMBER,
	GIFT_ID NUMBER,
	FOREIGN KEY (TD_ID) REFERENCES Tour_Date,
	FOREIGN KEY (GIFT_ID) REFERENCES Gift
);

PROMPT *** CREATE TABLE Customer_Gift ***
CREATE TABLE Customer_Gift (
	GIFT_ID NUMBER,
	TD_ID NUMBER,
	CUSTOMER_ID VARCHAR2(4),
FOREIGN KEY (GIFT_ID) REFERENCES Gift,
	FOREIGN KEY (TD_ID) REFERENCES Tour_Date,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer
);

PROMPT *** CREATE TABLE Customer_Booking ***
CREATE TABLE Customer_Booking (
	CUSTOMER_ID VARCHAR2(4),
	TD_ID NUMBER,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer,
	FOREIGN KEY (TD_ID) REFERENCES Tour_Date
);





PROMPT *** INSERT QUERIES ***

PROMPT *** WINE_TOUR ***
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('B1', 'Wine Appreciation', 'A great tour for visitors new to wine tasting. Our experts describe the process of wine tasting, purchasing wine and how to plan your wine cellar', 300);
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('R2', 'Red Wine Tour', 'Sample brilliant red wine varieties from this famous region wineries with one of our distinguished wine experts', 200);
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('W1', 'White Wine Tour', 'Taste the best white wines of the regions many world-renowned wineries under the guidance of one of our celebrated wine experts', 220);
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('S1', 'Sparkling Wine Tour', 'The region is famed for its interesting forms of sparkling wines. Our expert tour leader will ensure that this is an experience never to be forgotten', 250);

PROMPT *** TOUR_DATE ***
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (1, 'R2', DATE('2017/10/07'), 170);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (2, 'B1', DATE('2017/11/11'), 270);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (3, 'B1', DATE('2017/02/18'), 280);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (4, 'R2', DATE('2017/02/18'), 190);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (5, 'R2', DATE('2017/03/07'), 200);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (6, 'B1', DATE('2017/03/14'), 300);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (7, 'W1', DATE('2017/06/03'), 200);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (8, 'S1', DATE('2017/10/27'), 250);
INSERT INTO Tour_Date (TD_ID, T_ID, TD_Date, TD_Price) VALUES (9, 'W1', DATE('2017/10/29'), 220);

PROMPT *** WINE_EXPERTS ***
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (5, 'Sue', 'Davies', 92142222);
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (1, 'Geoff, 'Millar', 92141111);
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (8, 'Hillary', 'Cork', 92144444);
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (12, 'Penny', 'Folds', 92143333);

PROMPT *** TOUR_DATE_EXPERTS ***
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (1, 12);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (1, 1);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (2, 1);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (3, 8);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (3, 5);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (4, 12);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (5, 1);
INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES (6, 12);

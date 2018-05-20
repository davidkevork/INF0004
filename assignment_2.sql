
Wine_Tour ( T_ID, T_Name, T_Description, T_Current_Price );
PK: T_ID

Tour_Date ( T_ID, T_ID, TD_Date, TD_Price );
FK: T_ID References Wine_Tour

Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number );
PK: Expert_ID

Tour_Date_Experts ( TD_ID, Expert_ID );
FK: TD_ID References Tour_Date
FK: Expert_ID References  Wine_Experts

Customer ( Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone );
PK: Customer_ID

Brochure ( T_ID, Customer_ID, Request_Date );

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

Customer_Booking ( Customer_ID, T_ID, TD_Date );
FK: Customer_ID References Customer
FK: T_ID References WINE_TOUR
FK: TD_Date References TOUR_DATE

Customer_Payment (PAYMENT_ID, BOOKING_ID, CUSTOMER_ID, PAYMENT_TYPE)
PK : PAYMENT_ID Starts at 1 IDENTITY then INCREMENTS by 1.
FK : BOOKING_ID References Customer_Booking
FK : CUSTOMER_ID References Customer

Part 3


PROMPT *** DROP TABLES ***
DROP TABLE Customer_Payment;
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
/* GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) */
CREATE TABLE Tour_Date (
	T_ID VARCHAR(2),
	TD_Date DATE,
	TD_Price NUMBER,
	PRIMARY KEY (T_ID, TD_Date),
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
	T_ID VARCHAR2(2),
	TD_Date DATE,
	Expert_ID NUMBER,
	FOREIGN KEY (T_ID, TD_Date) REFERENCES TOUR_DATE,
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
	T_ID VARCHAR(2),
	CUSTOMER_ID VARCHAR2(4),
	REQUEST_DATE VARCHAR2(20),
	FOREIGN KEY (T_ID) REFERENCES Wine_Tour,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer
);

PROMPT *** CREATE TABLE Gift ***
CREATE TABLE Gift (
	GIFT_ID VARCHAR2(4),
	GIFT_NAME VARCHAR2(50),
	PRIMARY KEY (GIFT_ID)
);

PROMPT *** CREATE TABLE Tour_Date_Gift ***
CREATE TABLE Tour_Date_Gift (
	T_ID VARCHAR2(2),
	TD_Date DATE,
	GIFT_ID VARCHAR2(4),
	FOREIGN KEY (T_ID, TD_Date) REFERENCES TOUR_DATE,
	FOREIGN KEY (GIFT_ID) REFERENCES Gift
);

PROMPT *** CREATE TABLE Customer_Gift ***
CREATE TABLE Customer_Gift (
	GIFT_ID VARCHAR2(4),
	T_ID VARCHAR2(2),
	TD_Date DATE,
	CUSTOMER_ID VARCHAR2(4),
	FOREIGN KEY (GIFT_ID) REFERENCES Gift,
	FOREIGN KEY (T_ID, TD_Date) REFERENCES TOUR_DATE,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer
);

PROMPT *** CREATE TABLE Customer_Booking ***
CREATE TABLE Customer_Booking (
	BOOKING_ID NUMBER,
	CUSTOMER_ID VARCHAR2(4),
	T_ID VARCHAR(2),
	TD_Date DATE,
	PRIMARY KEY (BOOKING_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer,
	FOREIGN KEY (T_ID, TD_Date) REFERENCES Tour_Date
);

PROMPT *** CREATE TABLE Customer_Payment
CREATE TABLE Customer_Payment (
	PAYMENT_ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	BOOKING_ID NUMBER,
	PAYMENT_AMOUNT NUMBER,
	CUSTOMER_ID  VARCHAR2(4),
	PAYMENT_TYPE VARCHAR2(6),
	PRIMARY KEY (PAYMENT_ID),
	FOREIGN KEY (BOOKING_ID) REFERENCES Customer_Booking,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer
);

PROMPT *** INSERT QUERIES ***

PROMPT *** WINE_TOUR ***
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('B1', 'Wine Appreciation', 'A great tour for visitors new to wine tasting. Our experts describe the process of wine tasting, purchasing wine and how to plan your wine cellar', 300);
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('R2', 'Red Wine Tour', 'Sample brilliant red wine varieties from this famous region wineries with one of our distinguished wine experts', 200);
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('W1', 'White Wine Tour', 'Taste the best white wines of the regions many world-renowned wineries under the guidance of one of our celebrated wine experts', 220);
INSERT INTO Wine_Tour (T_ID, T_Name, T_Description, T_Current_Price) VALUES ('S1', 'Sparkling Wine Tour', 'The region is famed for its interesting forms of sparkling wines. Our expert tour leader will ensure that this is an experience never to be forgotten', 250);

PROMPT *** TOUR_DATE ***
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 170);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('B1', TO_DATE('2017/11/11', 'yyyy/mm/dd'), 270);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('B1', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 280);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('R2', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 190);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('R2', TO_DATE('2018/03/07', 'yyyy/mm/dd'), 200);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('B1', TO_DATE('2018/03/14', 'yyyy/mm/dd'), 300);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('W1', TO_DATE('2018/06/03', 'yyyy/mm/dd'), 200);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('S1', TO_DATE('2018/10/27', 'yyyy/mm/dd'), 250);
INSERT INTO Tour_Date (T_ID, TD_Date, TD_Price) VALUES ('W1', TO_DATE('2018/10/29', 'yyyy/mm/dd'), 220);

PROMPT *** WINE_EXPERTS ***
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (5, 'Sue', 'Davies', 92142222);
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (1, 'Geoff', 'Millar', 92141111);
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (8, 'Hillary', 'Cork', 92144444);
INSERT INTO Wine_Experts (Expert_ID, Expert_First_Name, Expert_Last_Name, Expert_Phone_Number) VALUES (12, 'Penny', 'Folds', 92143333);


PROMPT *** TOUR_DATE_EXPERTS ***
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 12);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 1);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('B1', TO_DATE('2017/11/11', 'yyyy/mm/dd'), 1);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('B1', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 8);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('B1', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 5);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('R2', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 12);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('R2', TO_DATE('2018/03/07', 'yyyy/mm/dd'), 1);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('B1', TO_DATE('2018/03/14', 'yyyy/mm/dd'), 1);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('B1', TO_DATE('2018/03/14', 'yyyy/mm/dd'), 8);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('W1', TO_DATE('2018/06/03', 'yyyy/mm/dd'), 5);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('S1', TO_DATE('2018/10/27', 'yyyy/mm/dd'), 5);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('W1', TO_DATE('2018/10/29', 'yyyy/mm/dd'), 8);
INSERT INTO Tour_Date_Experts (T_ID, TD_DATE, Expert_ID) VALUES ('W1', TO_DATE('2018/10/29', 'yyyy/mm/dd'), 12);

PROMPT *** Customer ***
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C123', 'Joel', 'Warren', '7 Bluff Rd', 92142277);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C218', 'Sue', 'Armstrong', '1 High St', 92149911);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C178', 'Grant', 'Simpson', '23 Wall St', 92133311);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C191', 'Sarah', 'Charter', '19 Hill Ave', 92134477);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C334', 'Helen', 'Chin', '6 Red Rd', 92145500);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C367', 'Ryan', 'Chin', '6 Red Rd', 92145522);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C555', 'Ted', 'Smith', '7 John St', 92148000);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C078', 'Clare', 'Watts', '15 Dale Rd', 92141166);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C267', 'Karen', 'Black', '1 Black St', 92148822);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C225', 'Ziggy', 'Lee', '17 Low St', 92149944);
INSERT INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Address, Customer_Phone) VALUES ('C215', 'Henry', 'Ryde', '8 White St', 92146688);

PROMPT *** Brochure ***
INSERT INTO Brochure (T_ID, Customer_ID, Request_Date) VALUES ('W1', 'C267', TO_DATE('2017/06/19', 'yyyy/mm/dd'));
INSERT INTO Brochure (T_ID, Customer_ID, Request_Date) VALUES ('B1', 'C215', TO_DATE('2017/08/19', 'yyyy/mm/dd'));
INSERT INTO Brochure (T_ID, Customer_ID, Request_Date) VALUES ('W1', 'C225', TO_DATE('2017/09/15', 'yyyy/mm/dd'));
INSERT INTO Brochure (T_ID, Customer_ID, Request_Date) VALUES ('W1', 'C218', TO_DATE('2017/01/05', 'yyyy/mm/dd'));
INSERT INTO Brochure (T_ID, Customer_ID, Request_Date) VALUES ('W1', 'C334', TO_DATE('2017/01/06', 'yyyy/mm/dd'));

PROMPT *** Gift ***
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G01', 'Collectors Red Wine Glass');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G02', 'Cord Screw');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G03', 'Sherry Glass');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G04', 'White Wine Glass');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G05', 'Guide to Wine Tasting Handbook');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G06', 'Winery Guide Handbook');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G07', 'Wine for Women Handbook');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G08', 'Wine Museum Voucher');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G09', 'Collectors Sparkling Wine Glass');
INSERT INTO Gift (Gift_ID, Gift_Name) VALUES ('G10', 'Commemorative Cup');

PROMPT *** Tour_Date_Gift ***
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('B1', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 'G01');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('B1', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 'G05');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('B1', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 'G07');

INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 'G01');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 'G07');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2018/02/18', 'yyyy/mm/dd'), 'G09');

INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2018/03/07', 'yyyy/mm/dd'), 'G02');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2018/03/07', 'yyyy/mm/dd'), 'G06');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2018/03/07', 'yyyy/mm/dd'), 'G08');

INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('W1', TO_DATE('2018/06/03', 'yyyy/mm/dd'), 'G01');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('W1', TO_DATE('2018/06/03', 'yyyy/mm/dd'), 'G04');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('W1', TO_DATE('2018/06/03', 'yyyy/mm/dd'), 'G06');

INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('B1', TO_DATE('2017/11/11', 'yyyy/mm/dd'), 'G05');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('B1', TO_DATE('2017/11/11', 'yyyy/mm/dd'), 'G06');

INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 'G01');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 'G02');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 'G03');
INSERT INTO Tour_Date_Gift (T_ID, TD_DATE, Gift_ID) VALUES ('R2', TO_DATE('2017/10/07', 'yyyy/mm/dd'), 'G04');

PROMPT *** Customer_Gift ***
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');
INSERT INTO Customer_Gift (GIFT_ID, T_ID, TD_Date, CUSTOMER_ID) VALUES ('', '', TO_DATE('', 'yyyy/mm/dd'), '');

PROMPT *** Part 4 Invalid insert statements A test of Validation Rules ***

INSERT INTO Tour_Date_Experts (TD_ID, Expert_ID) VALUES ('B1', 22);
INSERT INTO Customer_Booking (CUSTOMER_ID, TD_ID) VALUES ('C078','W1');
INSERT INTO Customer_Payment (BOOKING_ID, CUSTOMER_ID, PAYMENT_TYPE) VALUES ('W1', 'C225', '');
INSERT INTO

PROMPT *** Part 5 ***

SELECT * FROM Customer ORDER BY Customer_ID;

SELECT Tour_Date_Experts.T_ID, Tour_Date_Experts.TD_Date, Experts.Expert_First_Name, Experts.Expert_Last_Name FROM Tour_Date_Experts INNER JOIN Experts ON Tour_Date_Experts.Expert_ID = Experts.Expert_ID;

SELECT Customer_Booking.T_ID, Customer_Booking.TD_Date, Customer_Booking.Customer_ID, Customer.First_Name, Customer.Last_Name Customer FROM Customer_Booking INNER JOIN Customer ON Customer_Booking.Customer_ID = Customer.Customer_ID;

SELECT Tour_Date_Gift.T_ID, Tour_Date_Gift.TD_Date, Tour_Date_Gift.Gift_ID, Gift.Gift_Name FROM Tour_Date_Gift INNER JOIN Gift ON Tour_Date_Gift.Gift_ID = Gift.Gift_ID;

SELECT Customer_Gift.T_ID, Customer_Gift.TD_Date, Customer_Gift.Customer_ID, Customer.Customer_First_Name, Customer.Customer_Last_Name, Customer_Gift.Gift_ID, Gift.Gift_Name FROM Customer_Gift INNER JOIN Customer ON Customer_Gift.Customer_ID = Customer.Customer_ID INNER JOIN Gift ON Customer_Gift.Gift_ID = Gift.Gift_ID;

PROMPT *** Part 6 ***

SELECT Customer_Payment.Customer_ID, Customer.Customer_First_Name, Customer.Customer_Last_Name, SUM(Payment_Amount) AS Total FROM Customer_Payment INNER JOIN Customer ON Customer_Payment.Customer_ID = Customer.Customer_ID ORDER BY Customer_Payment.Customer_ID;

SELECT Customer_Booking.T_ID, SUM(Customer_Payment.Payment_Amount) AS Total FROM Customer_Payment INNER JOIN Customer_Booking ON Customer_Payment.Booking_ID = Customer_Booking.Booking_ID ORDER BY Customer_Booking.T_ID;

SELECT Customer_Gift.Gift_ID, Gift.Gift_Name, COUNT(*) FROM Customer_Gift INNER JOIN Gift ON Customer_Gift.Gift_ID = Gift.Gift_ID ORDER BY COUNT(*) DESC;

SELECT Tour_Date.T_ID, Wine_Tour.T_Description, Tour_Date.TD_Price AS Current_Price, MIN(Tour_Date.TD_Price) AS Minimum_Price FROM Tour_Date INNER JOIN Wine_Tour ON Wine_Tour.T_ID = Tour_Date.T_ID;

SELECT Brochure.Customer_ID, Customer.Customer_First_Name, Customer.Customer_Last_Name, Brochure.T_ID, Tour_Date.TD_Date FROM Brochure INNER JOIN Customer ON Customer.Customer_ID = Brochure.Customer_ID INNER JOIN Tour_Date ON Tour_Date.T_ID = Brochure.T_ID;

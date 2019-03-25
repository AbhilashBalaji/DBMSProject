drop database RMS;
CREATE database RMS;
\c RMS;
drop table cashier;
drop table restaurant;
drop table inventory;
drop table chef;
drop table managers;
drop table customer;
drop table bill;
drop table waiter;
drop table item;
drop table contains;
drop table resorder;
drop table prepares;
drop table takenby;

CREATE TABLE 	CHEF
(
	ID_number CHAR(9) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Contact_Number CHAR(10) NOT NULL,
	Age INT NOT NULL ,
	Gender CHAR(1) NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Salary INT NOT NULL ,
	Num_days_off INT NOT NULL,
	Working_time VARCHAR(12),
	PRIMARY KEY (ID_number),
	UNIQUE (Contact_Number)
);

CREATE TABLE 	MANAGERS
(
	ID_number CHAR(9) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Contact_Number CHAR(10) NOT NULL,
	Age INT NOT NULL,
	Gender CHAR(1) NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Salary INT NOT NULL,
	Num_days_off INT NOT NULL,
	Working_time VARCHAR(12),
	Chef_ID_number CHAR(9) NOT NULL,
	PRIMARY KEY (ID_number),
	UNIQUE (Contact_Number),
	FOREIGN KEY (Chef_ID_number) REFERENCES CHEF(ID_number)
);

CREATE TABLE 	INVENTORY
(
	Item_code VARCHAR(5) NOT NULL,
	Item VARCHAR(30) NOT NULL,
	Quantity INT NOT NULL,
	ID_number CHAR(9) NOT NULL,
	PRIMARY KEY (Item_code),
	UNIQUE(Item), 
	FOREIGN KEY (ID_number) REFERENCES CHEF(ID_number)
);

CREATE TABLE 	RESORDER
(
	Order_num INT NOT NULL,
	No_of_items VARCHAR(3) NOT NULL,
	PRIMARY KEY (Order_num)
);

CREATE TABLE 	ITEM
(
	Item_Number INT NOT NULL,
	Description VARCHAR(40) NOT NULL,
	Quantity INT NOT NULL,
	Price INT NOT NULL,
	PRIMARY KEY (Item_Number)
);

CREATE TABLE 	CONTAINS
(
	Order_num INT NOT NULL,
	Item_Number INT NOT NULL,
	PRIMARY KEY (Item_Number,Order_num),
	FOREIGN KEY (Order_num) REFERENCES RESORDER(Order_num),
	FOREIGN KEY (Item_Number) REFERENCES ITEM(Item_Number)
);

CREATE TABLE 	PREPARES
(
	Order_num INT NOT NULL,
	ID_number CHAR(9) NOT NULL,
	PRIMARY KEY (ID_number,Order_num),
	FOREIGN KEY (Order_num) REFERENCES RESORDER(Order_num),
	FOREIGN KEY (ID_number) REFERENCES CHEF(ID_number)
);

CREATE TABLE 	WAITER
(
	ID_number CHAR(9) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Contact_Number CHAR(10) NOT NULL,
	Age INT NOT NULL ,
	Gender CHAR(1) NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Salary INT NOT NULL,
	Num_days_off INT NOT NULL,
	Working_time VARCHAR(12),
	Chef_ID_number CHAR(9) NOT NULL,
	PRIMARY KEY (ID_number),
	UNIQUE (Contact_Number)
);

CREATE TABLE 	TAKENBY
(
	Order_num INT NOT NULL,
	ID_number CHAR(9) NOT NULL,
	PRIMARY KEY (ID_number,Order_num),
	FOREIGN KEY (Order_num) REFERENCES RESORDER(Order_num),
	FOREIGN KEY (ID_number) REFERENCES WAITER(ID_number)
);

CREATE TABLE 	CUSTOMER
(
	Cust_ID VARCHAR(10) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Contact_Number CHAR(10) NOT NULL,
	ID_number CHAR(9) NOT NULL,
	Order_num INT NOT NULL,
	PRIMARY KEY (Cust_ID),
	UNIQUE (Contact_Number),
	FOREIGN KEY (Order_num) REFERENCES RESORDER(Order_num),
	FOREIGN KEY (ID_number) REFERENCES WAITER(ID_number)
);

CREATE TABLE BILL
(
	Bill_No INT NOT NULL,
	Total_Amount INT NOT NULL,
	Tax INT NOT NULL,
	Order_details VARCHAR(100) NOT NULL,
	Cust_ID VARCHAR(10) NOT NULL,
	PRIMARY KEY (Bill_No),
	FOREIGN KEY (Cust_ID) REFERENCES CUSTOMER(Cust_ID)
);

CREATE TABLE 	CASHIER
(
	ID_number CHAR(9) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Contact_Number CHAR(10) NOT NULL,
	Age INT NOT NULL,
	Gender CHAR(1) NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Salary INT NOT NULL,
	Num_days_off INT NOT NULL,
	Working_time VARCHAR(12),
	Bill_No INT NOT NULL,
	PRIMARY KEY (ID_number),
	UNIQUE (Contact_Number),
	FOREIGN KEY (Bill_No) REFERENCES BILL(Bill_No)
);

CREATE TABLE 	RESTAURANT
(
	Name VARCHAR(40) NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Cuisine VARCHAR(20),
	ID_number CHAR(9) NOT NULL,
	Item_code VARCHAR(5) NOT NULL,
	PRIMARY KEY (Name),
	UNIQUE (Address),
	FOREIGN KEY (ID_number) REFERENCES CASHIER(ID_number),
	FOREIGN KEY (Item_code) REFERENCES INVENTORY(Item_code)
);


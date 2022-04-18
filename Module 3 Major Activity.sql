create table Customers(
CustomerID INT,
FirstName VARCHAR(25),
LastName VARCHAR(25),
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(25),
ZipCode INT,
Telephone VARCHAR(15),
PRIMARY KEY (CustomerID)
);

create table Orders(
OrderID int,
CustomerID INT,
SKU VARCHAR(20),
Description VARCHAR(50),
PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE table RMA (
RMAID int,
OrderID int,
Step VARCHAR(50),
Status VARCHAR(15),
Reason VARCHAR(15),
PRIMARY KEY (RMAID),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
); 

INSERT INTO Customers (CustomerID, FirstName, LastName, Street, City, State, ZipCode, Telephone)
VALUES (1111, 'Bob', 'Smith', 'Main St.', 'Houston', 'TX', 770098, 2106797543),
(1112, 'Dean', 'Jones', 'H St.', 'San Antonio', 'TX', 77097, 2106973291),
(1113, 'Greg', 'Campbell', 'A St.', 'Pittsburgh', 'TX', 77059, 9653210588),
(1114, 'Tom', 'Skerrit', 'Cherry Blossom', 'Denver', 'MO', 41236, 5963214444),
(1115, 'Dean', 'Hobbs', '16th Ave.', 'Houston', 'TX', 77098, 8563254521),
(1116, 'Mike', 'Mixer', 'Street St.', 'Poppy', 'TX', 74326, 8536984521),
(1117, 'Phyllis', 'Planter', 'Avenue St.', 'Austin', 'TX', 74230, 8529631478),
(1118, 'Carol', 'Hobbs', 'Summer Breeze', 'San Antonio', 'TX', 96325, 1239854523),
(1119, 'Ed', 'Helms', 'Summer Breeze', 'San Antonio', 'TX', 96325, 1234567896),
(1120, 'Eddie', 'Crane', 'K BLVD', 'Galveston', 'TX', 78965, 2136943201)
;

CREATE VIEW Collaborators AS
SELECT 
CustomerID AS CollaboratorID,
FirstName,
LastName,
Street,
City,
State,
ZipCode,
Telephone
FROM Customers;
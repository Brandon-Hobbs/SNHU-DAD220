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
PRIMARY KEY (OrderID)
);

CREATE table RMA (
RMAID int,
OrderID int,
Step VARCHAR(50),
Status VARCHAR(15),
Reason VARCHAR(15),
PRIMARY KEY (RMAID)
); 

Alter Table Customers
CHANGE CustomerID CollaboratorID INT;

Alter Table Orders
CHANGE CustomerID CollaboratorID INT;

insert into Customers
Values (100004, 'Luke', 'Skywalker', '15 Maiden Lane', 'New York', 'New York', 10222, '212-555-1234'),
(100005, 'Winston', 'Smith', '123 Sycamore Street', 'Greensboro', 'North Carolina', 27401, '919-555-6623'),
(100006, 'MaryAnne', 'Jenkins', '1 Coconut Way', 'Jupiter', 'Florida', 33458, '321-555-8907'),
(100007, 'Janet', 'Williams', '55 Redondo Beach Blvd', 'Torrence', 'California', 90501, '310-555-5678');

insert into Orders
Values (1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
(1204306, 100005, 'ADV-48-10F',	'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
(1204307, 100006, 'ENT-24-10F',	'Enterprise Switch 10GigE SFP+ 24 Port'),
(1204308, 100007, 'ENT-48-10F',	'Enterprise Switch 10GigE SFP+ 48 port');

select Count(*)
from Customers
Where City LIKE '%Woonsocket%';
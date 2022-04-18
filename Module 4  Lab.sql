select orders.orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
from orders inner join orderdetails on orders.orderNumber = orderdetails.orderNumber 
where orders.orderNumber = 10330 or orders.orderNumber = 10338 or orders.orderNumber = 10194;

select *
from payments
where customerNumber = 103;

delete from payments
where customerNumber = 103;

select employees.employeeNumber as 'Sales Man', customers.customerName, customerNumber
from employees inner join customers on employees.employeeNumber = customers.salesRepEmployeeNumber
where employees.employeeNumber = 1504;

select customers.customerName, customerNumber, Concat(employees.firstName, " ", employees.lastName) as 'Sales Rep'
from customers inner join employees on customers.salesRepEmployeeNumber = employees.employeeNumber
where customers.state = 'MA';

INSERT INTO customers
values (999, 'Best Customer Ever', 'Hobbs', 'Brandon', '2106797631', '3732 State Hiway', NULL, 'Houston', 'TX', '11236', 'USA', 1370, 99999.99);

LOAD DATA INFILE '/home/codio/workspace/customers.csv' 
INTO TABLE Customers 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/home/codio/workspace/rma.csv' 
INTO TABLE RMA 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/home/codio/workspace/orders.csv' 
INTO TABLE Orders 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select Count(*)
from Customers
Where City = 'Framingham' AND State = 'Massachusetts';

insert into Customers
Values (100004, 'Luke', 'Skywalker', '17 Maiden Lane', 'New York', 'NY', 10222, '212-555-1234'),
(100005, 'Winston', 'Smith', '128 Sycamore Street', 'Greensboro', 'NC', 27401, '919-555-6623'),
(100006, 'MaryAnne', 'Jenkins', '2 Coconut Way', 'Jupiter', 'FL', 33458, '321-555-8907'),
(100007, 'Janet', 'Williams', '58 Redondo Beach Blvd', 'Torrence', 'CA', 90501, '310-555-5678');

update Customers
Set Telephone = '212-555-1234'
where CustomerID = 100004;

insert into Orders
Values (1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
(1204306, 100005, 'ADV-48-10F',	'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
(1204307, 100006, 'ENT-24-10F',	'Enterprise Switch 10GigE SFP+ 24 Port'),
(1204308, 100007, 'ENT-48-10F',	'Enterprise Switch 10GigE SFP+ 48 port');

select Status, Step
from RMA
where OrderID = 5175;

update RMA
SET Status = 'Complete', Step = 'Credit Customer Account'
WHERE OrderID = 5175;

select count(*),Reason 
from RMA
Group by Reason;

delete from RMA
where Reason LIKE '%Rejected%';

select * 
from Orders 
into outfile'/home/codio/workspace/Project_1_Output.csv' FIELDS TERMINATED BY',';

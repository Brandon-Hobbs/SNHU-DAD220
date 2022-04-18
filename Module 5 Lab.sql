Vehicle ID,State,Repair ,Reason,YEAR ,Make,Body Type 
0000015241383936,AL,Battery replacment,Dead battery,2016,RAM ,"1500 4WD Quad Cab 140.5"" SLT"
0000015241383936,AL,Dent Repair  Left Fender,Collision,2016,RAM ,"1500 4WD Quad Cab 140.5"" SLT"

create table PartsMaintenance (
VehicleID VARCHAR(16) NOT NULL,
State VarCHAR(2),
Repair VARCHAR(300),
Reason VARCHAR(300),
Year SMALLINT,
Make VARCHAR(50),
BodyType VARCHAR(100)
);

LOAD DATA INFILE '/home/codio/workspace/FleetMaintenanceRecords.csv' 
INTO TABLE PartsMaintenance 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

create table Regions (
State VARCHAR(2),
Region VARCHAR(20)
);

select count(*), Repair
from PartsMaintenance
Group by Repair
Order by Count(*) DESC;

select count(*), State as 'Southwest'
from PartsMaintenance
Where State In ('AZ', 'NM', 'TX', 'OK') 
Order by Count(*) DESC;

select count(*), State as 'Southeast'
from PartsMaintenance
Where State In ('AR', 'LA', 'MS', 'AL', 'GA', 'FL', 'KY', 'TN', 'SC', 'NC', 'VA', 'WV', 'DE', 'MD') 
Order by Count(*) DESC;

select count(*), State as 'Northeast'
from PartsMaintenance
Where State In ('PA', 'NJ', 'NY', 'CT', 'RI', 'MA', 'VT', 'NH', 'ME') 
Order by Count(*) DESC;

select count(*), State as 'Midwest'
from PartsMaintenance
Where State In ('ND', 'SD', 'KS', 'NE', 'MN', 'WI', 'IA', 'MO', 'MI', 'IN', 'IL', 'OH') 
Order by Count(*) DESC;

select count(*), State as 'West'
from PartsMaintenance
Where State In ('WA', 'ID', 'MT', 'OR', 'WY', 'CO', 'UT', 'NV', 'CA') 
Order by Count(*) DESC;

Insert into Regions
Values ('AZ', 'Southwest'), ('NM', 'Southwest'), ('TX','Southwest'), ('OK','Southwest');

Insert into Regions
Values('AR', 'Southeast'), ('LA', 'Southeast'), ('MS', 'Southeast'), ('AL','Southeast'), ('GA','Southeast'), ('FL', 'Southeast'), 
('KY', 'Southeast'), ('TN', 'Southeast'), ('SC', 'Southeast'), ('NC', 'Southeast'), ('VA', 'Southeast'), ('WV', 'Southeast'),
('DE', 'Southeast'), ('MD','Southeast');

Insert into Regions
Values('PA', 'Northeast'),('NJ', 'Northeast'),('NY', 'Northeast'),('CT', 'Northeast'),
('RI', 'Northeast'),('MA', 'Northeast'),('VT', 'Northeast'),('NH','Northeast'),('ME','Northeast');

Insert into Regions
Values ('ND','Midwest'),('SD','Midwest'),('KS','Midwest'),('NE','Midwest'),('MN','Midwest'),('WI','Midwest'),('IA','Midwest'),('MO','Midwest'),
('MI','Midwest'),('IN','Midwest'),('IL','Midwest'),('OH','Midwest');

Insert into Regions
Values ('WA','West'),('ID','West'),('MT','West'),('OR','West'),('WY','West'),
('CO','West'),('UT','West'),('NV','West'),('CA','West'); 

select count(*), Regions.Region
from PartsMaintenance
inner join Regions
On PartsMaintenance.State = Regions.State
Group By Region
Order by Count(*) DESC;

select count(*), Regions.Region, Repair
from PartsMaintenance
inner join Regions
On PartsMaintenance.State = Regions.State
Where Regions.Region = 'Midwest'
Group By Region, Repair
Order by Count(*) DESC;

select count(*), Repair, Reason
from PartsMaintenance
Where Reason Like '%corrosion%' 
or Reason LIKE '%rust%'
Group by Reason
Order by Count(*) DESC;

select count(*), Repair, Reason
from PartsMaintenance
Where Reason Like '%corrosion%' 
or Reason LIKE '%rust%'
Group by Reason
Order by Count(*), Repair DESC;

select Repair, Reason, Count(*)
from PartsMaintenance
Where Reason Like '%mechanical%' 
or Reason LIKE '%accident%'
or Reason LIKE "%flat%"
or Reason like "%rock%"
or Reason like "%crack"
or Reason like "%dent%"
Group by Reason
Order by Repair, Count(*) DESC;

Select State, Count(Customers.State) 
From Customers
Group by Customers.State
Order by Count(Customers.State);

Select State, Count(Distinct Orders.OrderID)
From Customers 
Left join Orders
on Customers.CustomerID = Orders.CustomerID
Group by Customers.State
Order by State;

Select SKU, Count(SKU)
From Orders
Group by SKU
Order by Count(SKU);

Select SKU, Count(SKU)
From Orders
inner join Customers
On Orders.CustomerID = Customers.CustomerID
Where State = "Virginia"
or State = "North Carolina"
Or State = "South Carolina"
or State = "Georgia"
Group by SKU
Order by Count(SKU);

Select SKU, Count(Distinct RMAID)
From Orders
Inner Join RMA
On Orders.OrderID = RMA.OrderID
Group by SKU
Order by Count(*) DESC;

Select SKU, Count(Distinct RMAID)
From Orders
Inner Join RMA
On Orders.OrderID = RMA.OrderID
Inner Join Customers
On Orders.CustomerID = Customers.CustomerID
Where State in ("Washington", "Oregon", "Idaho", "Montana")
Group by SKU
Order by Count(*) DESC;

Select Customers.State, Count(Distinct RMAID) AS Returns
From Customers
Left Join Orders
On Orders.CollaboratorID = Customers.CollaboratorID
Inner Join RMA
ON Orders.OrderID = RMA.OrderID
Group by State
Order by Returns DESC;

Select SKU, Count(Orders.OrderID)
From Orders
Group by SKU;

Select SKU, Count(RMAID)
From RMA
Inner Join Orders
on Orders.OrderID = RMA.OrderID
Group by SKU;

Select Orders.SKU, Count(Distinct Orders.OrderID) As Orders, RMA_Count, (RMA_Count / Count(*) * 100) AS 'Return Rate %'
From Orders
left join (
Select SKU, Count(Distinct RMAID) as RMA_Count
From RMA
Inner Join Orders
on Orders.OrderID = RMA.OrderID
Group by SKU
) As RMA_Count_join
on RMA_Count_join.SKU = Orders.SKU
Group by SKU
Order by Orders DESC;

Select Customers.CollaboratorID AS "Cust. ID", CONCAT(Customers.FirstName, " ", Customers.LastName) AS Customer, Count(RMA.RMAID) As RMA_Count
From Customers
Left Join Orders
On Customers.CollaboratorID = Orders.CollaboratorID
Inner Join RMA
ON Orders.OrderID = RMA.OrderID
Group by Customers.CollaboratorID
Having RMA_Count > 2
Order by RMA_Count DESC
Limit 20;

select count(*),Reason 
from RMA
Group by Reason;

select count(*),Status 
from RMA
Group by Status;

select count(*) as Amount, Step 
from RMA
Group by Step
Order by Amount DESC;
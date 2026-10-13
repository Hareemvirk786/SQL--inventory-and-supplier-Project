USE Apex_Project;


### UPLOADED DATASET renamed as  INVENTORY
### UPLOADED DATASET renamed as  SUPPLIERS

Select * iNVENTORY;
SELECT COUNT(*) AS Total_Products
FROM Inventory;
### Q.1 How many prodicts are in inventory?
SELECT COUNT(*) AS Total_Products
from Inventory;
### Answer: 10 Products

### Q.2 What is the Total inventory Value?
 SELECT SUM(Units_In_Stock * Unit_Cost) AS inventory_Value From Inventory;
 ### Answer: $ 76600.00
 
 ### Q.3 Which Category has the highest Stock?
 
 SELECT Category, SUM(Units_In_Stock) AS Total_Stock FROM Inventory
 GROUP BY Category ORDER BY Total_Stock DESC
 LIMIT 1;
   ### ANSWER: Electronics has highest Stock 178 Units
   
   ### Q.4 Which Products need Restocking (Stock below reorder level)
   
   Select Product_Name, Units_in_Stock, Reorder_level
   FROM inventory
   WHERE Units_In_Stock < reorder_level;
   
   ### Answer: Office Chairs,Microwave and Air Fryer need to be restocking.
   
   ###Q.5 WHICH Supplier Provides the Most Products?
      SELECT Supplier_ID, COUNT(*) AS Product_Count
      FROM Inventory
      Group BY Supplier_ID
      Order BY Product_COUNT DESC;
      ### Answer; all the suppliers has equal Number.
      
      ### Q.6 Which Supplier has the highest rating?
      SELECT Supplier_Name, SUpplier_Rating
      From Suppliers 
      ORDER BY Supplier_Rating DESC
      LImIT 1;
      
      ### Answer: SUPPLIER 1 has the highest rating.
      
      ####Q.7Which State has the most Suppliers?
      SELECT State, COUNT(*) AS Supplier_Count
       FROM Suppliers
       GROUP BY State
       ORDER BY Supplier_Count DESC
       LIMIT 1;
        ### Answer: California State has the most 11 suppliers
        
        
        ###Q.8 Which Supplier Category Contribute the highest inventory value?
        SELECT S.Category, SUM(i.Units_In_Stock * i.Unit_Cost) As inventory_Value
        FROM Inventory i
        INNER JOIN Suppliers s
        ON i.Supplier_ID = S.Supplier_ID
        Group BY S.Category
        ORder BY Inventory_value DESC
        LIMIT 1;
        ### Answer: Electronics is the Category Contributes $40000.
 
 





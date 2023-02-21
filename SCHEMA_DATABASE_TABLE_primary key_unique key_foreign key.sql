--1-create a database 

CREATE DATABASE IndustryConnect;

-- 2-create a schema 
USE IndustryConnect;

CREATE SCHEMA MySchema;

-- 3-create a table 
USE IndustryConnect;

CREATE TABLE MySchema.Products(
ProductID INT,
ProductName NVARCHAR(50),
ProductType NVARCHAR(30),
Price NUMERIC(10,2),
Quantity INT
)

--4-add constraint ' Primary key' & 'Unique key'
USE IndustryConnect;

ALTER TABLE MySchema.Products
ADD CONSTRAINT PK_Products_ProductID PRIMARY KEY (ProductID)
ALTER TABLE MySchema.Products
ADD CONSTRAINT UQ_Products_ProductName UNIQUE (ProductName)

--5. add constraint  'foreign key'

--create another table 'Order'
USE IndustryConnect;

CREATE TABLE MySchema.Orders(
OrderID INT NOT NULL PRIMARY KEY,
OrderDate DATETIME NOT NULL,
CustomerName VARCHAR(50),
ProductID INT FOREIGN KEY REFERENCES MySchema.Products(ProductID)
)

--6-add constraint 'CHECK'

ALTER TABLE MySchema.Orders
ADD CONSTRAINT CK_Orders_OrderDate_GreaterThanOrEqualTo_2023_01_01 CHECK (OrderDate >= '2023-01-01');


--7-drop constraint' check' 
ALTER TABLE MySchema.Orders
DROP CONSTRAINT CK_Orders
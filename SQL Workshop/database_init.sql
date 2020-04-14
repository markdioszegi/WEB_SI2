DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Order_;
DROP TABLE IF EXISTS Order_Detail;
DROP TABLE IF EXISTS Product;

CREATE TABLE Customer
(
    CustomerID SERIAL UNIQUE PRIMARY KEY,
    CompanyName VARCHAR,
    ContactName VARCHAR,
    ContactTitle VARCHAR,
    Address VARCHAR,
    City VARCHAR,
    Region VARCHAR,
    PostalCode VARCHAR,
    Country VARCHAR,
    Phone VARCHAR,
    Fax INT CHECK ( Fax > 0)
);

CREATE TABLE Order_
(
    OrderID SERIAL UNIQUE PRIMARY KEY NOT NULL,
    CustomerID SERIAL UNIQUE NOT NULL REFERENCES Customer(CustomerID),
    EmployeeID SERIAL UNIQUE NOT NULL,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia VARCHAR,
    Freight BOOL,
    ShipName VARCHAR,
    ShipAddress VARCHAR,
    ShipCity VARCHAR,
    ShipRegion VARCHAR,
    ShipPostalCode VARCHAR,
    ShipCountry VARCHAR
);

CREATE TABLE Product
(
    ProductID SERIAL UNIQUE PRIMARY KEY,
    ProductName VARCHAR,
    SupplierID SERIAL UNIQUE,
    CategoryID SERIAL UNIQUE,
    QuantityPerUnit INT CHECK ( QuantityPerUnit >= 0 ),
    UnitPrice INT CHECK ( UnitPrice > 0 ),
    UnitsInStock INT CHECK ( UnitsOnOrder >= 0 ),
    UnitsOnOrder INT CHECK ( UnitsOnOrder >= 0 ),
    ReorderLevel INT CHECK ( ReorderLevel >= 0 ),
    Discontinued bool
);

CREATE TABLE Order_Detail
(
    OrderID SERIAL UNIQUE REFERENCES Order_(OrderID),
    ProductID SERIAL UNIQUE REFERENCES Product(ProductID),
    UnitPrice INT,
    Quantity INT,
    Discount INT CHECK ( Discount > 0 AND Discount <= 100 )
);

insert into Customer
    (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
values
    ('Meetz', 'Aaron Cristofaro', 'Mrs', '8569 Eggendart Pass', 'Memphis', 'Tennessee', '38114', 'United States', '901-410-2854', 50);
insert into Customer
    (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
values
    ('Muxo', 'Maje Van Geffen', 'Ms', '5 Havey Park', 'New Orleans', 'Louisiana', '70160', 'United States', '504-611-5599', 1);
insert into Customer
    (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
values
    ('Aibox', 'Lurleen Dunne', 'Rev', '7088 Twin Pines Park', 'Suffolk', 'Virginia', '23436', 'United States', '757-843-1656', 81);

insert into Order_
    (OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
values
    ('2020/12/3', '2020/6/3', '2019/2/6', 'S5', false, 'Mendy', '4 Schiller Park', 'Houston', 'Texas', '77070', 'United States');
insert into Order_
    (OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
values
    ('2020/10/1', '20202/3/2', '2019/10/8', '300M', false, 'Cassy', '1 Fremont Terrace', 'Saint Paul', 'Minnesota', '55103', 'United States');
insert into Order_
    (OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
values
    ('2019/7/8', '2019/1/11', '2019/12/6', 'GL-Class', false, 'Marie', '08244 Algoma Terrace', 'West Palm Beach', 'Florida', '33421', 'United States');

insert into Product
    (ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values
    ('Wine - Red Oakridge Merlot', 75, 26, 81, 70, 80, false);
insert into Product
    (ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values
    ('Quail - Jumbo Boneless', 87, 79, 17, 25, 41, false);
insert into Product
    (ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values
    ('Water - Aquafina Vitamin', 54, 60, 69, 53, 36, true);

insert into Order_Detail
    (UnitPrice, Quantity, Discount)
values
    (97, 7, 68);
insert into Order_Detail
    (UnitPrice, Quantity, Discount)
values
    (5, 4, 83);
insert into Order_Detail
    (UnitPrice, Quantity, Discount)
values
    (34, 3, 55);

SELECT *
FROM Customer;

COMMIT;
```
CREATE DATABASE bc08;

USE bc08;

-- Create table Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Create table Suppliers
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Create table Categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Create table Products witch a foreign key
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(50),
    Price DECIMAL(10, 2),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create table Orders witch a foreign key
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShipperID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create table OrderDetails with foreign keys
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (CustomerName, ContactName, Country)
VALUES
('Around the Horn', 'Thomas Hardy', 'UK'),
('Berglunds snabbköp', 'Christina Berglund', 'Sweden'),
('Blauer See Delikatessen', 'Hanna Moos', 'Germany'),
('Blondel père et fils', 'Frédérique Citeaux', 'France'),
('Bólido Comidas preparadas', 'Martín Sommer', 'Spain'),
('Bon app''', 'Laurence Lebihan', 'France'),
('Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Canada'),
('Cactus Comidas para llevar', 'Patricio Simpson', 'Argentina'),
('Centro comercial Moctezuma', 'Francisco Chang', 'Mexico'),
('Chop-suey Chinese', 'Yang Wang', 'Switzerland');


INSERT INTO Suppliers (SupplierName, ContactName, Country)
VALUES
('Grandma Kelly''s Homestead', 'Regina Murphy', 'USA'),
('Tokyo Traders', 'Yoshi Nagase', 'Japan'),
('Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Spain'),
('Mayumi''s', 'Mayumi Ohno', 'Japan'),
('Pavlova, Ltd.', 'Ian Devling', 'Australia'),
('Specialty Biscuits, Ltd.', 'Peter Wilson', 'UK'),
('PB Knäckebröd AB', 'Lars Peterson', 'Sweden'),
('Refrescos Americanas LTDA', 'Carlos Diaz', 'Brazil'),
('Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Germany'),
('Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Germany');


INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
('Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00),
('Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35),
('Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00),
('Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30.00),
('Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00),
('Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00),
('Ikura', 4, 8, '12 - 200 ml jars', 31.00),
('Queso Cabrales', 5, 4, '1 kg pkg.', 21.00),
('Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38.00),
('Konbu', 6, 8, '2 kg box', 6.00);


INSERT INTO Orders (CustomerID, OrderDate, ShipperID)
VALUES
(4, '2024-05-20', 3),
(5, '2024-05-21', 2),
(6, '2024-05-22', 1),
(7, '2024-05-23', 2),
(8, '2024-05-24', 3),
(9, '2024-05-25', 1),
(10, '2024-05-26', 2),
(1, '2024-05-27', 3),
(2, '2024-05-28', 1),
(3, '2024-05-29', 2);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 20),
(3, 4, 15),
(4, 5, 12),
(5, 6, 8),
(6, 7, 30),
(7, 8, 25),
(8, 9, 18),
(9, 10, 7);


INSERT INTO Categories (CategoryName)
VALUES
('Grains/Cereals'),
('Condiments'),
('Confections'),
('Dairy Products'),
('Seafood'),
('Beverages'),
('Produce'),
('Meat/Poultry');

```
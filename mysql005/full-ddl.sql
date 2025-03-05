-- BAI 1 
-- Liệt kê tên sản phẩm và tên nhà cung cấp cho tất cả các sản phẩm có giá lớn hơn 15.00
SELECT *
FROM Products p 
JOIN Suppliers s ON p.SupplierID = s.SupplierID 
WHERE p.Price > 15.00

-- BAI 2
-- Tìm tất cả các đơn hàng được thực hiện bởi khách hàng ở "Mexico"
SELECT * 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE Country = 'Mexico'


-- BAI 3
-- Tìm số lượng đơn hàng được thực hiện trong mỗi quốc gia
SELECT *
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID 
JOIN Suppliers s ON p.SupplierID = s.SupplierID 
GROUP BY s.Country 

-- BAI 4
-- Liệt kê tất cả các nhà cung cấp và số lượng sản phẩm mà họ cung cấp
SELECT s.SupplierName, SUM(od.Quantity)
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID 
JOIN OrderDetails od ON p.ProductID = od.ProductID 
GROUP BY s.SupplierName 


-- BAI 5
-- Liệt kê tên sản phẩm và giá của các sản phẩm đắt hơn sản phẩm "Chang"
SELECT p.ProductName, p.Price 
FROM Products p 
WHERE p.Price > (SELECT DISTINCT (Price) FROM Products p2 WHERE p2.ProductName = 'Chang')

-- BAI 6
-- Tìm tổng số lượng sản phẩm bán ra trong tháng 5 năm 2024
SELECT *
FROM Products p 
JOIN OrderDetails od ON p.ProductID = od.ProductID 
JOIN Orders o ON od.OrderID = o.OrderID
WHERE EXTRACT(YEAR_MONTH FROM o.OrderDate) = '202405'

-- BAI 7
-- Tìm tên của các khách hàng chưa từng đặt hàng
SELECT CustomerName 
FROM Customers c 
WHERE c.CustomerID NOT IN (SELECT CustomerID FROM Orders o)

-- BAI 8
-- Liệt kê các đơn hàng với tổng số tiền lớn hơn 200.00
SELECT o.OrderID, p.ProductName, sum(p.Price * od.Quantity) as total_price
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY o.OrderID,  p.ProductName
HAVING total_price > 200.00


-- BAI 9
-- Tìm tên sản phẩm và số lượng trung bình được đặt hàng cho mỗi đơn hàng
SELECT o.OrderID, p.ProductName, AVG(p.Price * od.Quantity) as avg_price
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY o.OrderID,  p.ProductName


-- BAI 10
-- Tìm khách hàng có tổng giá trị đơn hàng cao nhất
SELECT c.CustomerName, SUM(p.Price * od.Quantity) as total_price
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.OrderID 
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY c.CustomerName 
ORDER BY total_price DESC
LIMIT 1


-- BAI 11
-- Tìm các đơn hàng có tổng giá trị nằm trong top 10 cao nhất

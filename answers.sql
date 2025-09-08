#1
-- Create the new ProductDetail_1NF table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert atomic product values (one product per row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');
#2
-- Orders table: stores order-level info
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique orders (removing redundancy)
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- OrderItems table: stores product-level info (fully depends on OrderID + Product)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert product-level details
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

/**Question 1: Converting to First Normal Form (1NF)**/
-- First, I'll create two separate tables to properly represent the data
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Order_Products (
    OrderID INT,
    Product VARCHAR(100) NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Now I'll populate them with the normalized data
INSERT INTO Orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Each product gets its own row now
INSERT INTO Order_Products VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');

/**Question 2: Converting to Second Normal Form (2NF)**/

-- I'll maintain the Orders table from before since it already handles customer info
-- No changes needed to the Orders table structure

-- For the order items, I'll create a separate table
CREATE TABLE Order_Items (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (Product) REFERENCES Products(Product) -- Assuming a Products table exists
);

-- Inserting the normalized data
INSERT INTO Order_Items VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

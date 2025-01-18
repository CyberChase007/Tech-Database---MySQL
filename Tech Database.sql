CREATE DATABASE Tech;
USE Tech;

-- Table: Products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price FLOAT NOT NULL CHECK (Price >= 0),
    Stock INT NOT NULL CHECK (Stock >= 0),
    CompanyName VARCHAR(100) NOT NULL
);

-- Adding index for Category in Products
CREATE INDEX idx_category ON Products(Category);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255),
    INDEX idx_email (Email),
    INDEX idx_phone (Phone)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    OrderDate DATE NOT NULL,
    TotalAmount FLOAT NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Adding index for OrderDate in Orders
CREATE INDEX idx_order_date ON Orders(OrderDate);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, -- Adding Email column
    Role VARCHAR(50),
    RoleDescription VARCHAR(255),
    Salary FLOAT NOT NULL CHECK (Salary >= 0),
    HireDate DATE NOT NULL
);

-- Adding index for Email in Employees
CREATE INDEX idx_employee_email ON Employees(Email);

-- Table: Suppliers
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    ProductCategory VARCHAR(50) NOT NULL
);

-- Adding index for ContactEmail in Suppliers
CREATE INDEX idx_supplier_email ON Suppliers(ContactEmail);

-- Table: Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    WarehouseLocation VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Adding indexes for ProductID and WarehouseLocation in Inventory
CREATE INDEX idx_inventory_product_id ON Inventory(ProductID);
CREATE INDEX idx_inventory_warehouse_location ON Inventory(WarehouseLocation);

-- Create SalesPerformance Table
CREATE TABLE SalesPerformance (
    PerformanceID INT AUTO_INCREMENT PRIMARY KEY,
    Year INT NOT NULL,  -- Assuming the business started in 2021
    TotalSalesAmount DECIMAL(15, 2) NOT NULL,
    NumberOfSales INT UNSIGNED NOT NULL,
    UniqueCustomers INT UNSIGNED NOT NULL,
    TopSellingProductID INT,  -- Foreign Key Reference (make sure Products table exists)
    TotalProductsSold INT UNSIGNED NOT NULL,
    InventoryTurnoverRate DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TopSellingProductID) REFERENCES Products(ProductID)
);

-- Adding index for Year in SalesPerformance
CREATE INDEX idx_sales_performance_year ON SalesPerformance(Year);

-- Populate Products Table with CompanyName included
INSERT INTO Products (Name, Category, Price, Stock, CompanyName) VALUES
('iPhone 15 Pro', 'Smartphone', 1099.99, 45, 'Apple'),
('iPad Air 2024', 'Tablet', 649.99, 25, 'Apple'),
('MacBook Pro M2', 'Laptop', 1799.99, 15, 'Apple'),
('Apple Watch Ultra 2', 'Smartwatch', 849.99, 35, 'Apple'),
('AirPods Pro 2', 'Audio', 249.99, 110, 'Apple'),
('Mac Mini M2', 'Desktop', 799.99, 60, 'Apple'),
('Apple Pencil 2nd Gen', 'Accessories', 129.99, 250, 'Apple'),
('Magic Keyboard with Numeric Keypad', 'Accessories', 149.99, 140, 'Apple'),
('Magic Mouse 2', 'Accessories', 79.99, 160, 'Apple'),
('Apple HomePod Mini', 'Smart Home', 99.99, 120, 'Apple'),
('Apple TV 4K', 'Entertainment', 179.99, 80, 'Apple'),
('iMac 24-inch M1', 'Desktop', 1299.99, 20, 'Apple'),
('Apple Watch SE', 'Smartwatch', 279.99, 75, 'Apple'),
('AirPods 3', 'Audio', 179.99, 130, 'Apple'),
('Apple Studio Display', 'Monitor', 1599.99, 25, 'Apple'),
('Mac Pro M2', 'Desktop', 3999.99, 12, 'Apple'),
('iPhone 14 Pro Max', 'Smartphone', 1199.99, 30, 'Apple'),
('Apple AirTag (4 Pack)', 'Accessories', 99.99, 200, 'Apple'),
('Apple Smart Keyboard Folio', 'Accessories', 179.99, 80, 'Apple'),
('Apple Leather Wallet with MagSafe', 'Accessories', 59.99, 100, 'Apple'),
('Samsung Galaxy S23 Ultra', 'Smartphone', 1299.99, 50, 'Samsung'),
('Samsung Galaxy Z Fold 5', 'Smartphone', 1799.99, 30, 'Samsung'),
('Samsung Galaxy Tab S8 Ultra', 'Tablet', 1199.99, 20, 'Samsung'),
('Samsung Smart Monitor M8', 'Monitor', 649.99, 55, 'Samsung'),
('Samsung Odyssey G9', 'Monitor', 1499.99, 25, 'Samsung'),
('Samsung Galaxy Watch 5 Pro', 'Smartwatch', 499.99, 50, 'Samsung'),
('Samsung Galaxy Buds 2 Pro', 'Audio', 249.99, 80, 'Samsung'),
('Samsung QN90C QLED TV', 'Entertainment', 2499.99, 15, 'Samsung'),
('Samsung SSD 990 Pro 2TB', 'SSD', 299.99, 100, 'Samsung'),
('Samsung Galaxy Tab S9+', 'Tablet', 1099.99, 25, 'Samsung'),
('Samsung Galaxy A54', 'Smartphone', 399.99, 90, 'Samsung'),
('Samsung Galaxy Watch Active 2', 'Smartwatch', 199.99, 60, 'Samsung'),
('Samsung T7 Shield 1TB', 'SSD', 129.99, 150, 'Samsung'),
('Samsung Freestyle Projector', 'Entertainment', 999.99, 20, 'Samsung'),
('Samsung Galaxy Buds Live', 'Audio', 129.99, 70, 'Samsung'),
('Samsung Galaxy Book Pro 360', 'Laptop', 1499.99, 35, 'Samsung'),
('Samsung Jet Bot AI+ Robot Vacuum', 'Smart Home', 999.99, 25, 'Samsung'),
('Samsung Galaxy Fit 2', 'Smartwatch', 99.99, 100, 'Samsung'),
('Samsung Galaxy Tab A8', 'Tablet', 349.99, 40, 'Samsung'),
('Samsung Galaxy Z Flip 5', 'Smartphone', 999.99, 50, 'Samsung'),
('Dell XPS 15', 'Laptop', 1799.99, 25, 'Dell'),
('Dell Inspiron 15 3000', 'Laptop', 649.99, 45, 'Dell'),
('Dell G15 Gaming Laptop', 'Laptop', 1199.99, 30, 'Dell'),
('Dell Ultrasharp U2723QE', 'Monitor', 749.99, 35, 'Dell'),
('Dell Alienware m18', 'Laptop', 2499.99, 20, 'Dell'),
('Dell Latitude 5420', 'Laptop', 1099.99, 40, 'Dell'),
('Dell OptiPlex 7090', 'Desktop', 899.99, 50, 'Dell'),
('Dell Vostro 5510', 'Laptop', 999.99, 35, 'Dell'),
('Dell Precision 5570', 'Laptop', 2299.99, 15, 'Dell'),
('Dell UltraSharp 49 Curved Monitor', 'Monitor', 1499.99, 20, 'Dell'),
('Dell Inspiron 24 All-in-One', 'Desktop', 1399.99, 30, 'Dell'),
('Dell Latitude 9330 2-in-1', 'Laptop', 2199.99, 10, 'Dell'),
('Dell Inspiron 16 Plus', 'Laptop', 1199.99, 25, 'Dell'),
('Dell XPS 17', 'Laptop', 2299.99, 18, 'Dell'),
('Dell Precision 3460', 'Desktop', 1499.99, 12, 'Dell'),
('Dell 32 Curved Gaming Monitor', 'Monitor', 499.99, 40, 'Dell'),
('Dell U3223QE Monitor', 'Monitor', 999.99, 15, 'Dell'),
('Dell Mobile Adapter Speakerphone', 'Accessories', 99.99, 120, 'Dell'),
('Dell Dock WD19', 'Accessories', 199.99, 80, 'Dell'),
('Dell Alienware AW3423DW', 'Monitor', 1399.99, 20, 'Dell'),
('Canon EOS R6', 'Camera', 2399.99, 20, 'Canon'),
('Canon EOS 90D', 'Camera', 1299.99, 25, 'Canon'),
('Canon PowerShot G7 X Mark III', 'Camera', 799.99, 40, 'Canon'),
('Canon RF 50mm F1.8 Lens', 'Lens', 199.99, 80, 'Canon'),
('Canon Speedlite EL-100', 'Flash', 299.99, 50, 'Canon'),
('Canon PIXMA TR4520', 'Printer', 99.99, 120, 'Canon'),
('Canon EOS RP', 'Camera', 1099.99, 30, 'Canon'),
('Canon RF 70-200mm F2.8 Lens', 'Lens', 2799.99, 10, 'Canon'),
('Canon XA40 Professional Camcorder', 'Camera', 1499.99, 15, 'Canon'),
('Canon VIXIA HF R800', 'Camcorder', 299.99, 60, 'Canon'),
('Canon CanoScan LiDE 400', 'Scanner', 89.99, 100, 'Canon'),
('Canon MAXIFY GX7020', 'Printer', 599.99, 25, 'Canon'),
('Canon PIXMA TS9521C', 'Printer', 199.99, 40, 'Canon'),
('Canon RF 100-500mm Lens', 'Lens', 2899.99, 8, 'Canon'),
('Canon IVY CLIQ+2', 'Instant Camera', 149.99, 70, 'Canon'),
('Canon RF 24-105mm F4 Lens', 'Lens', 1299.99, 20, 'Canon'),
('Canon CP1300 Photo Printer', 'Printer', 199.99, 50, 'Canon'),
('Canon RF 85mm F1.2 Lens', 'Lens', 2699.99, 12, 'Canon'),
('Canon PowerShot ELPH 180', 'Camera', 119.99, 150, 'Canon'),
('Canon PIXMA MG3620', 'Printer', 89.99, 200, 'Canon'),
('HP Spectre x360 14', 'Laptop', 1399.99, 50, 'HP'),
('HP Elite Dragonfly', 'Laptop', 1999.99, 30, 'HP'),
('HP Envy 13', 'Laptop', 899.99, 45, 'HP'),
('HP Pavilion x360', 'Laptop', 749.99, 60, 'HP'),
('HP Omen 15', 'Laptop', 1599.99, 40, 'HP'),
('HP DeskJet 4155', 'Printer', 89.99, 120, 'HP'),
('HP LaserJet Pro M404n', 'Printer', 169.99, 70, 'HP'),
('HP EliteBook 850 G7', 'Laptop', 1199.99, 35, 'HP'),
('HP 32s Monitor', 'Monitor', 199.99, 100, 'HP'),
('HP V28 Monitor', 'Monitor', 179.99, 110, 'HP'),
('LG Gram 17', 'Laptop', 1799.99, 30, 'LG'),
('LG UltraGear 27GN950-B', 'Monitor', 799.99, 40, 'LG'),
('LG 49WL95C-W', 'Monitor', 949.99, 20, 'LG'),
('LG OLED CX Series', 'TV', 1799.99, 15, 'LG'),
('LG 27GL850-B', 'Monitor', 349.99, 55, 'LG'),
('LG 34WN80C-B', 'Monitor', 399.99, 45, 'LG'),
('LG UltraWide 38WN95C-W', 'Monitor', 849.99, 25, 'LG'),
('LG 32UN650-W', 'Monitor', 329.99, 60, 'LG'),
('LG 27UK850-W', 'Monitor', 449.99, 50, 'LG'),
('LG OLED48CXPUB', 'TV', 1499.99, 10, 'LG'),
('ViewSonic XG2405', 'Monitor', 179.99, 50, 'ViewSonic'),
('ViewSonic VA2456-MHD', 'Monitor', 139.99, 80, 'ViewSonic'),
('ViewSonic Elite XG270QC', 'Monitor', 369.99, 40, 'ViewSonic'),
('ViewSonic VG2755-2K', 'Monitor', 249.99, 35, 'ViewSonic'),
('ViewSonic VA3261-2K', 'Monitor', 289.99, 20, 'ViewSonic'),
('ASUS ROG Strix G15', 'Laptop', 1599.99, 45, 'ASUS'),
('ASUS TUF Gaming A16', 'Laptop', 1099.99, 55, 'ASUS'),
('ASUS ZenBook 14', 'Laptop', 999.99, 60, 'ASUS'),
('ASUS VG248QG', 'Monitor', 249.99, 70, 'ASUS'),
('ASUS ROG Swift PG259QN', 'Monitor', 699.99, 25, 'ASUS'),
('ASUS ProArt PA32UCG', 'Monitor', 1999.99, 10, 'ASUS'),
('ASUS TUF Gaming VG27AQ', 'Monitor', 329.99, 50, 'ASUS'),
('ASUS TUF Gaming H3', 'Audio', 69.99, 100, 'ASUS'),
('ASUS ROG Strix Flare', 'Keyboard', 129.99, 120, 'ASUS'),
('ASUS ROG Delta S', 'Headset', 199.99, 80, 'ASUS');


-- Populate Customers Table
INSERT INTO Customers (FullName, Email, Phone, Address) VALUES
('Ali Ahmed', 'ali.ahmed@example.com', '+92 300 1234567', 'Karachi, Sindh'),
('Fatima Khan', 'fatima.khan@example.com', '+92 301 2345678', 'Lahore, Punjab'),
('Usman Tariq', 'usman.tariq@example.com', '+92 302 3456789', 'Islamabad, Capital Territory'),
('Sara Ali', 'sara.ali@example.com', '+92 303 4567890', 'Rawalpindi, Punjab'),
('Omar Siddiqui', 'omar.siddiqui@example.com', '+92 304 5678901', 'Faisalabad, Punjab'),
('Ayesha Malik', 'ayesha.malik@example.com', '+92 305 6789012', 'Multan, Punjab'),
('Zain Abbas', 'zain.abbas@example.com', '+92 306 7890123', 'Peshawar, Khyber Pakhtunkhwa'),
('Muneeb Ahmad', 'muneeb.ahmad@example.com', '+92 307 8901234', 'Quetta, Balochistan'),
('Nida Shah', 'nida.shah@example.com', '+92 308 9012345', 'Sialkot, Punjab'),
('Tariq Mehmood', 'tariq.mehmood@example.com', '+92 309 0123456', 'Karachi, Sindh'),
('Sana Raza', 'sana.raza@example.com', '+92 310 1234567', 'Lahore, Punjab'),
('Bilal Khan', 'bilal.khan@example.com', '+92 311 2345678', 'Islamabad, Capital Territory'),
('Kiran Naz', 'kiran.naz@example.com', '+92 312 3456789', 'Sargodha, Punjab'),
('Hassan Shahzad', 'hassan.shahzad@example.com', '+92 313 4567890', 'Lahore, Punjab'),
('Sadia Jamil', 'sadia.jamil@example.com', '+92 314 5678901', 'Karachi, Sindh'),
('Zara Ahmed', 'zara.ahmed@example.com', '+92 315 6789012', 'Islamabad, Capital Territory'),
('Asad Iqbal', 'asad.iqbal@example.com', '+92 316 7890123', 'Peshawar, Khyber Pakhtunkhwa'),
('Anum Aslam', 'anum.aslam@example.com', '+92 317 8901234', 'Rawalpindi, Punjab'),
('Fahad Khan', 'fahad.khan@example.com', '+92 318 9012345', 'Lahore, Punjab'),
('Mehreen Ali', 'mehreen.ali@example.com', '+92 319 0123456', 'Faisalabad, Punjab'),
('Raza Shah', 'raza.shah@example.com', '+92 320 1234567', 'Karachi, Sindh'),
('Aftab Ahmed', 'aftab.ahmed@example.com', '+92 321 2345678', 'Quetta, Balochistan'),
('Kashan Malik', 'kashan.malik@example.com', '+92 322 3456789', 'Sialkot, Punjab'),
('Nashit Akhtar', 'nashit.akhtar@example.com', '+92 323 4567890', 'Multan, Punjab'),
('Amina Malik', 'amina.malik@example.com', '+92 324 5678901', 'Peshawar, Khyber Pakhtunkhwa'),
('Salman Ahmed', 'salman.ahmed@example.com', '+92 325 6789012', 'Islamabad, Capital Territory'),
('Iqra Tariq', 'iqra.tariq@example.com', '+92 326 7890123', 'Rawalpindi, Punjab'),
('Junaid Khan', 'junaid.khan@example.com', '+92 327 8901234', 'Karachi, Sindh'),
('Bushra Khalid', 'bushra.khalid@example.com', '+92 328 9012345', 'Lahore, Punjab'),
('Umair Aftab', 'umair.aftab@example.com', '+92 329 0123456', 'Faisalabad, Punjab'),
('Muneeb Tariq', 'muneeb.tariq@example.com', '+92 330 1234567', 'Rawalpindi, Punjab'),
('Hina Raza', 'hina.raza@example.com', '+92 331 2345678', 'Sialkot, Punjab'),
('Aliyah Ali', 'aliyah.ali@example.com', '+92 332 3456789', 'Karachi, Sindh'),
('Shehzad Bashir', 'shehzad.bashir@example.com', '+92 333 4567890', 'Peshawar, Khyber Pakhtunkhwa'),
('Lubna Shah', 'lubna.shah@example.com', '+92 334 5678901', 'Islamabad, Capital Territory'),
('Arsalan Ali', 'arsalan.ali@example.com', '+92 335 6789012', 'Quetta, Balochistan'),
('Amna Javed', 'amna.javed@example.com', '+92 336 7890123', 'Multan, Punjab'),
('Bilal Ahmad', 'bilal.ahmad@example.com', '+92 337 8901234', 'Karachi, Sindh'),
('Rashid Iqbal', 'rashid.iqbal@example.com', '+92 338 9012345', 'Lahore, Punjab'),
('Kiran Ali', 'kiran.ali@example.com', '+92 339 0123456', 'Islamabad, Capital Territory'),
('Rehman Khan', 'rehman.khan@example.com', '+92 340 1234567', 'Rawalpindi, Punjab'),
('Hassan Ali', 'hassan.ali@example.com', '+92 341 2345678', 'Faisalabad, Punjab'),
('Ammar Iqbal', 'ammar.iqbal@example.com', '+92 342 3456789', 'Karachi, Sindh'),
('Rania Ahmed', 'rania.ahmed@example.com', '+92 343 4567890', 'Sialkot, Punjab'),
('Sadia Malik', 'sadia.malik@example.com', '+92 344 5678901', 'Lahore, Punjab'),
('Nabeel Shaikh', 'nabeel.shaikh@example.com', '+92 345 6789012', 'Islamabad, Capital Territory'),
('Mahnoor Shaheen', 'mahnoor.shaheen@example.com', '+92 346 7890123', 'Multan, Punjab'),
('Sarmad Iqbal', 'sarmad.iqbal@example.com', '+92 347 8901234', 'Peshawar, Khyber Pakhtunkhwa'),
('Kashif Malik', 'kashif.malik@example.com', '+92 348 9012345', 'Karachi, Sindh'),
('Ali Raza', 'ali.raza@example.com', '+92 349 0123456', 'Lahore, Punjab'),
('Maira Hassan', 'maira.hassan@example.com', '+92 350 1234567', 'Faisalabad, Punjab'),
('Jameel Shah', 'jameel.shah@example.com', '+92 351 2345678', 'Islamabad, Capital Territory'),
('Muneeba Mehmood', 'muneeba.mehmood@example.com', '+92 352 3456789', 'Rawalpindi, Punjab'),
('Bilal Zaman', 'bilal.zaman@example.com', '+92 353 4567890', 'Sialkot, Punjab'),
('Khurram Shahzad', 'khurram.shahzad@example.com', '+92 354 5678901', 'Karachi, Sindh'),
('Rida Tariq', 'rida.tariq@example.com', '+92 355 6789012', 'Multan, Punjab'),
('Syed Ali', 'syed.ali@example.com', '+92 356 7890123', 'Lahore, Punjab'),
('Nida Baig', 'nida.baig@example.com', '+92 357 8901234', 'Islamabad, Capital Territory'),
('Kamran Sheikh', 'kamran.sheikh@example.com', '+92 358 9012345', 'Peshawar, Khyber Pakhtunkhwa'),
('Zainab Akhtar', 'zainab.akhtar@example.com', '+92 359 0123456', 'Rawalpindi, Punjab'),
('Shahbaz Raza', 'shahbaz.raza@example.com', '+92 360 1234567', 'Faisalabad, Punjab'),
('Rahat Ahmed', 'rahat.ahmed@example.com', '+92 361 2345678', 'Karachi, Sindh'),
('Saira Khan', 'saira.khan@example.com', '+92 362 3456789', 'Lahore, Punjab'),
('Sana Riaz', 'sana.riaz@example.com', '+92 363 4567890', 'Multan, Punjab'),
('Imran Abbas', 'imran.abbas@example.com', '+92 364 5678901', 'Islamabad, Capital Territory'),
('Sajjad Ali', 'sajjad.ali@example.com', '+92 365 6789012', 'Peshawar, Khyber Pakhtunkhwa'),
('Umar Shah', 'umar.shah@example.com', '+92 366 7890123', 'Karachi, Sindh'),
('Madhia Aslam', 'madhia.aslam@example.com', '+92 367 8901234', 'Lahore, Punjab'),
('Awais Iqbal', 'awais.iqbal@example.com', '+92 368 9012345', 'Rawalpindi, Punjab'),
('Ayesha Zafar', 'ayesha.zafar@example.com', '+92 369 0123456', 'Faisalabad, Punjab'),
('Faizan Shah', 'faizan.shah@example.com', '+92 370 1234567', 'Karachi, Sindh'),
('Huma Tariq', 'huma.tariq@example.com', '+92 371 2345678', 'Multan, Punjab'),
('Hassan Mehmood', 'hassan.mehmood@example.com', '+92 372 3456789', 'Islamabad, Capital Territory'),
('Kiran Malik', 'kiran.malik@example.com', '+92 373 4567890', 'Lahore, Punjab'),
('Mubashir Raza', 'mubashir.raza@example.com', '+92 374 5678901', 'Sialkot, Punjab'),
('Kashan Ali', 'kashan.ali@example.com', '+92 375 6789012', 'Karachi, Sindh');

-- Populate Orders Table
-- Used Script to populute Orders Table



-- Populate Employees Table
INSERT INTO Employees (Name, Email, Role, RoleDescription, Salary, HireDate) VALUES
('Ahmed Farzan', 'ahmed.farzan@gmail.com', 'Co-Founder', 'Founder of Company', 120000, '2021-04-01'),
('Sufyan Ayaz', 'sufyan@gmail.com', 'Co-Founder', 'Founder of Company', 120000, '2021-04-01'),
('Abdul Basit', 'basit@gmail.com', 'Co-Founder', 'Founder of Company', 120000, '2021-04-01'),
('Ali Khan', 'ali.khan@company.pk', 'Software Engineer', 'Develops and maintains software applications', 60000, '2020-01-15'),
('Ayesha Siddiqui', 'ayesha.siddiqui@company.pk', 'Software Engineer', 'Develops and maintains software applications', 62000, '2021-06-22'),
('Usman Tariq', 'usman.tariq@company.pk', 'Product Manager', 'Manages product development and lifecycle', 75000, '2021-06-05'),
('Sara Ahmed', 'sara.ahmed@company.pk', 'Product Manager', 'Manages product development and lifecycle', 77000, '2021-11-12'),
('Bilal Shah', 'bilal.shah@company.pk', 'UX/UI Designer', 'Designs user interfaces and user experiences', 50000, '2021-08-25'),
('Kiran Malik', 'kiran.malik@company.pk', 'UX/UI Designer', 'Designs user interfaces and user experiences', 52000, '2022-02-14'),
('Hassan Ali', 'hassan.ali@company.pk', 'Marketing Specialist', 'Handles marketing strategies and campaigns', 45000, '2022-07-30'),
('Fatima Raza', 'fatima.raza@company.pk', 'Marketing Specialist', 'Handles marketing strategies and campaigns', 47000, '2022-09-01'),
('Shahzaib Zafar', 'shahzaib.zafar@company.pk', 'Sales Manager', 'Leads and manages the sales team', 70000, '2020-04-18'),
('Sana Javed', 'sana.javed@company.pk', 'Sales Manager', 'Leads and manages the sales team', 72000, '2021-05-10'),
('Muneeb Khan', 'muneeb.khan@company.pk', 'Data Analyst', 'Analyzes and interprets complex data', 58000, '2022-11-20'),
('Zainab Hussain', 'zainab.hussain@company.pk', 'Data Analyst', 'Analyzes and interprets complex data', 59000, '2022-02-22'),
('Raza Ahmed', 'raza.ahmed@company.pk', 'HR Specialist', 'Manages hiring processes and employee relations', 53000, '2023-04-30'),
('Nadia Malik', 'nadia.malik@company.pk', 'HR Specialist', 'Manages hiring processes and employee relations', 54000, '2020-06-01'),
('Faisal Khan', 'faisal.khan@company.pk', 'Software Engineer', 'Develops and maintains software applications', 62000, '2021-12-09'),
('Ahmed Butt', 'ahmed.butt@company.pk', 'Software Engineer', 'Develops and maintains software applications', 63000, '2022-03-15'),
('Maira Iqbal', 'maira.iqbal@company.pk', 'Product Manager', 'Manages product development and lifecycle', 74000, '2020-10-10'),
('Arsalan Hussain', 'arsalan.hussain@company.pk', 'Sales Manager', 'Leads and manages the sales team', 71000, '2022-01-05'),
('Khadija Akram', 'khadija.akram@company.pk', 'Data Analyst', 'Analyzes and interprets complex data', 60000, '2021-07-22'),
('Aliya Shah', 'aliya.shah@company.pk', 'UX/UI Designer', 'Designs user interfaces and user experiences', 51000, '2022-03-30'),
('Shahmeer Ali', 'shahmeer.ali@company.pk', 'HR Specialist', 'Manages hiring processes and employee relations', 53000, '2020-09-13'),
('Umair Farooq', 'umair.farooq@company.pk', 'Marketing Specialist', 'Handles marketing strategies and campaigns', 48000, '2022-10-25'),
('Tariq Nadeem', 'tariq.nadeem@company.pk', 'Product Manager', 'Manages product development and lifecycle', 73000, '2021-12-14'),
('Hina Ali', 'hina.ali@company.pk', 'Software Engineer', 'Develops and maintains software applications', 61000, '2021-01-06'),
('Zain Aslam', 'zain.aslam@company.pk', 'Sales Manager', 'Leads and manages the sales team', 68000, '2021-05-15'),
('Adeel Raza', 'adeel.raza@company.pk', 'Data Analyst', 'Analyzes and interprets complex data', 61000, '2021-10-18'),
('Nashit Javed', 'nashit.javed@company.pk', 'UX/UI Designer', 'Designs user interfaces and user experiences', 53000, '2022-01-20'),
('Bilal Ahmed', 'bilal.ahmed@company.pk', 'HR Specialist', 'Manages hiring processes and employee relations', 55000, '2021-04-03'),
('Saima Tariq', 'saima.tariq@company.pk', 'Software Engineer', 'Develops and maintains software applications', 60000, '2020-02-17');

-- Populate Suppliers Table
INSERT INTO Suppliers (Name, ContactEmail, Phone, ProductCategory) VALUES
('Psi Enterprises', 'psi.enterprises@business.pk', '+92-3210820216', 'Automotive'),
('Sigma Industries', 'sigma.industries@example.pk', '+92-3335624036', 'Healthcare'),
('Psi Industries', 'psi.industries@enterprise.pk', '+92-3459425364', 'Toys'),
('Xi Industries', 'xi.industries@enterprise.pk', '+92-3517985418', 'Home Appliances'),
('Xi Enterprises', 'xi.enterprises@enterprise.pk', '+92-3008598062', 'Healthcare'),
('Gamma Industries', 'gamma.industries@example.pk', '+92-3003039273', 'Home Appliances'),
('Beta Supplies', 'beta.supplies@business.pk', '+92-3123614240', 'Healthcare'),
('Pi Ltd', 'pi.ltd@enterprise.pk', '+92-3217900503', 'Healthcare'),
('Eta Ltd', 'eta.ltd@trade.pk', '+92-3318196066', 'Stationery'),
('Mu Enterprises', 'mu.enterprises@trade.pk', '+92-3118879552', 'Healthcare'),
('Delta Enterprises', 'delta.enterprises@example.pk', '+92-3459469895', 'Toys'),
('Phi Ltd', 'phi.ltd@example.pk', '+92-3119615229', 'Clothing'),
('Gamma Enterprises', 'gamma.enterprises@trade.pk', '+92-3238610805', 'Clothing'),
('Pi Supplies', 'pi.supplies@example.pk', '+92-3001696232', 'Electronics'),
('Kappa Enterprises', 'kappa.enterprises@enterprise.pk', '+92-3334303649', 'Home Appliances'),
('Alpha Ltd', 'alpha.ltd@trade.pk', '+92-3027011790', 'Stationery'),
('Theta Industries', 'theta.industries@supplier.pk', '+92-3005331485', 'Food & Beverages'),
('Xi Supplies', 'xi.supplies@trade.pk', '+92-3366447482', 'Stationery'),
('Lambda Enterprises', 'lambda.enterprises@supplier.pk', '+92-3459387881', 'Healthcare'),
('Iota Industries', 'iota.industries@supplier.pk', '+92-3006240187', 'Automotive'),
('Sigma Enterprises', 'sigma.enterprises@example.pk', '+92-3311017742', 'Furniture'),
('Beta Supplies', 'beta.supplies@example.pk', '+92-3330903509', 'Electronics'),
('Theta Industries', 'theta.industries@trade.pk', '+92-3005453344', 'Automotive'),
('Beta Industries', 'beta.industries@supplier.pk', '+92-3453068826', 'Clothing');

-- populate inventory table

-- Populate Inventory Table
INSERT INTO Inventory (InventoryID, ProductID, WarehouseLocation, Quantity) VALUES
(1, 1, 'Karachi Warehouse A', 150),
(2, 2, 'Lahore Warehouse B', 200),
(3, 3, 'Karachi Warehouse A', 120),
(4, 4, 'Islamabad Warehouse C', 180),
(5, 5, 'Karachi Warehouse B', 80),
(6, 6, 'Lahore Warehouse A', 60),
(7, 7, 'Islamabad Warehouse A', 140),
(8, 8, 'Karachi Warehouse C', 200),
(9, 9, 'Lahore Warehouse B', 170),
(10, 10, 'Karachi Warehouse A', 90),
(11, 11, 'Karachi Warehouse B', 220),
(12, 12, 'Islamabad Warehouse A', 50),
(13, 13, 'Lahore Warehouse C', 130),
(14, 14, 'Karachi Warehouse A', 110),
(15, 15, 'Karachi Warehouse C', 95),
(16, 16, 'Islamabad Warehouse B', 140),
(17, 17, 'Lahore Warehouse B', 160),
(18, 18, 'Karachi Warehouse A', 180),
(19, 19, 'Islamabad Warehouse C', 50),
(20, 20, 'Karachi Warehouse B', 100),
(21, 21, 'Lahore Warehouse A', 60),
(22, 22, 'Karachi Warehouse A', 220),
(23, 23, 'Islamabad Warehouse B', 180),
(24, 24, 'Lahore Warehouse A', 150),
(25, 25, 'Karachi Warehouse C', 120),
(26, 26, 'Islamabad Warehouse A', 200),
(27, 27, 'Karachi Warehouse B', 180),
(28, 28, 'Lahore Warehouse B', 170),
(29, 29, 'Karachi Warehouse C', 160),
(30, 30, 'Islamabad Warehouse A', 90),
(31, 31, 'Karachi Warehouse B', 200),
(32, 32, 'Lahore Warehouse C', 110),
(33, 33, 'Karachi Warehouse A', 130),
(34, 34, 'Islamabad Warehouse C', 180),
(35, 35, 'Karachi Warehouse A', 150),
(36, 36, 'Lahore Warehouse A', 200),
(37, 37, 'Karachi Warehouse B', 90),
(38, 38, 'Islamabad Warehouse A', 180),
(39, 39, 'Karachi Warehouse C', 50),
(40, 40, 'Lahore Warehouse B', 140),
(41, 41, 'Karachi Warehouse A', 120),
(42, 42, 'Islamabad Warehouse B', 100),
(43, 43, 'Karachi Warehouse C', 220),
(44, 44, 'Lahore Warehouse A', 180),
(45, 45, 'Karachi Warehouse A', 150),
(46, 46, 'Islamabad Warehouse C', 170),
(47, 47, 'Karachi Warehouse B', 60),
(48, 48, 'Lahore Warehouse C', 140),
(49, 49, 'Karachi Warehouse A', 120),
(50, 50, 'Islamabad Warehouse A', 180),
(51, 1, 'Karachi Warehouse A', 50),
(52, 2, 'Lahore Warehouse B', 200),
(53, 3, 'Karachi Warehouse C', 80),
(54, 4, 'Islamabad Warehouse A', 170),
(55, 5, 'Karachi Warehouse B', 150),
(56, 6, 'Lahore Warehouse C', 60),
(57, 7, 'Karachi Warehouse A', 90),
(58, 8, 'Lahore Warehouse B', 180),
(59, 9, 'Islamabad Warehouse B', 100),
(60, 10, 'Karachi Warehouse C', 120),
(61, 11, 'Islamabad Warehouse A', 60),
(62, 12, 'Karachi Warehouse B', 130),
(63, 13, 'Lahore Warehouse A', 110),
(64, 14, 'Karachi Warehouse C', 180),
(65, 15, 'Islamabad Warehouse A', 100),
(66, 16, 'Karachi Warehouse B', 150),
(67, 17, 'Lahore Warehouse B', 220),
(68, 18, 'Islamabad Warehouse C', 80),
(69, 19, 'Karachi Warehouse A', 140),
(70, 20, 'Lahore Warehouse C', 60),
(71, 21, 'Karachi Warehouse B', 150),
(72, 22, 'Lahore Warehouse A', 130),
(73, 23, 'Karachi Warehouse C', 140),
(74, 24, 'Islamabad Warehouse B', 180),
(75, 25, 'Karachi Warehouse A', 100),
(76, 26, 'Lahore Warehouse C', 160),
(77, 27, 'Karachi Warehouse B', 180),
(78, 28, 'Islamabad Warehouse A', 50),
(79, 29, 'Karachi Warehouse C', 130),
(80, 30, 'Lahore Warehouse B', 100),
(81, 31, 'Karachi Warehouse A', 120),
(82, 32, 'Islamabad Warehouse B', 150),
(83, 33, 'Karachi Warehouse C', 140),
(84, 34, 'Lahore Warehouse A', 180),
(85, 35, 'Karachi Warehouse B', 120),
(86, 36, 'Islamabad Warehouse A', 130),
(87, 37, 'Lahore Warehouse B', 100),
(88, 38, 'Karachi Warehouse C', 160),
(89, 39, 'Islamabad Warehouse B', 200),
(90, 40, 'Karachi Warehouse A', 140),
(91, 41, 'Lahore Warehouse C', 180),
(92, 42, 'Karachi Warehouse B', 150),
(93, 43, 'Islamabad Warehouse A', 130),
(94, 44, 'Karachi Warehouse A', 220),
(95, 45, 'Lahore Warehouse B', 60),
(96, 46, 'Islamabad Warehouse C', 180),
(97, 47, 'Karachi Warehouse A', 150),
(98, 48, 'Lahore Warehouse A', 120),
(99, 49, 'Karachi Warehouse C', 100),
(100, 50, 'Islamabad Warehouse A', 90);

-- Populate SalesPerformance Table
INSERT INTO SalesPerformance (Year, TotalSalesAmount, NumberOfSales, UniqueCustomers, TopSellingProductID, TotalProductsSold, InventoryTurnoverRate) VALUES
(2018, 1000000.00, 800, 500, 3, 3000, 1.20),  -- Year 2018: Initial phase of the business
(2019, 650000.00, 600, 400, 5, 2500, 1.00),  -- Year 2019: Decline due to market challenges
(2020, 1200000.00, 1000, 600, 7, 3500, 1.10),  -- Year 2020: Slight rise after recovery
(2021, 1300000.00, 1100, 700, 9, 4000, 1.30),  -- Year 2021: Gradual increase after pandemic
(2022, 2200000.00, 1800, 1200, 12, 6000, 1.50),  -- Year 2022: Stable rise with growing market share
(2023, 3500000.00, 2800, 1800, 18, 9000, 1.75),  -- Year 2023: Significant growth with expanding offerings
(2024, 5000000.00, 4000, 2500, 20, 12000, 2.00);  -- Year 2024: Peak performance with continued success





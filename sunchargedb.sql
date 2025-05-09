CREATE DATABASE SunChargedb
USE sunchargedb

-- 1. Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(300),
    RegistrationDate DATE
);

INSERT INTO Customers (FirstName, LastName, PhoneNumber, email, address, RegistrationDate)
VALUES 
('Sibongakonke', 'Sotywambe', '27734765893', 'sboshsotywanbe@gmail.com', '123 Solar St, Sunnytown', '2025-02-10'),
('Bob', 'Smith', '9876543210', 'bob.smith@example.com', '456 Eco Ave, Greencity', '2024-02-15'),
('Clara', 'Nguyen', '5551234567', 'clara.n@example.com', '789 Renewable Rd, Solartown', '2024-03-20'),
('David', 'Lee', '6667778888', 'david.lee@example.com', '321 Eco Blvd, Sunville', '2024-04-05'),
('Ella', 'Martinez', '4443332222', 'ella.m@example.com', '654 Windy Way, Greentown', '2024-05-01');
select * FROM Customers


-- 2. Services
CREATE TABLE Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
     EstimatedDuration INT NOT NULL, -- duration in minutes (or your preferred unit)
    ServiceType ENUM('Repair', 'Installation', 'Maintenance', 'Consultation') NOT NULL
);
INSERT INTO Services (ServiceName, Description, Price, EstimatedDuration, ServiceType)
VALUES 
('Solar Panel Installation', 'Installation of solar panels.', 5000.00, 240, 'Installation'),
('System Maintenance', 'Routine check-up and cleaning.', 300.00, 90, 'Maintenance'),
('Inverter Repair', 'Fixing faulty inverters.', 150.00, 120, 'Repair'),
('Consultation', 'Energy consultation service.', 100.00, 60, 'Consultation'),
('Battery Installation', 'Installing solar storage batteries.', 1200.00, 180, 'Installation');
SELECT * FROM Services

-- 3. Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role VARCHAR(100),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100),
    StartDate DATE,
    TrainingCompletionDate DATE
);
INSERT INTO Staff (FirstName, LastName, Role, ContactNumber, Email, StartDate, TrainingCompletionDate)
VALUES 
('Thulisile', 'Wilson', 'Technician', '5551112222', 'emma.w@solarco.com', '2023-11-01', '2023-12-01'),
('Sibusiso', 'Brown', 'Installer', '5553334444', 'liam.b@solarco.com', '2023-10-15', '2023-11-15'),
('Lusanda', 'Taylor', 'Consultant', '5556667777', 'noah.t@solarco.com', '2024-01-01', '2024-01-20'),
('Thembelihle', 'Davis', 'Technician', '5558889999', 'olivia.d@solarco.com', '2023-09-10', '2023-10-10'),
('Khethukuthula', 'Clark', 'Installer', '5550001234', 'mason.c@solarco.com', '2023-12-01', '2023-12-20');
SELECT * FROM Staff

-- 4. Employees (Employees are a subset or role of Staff)
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    StaffID INT UNIQUE NOT NULL,
    Role VARCHAR(100),
    Skills TEXT,
    responsibilities TEXT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Employees (StaffID, Role, Skills, responsibilities)
VALUES 
(1, 'Technician', 'Diagnostics, Repairs', 'Maintain and troubleshoot systems'),
(2, 'Installer', 'Panel Installation, Safety Compliance', 'Install solar panels on rooftops'),
(3, 'Consultant', 'Energy Audits, Customer Engagement', 'Provide consultation on solar adoption'),
(4, 'Technician', 'Electrical Systems, Maintenance', 'Conduct repairs and maintenance'),
(5, 'Installer', 'Mounting, Wiring', 'Install panels and batteries');
SELECT * FROM Employees 

-- 5. Suppliers 
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(150) NOT NULL,
    ContactPerson VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Notes TEXT
);
INSERT INTO Suppliers (SupplierName, ContactPerson, PhoneNumber, Email, Address, Notes)
VALUES 
('Green Energy Supplies', 'Carlos Vega', '4445556666', 'contact@greenenergy.com', '789 Supplier Rd, Energystone', 'Preferred inverter supplier'),
('SunTech Co.', 'Linda Ray', '5552223333', 'linda.r@suntech.com', '456 PV Dr, Solartown', 'Panel supplier'),
('EcoParts Inc.', 'Marty Flynn', '6667778888', 'marty.f@ecoparts.com', '321 Parts Ln, Mechanicsville', 'Battery and parts'),
('VoltPower', 'Sam O\'Neil', '7778889999', 'sam@voltpower.com', '654 Charge St, Sparkcity', 'Backup batteries'),
('SolarMount Ltd.', 'Anita Green', '8889990000', 'anita.g@solarmount.com', '159 Rack Dr, Mountville', 'Mounting systems');
SELECT * FROM Suppliers

-- 6. Inventory
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(150) NOT NULL,
    ItemDescription TEXT,
    SupplierID INT NOT NULL,
    QuantityInStock INT DEFAULT 0,
    PurchaseDate DATE,
    CostPerUnit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE RESTRICT
);
INSERT INTO Inventory (ItemName, ItemDescription, SupplierID, QuantityInStock, PurchaseDate, CostPerUnit)
VALUES 
('300W Solar Panel', 'High-efficiency monocrystalline panel', 2, 100, '2024-03-01', 250.00),
('5kW Inverter', 'Grid-tie inverter', 1, 40, '2024-03-05', 800.00),
('Battery Pack 10kWh', 'Lithium-ion storage battery', 3, 20, '2024-03-15', 1200.00),
('Mounting Kit', 'Roof mounting equipment', 5, 50, '2024-03-10', 150.00),
('Backup Battery 5kWh', 'Compact lithium storage backup', 4, 30, '2024-03-25', 900.00);
SELECT * FROM Inventory 


-- 7. Equipment
CREATE TABLE Equipment (
    equipmentID INT AUTO_INCREMENT PRIMARY KEY,
    EquipmentType VARCHAR(100) NOT NULL,
    ModelNumber VARCHAR(100),
    SerialNumber VARCHAR(100) UNIQUE,
    PurchaseDate DATE,
    WarrantyExpiryDate DATE,
    Status ENUM('In Use', 'In Maintenance', 'Out of Service', 'Retired') DEFAULT 'In Use',
    LastMaintenanceDate DATE
);
INSERT INTO Equipment (EquipmentType, ModelNumber, SerialNumber, PurchaseDate, WarrantyExpiryDate, Status, LastMaintenanceDate)
VALUES 
('Ladder', 'LDX-10', 'SN-LAD-0001', '2023-12-01', '2026-12-01', 'In Use', '2024-04-01'),
('Drill Kit', 'DK-500', 'SN-DRL-0010', '2024-01-20', '2025-01-20', 'In Maintenance', '2024-05-01'),
('Safety Harness', 'SH-200', 'SN-HAR-0020', '2024-02-10', '2026-02-10', 'In Use', '2024-04-15'),
('Toolbox', 'TB-100', 'SN-TBX-0030', '2023-11-25', '2025-11-25', 'Out of Service', '2024-01-15'),
('Cordless Grinder', 'CG-900', 'SN-GRD-0040', '2024-03-01', '2025-03-01', 'In Use', '2024-04-10');
SELECT * FROM Equipment


-- 8. Transactions
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ServiceID INT NOT NULL,
    EmployeeID INT NULL,
    DateTime DATETIME NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50),
    Location VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO Transactions (CustomerID, ServiceID, EmployeeID, DateTime, AmountPaid, PaymentMethod, Location)
VALUES 
(1, 1, 2, '2024-04-10 10:00:00', 5000.00, 'Credit Card', '123 Solar St, Sunnytown'),
(2, 2, 1, '2024-04-20 11:30:00', 300.00, 'Cash', '456 Eco Ave, Greencity'),
(3, 5, 5, '2024-04-25 14:00:00', 1200.00, 'Wire Transfer', '789 Renewable Rd, Solartown'),
(4, 3, 4, '2024-05-01 09:00:00', 150.00, 'Credit Card', '321 Eco Blvd, Sunville'),
(5, 4, 3, '2024-05-05 15:00:00', 100.00, 'Cash', '654 Windy Way, Greentown');
SELECT * FROM Transactions

-- 9. MaintenanceLogs
CREATE TABLE MaintenanceLogs (
    MaintenanceID INT AUTO_INCREMENT PRIMARY KEY,
    EquipmentID INT NOT NULL,
    EmployeeID INT NULL,
    Date DATE NOT NULL,
    DescriptionOfWork TEXT,
    PartsUsed TEXT,
    Cost DECIMAL(10,2),
    NextScheduledMaintenanceDate DATE NOT NULL,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO MaintenanceLogs (EquipmentID, EmployeeID, Date, DescriptionOfWork, PartsUsed, Cost, NextScheduledMaintenanceDate)
VALUES 
(1, 1, '2024-04-01', 'Ladder inspection', 'None', 0.00, '2024-07-01'),
(2, 2, '2024-05-01', 'Replaced drill bits and lubricated parts', 'Drill bits', 50.00, '2024-08-01'),
(3, 3, '2024-04-15', 'Strap replacement', 'Harness strap', 30.00, '2024-07-15'),
(4, 4, '2024-01-15', 'Handle repair', 'Handle', 20.00, '2024-04-15'),
(5, 5, '2024-04-10', 'Battery check', 'Brushes', 25.00, '2024-07-10');
SELECT * FROM MaintenanceLogs

-- 10. SolarInstallations
CREATE TABLE SolarInstallations (
    InstallationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NULL, -- installer
    InstallationDate DATE NOT NULL,
    NumberOfPanels INT NOT NULL,
    PanelType VARCHAR(100),
    Location VARCHAR(150),
    Notes TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE
); 
INSERT INTO SolarInstallations (CustomerID, EmployeeID, InstallationDate, NumberOfPanels, PanelType, Location, Notes)
VALUES 
(1, 2, '2024-04-10', 12, 'Monocrystalline 300W', '123 Solar St, Sunnytown', 'South-facing rooftop'),
(2, 5, '2024-04-18', 10, 'Polycrystalline 250W', '456 Eco Ave, Greencity', 'Flat roof installation'),
(3, 2, '2024-04-25', 14, 'Monocrystalline 300W', '789 Renewable Rd, Solartown', 'Garage-mounted'),
(4, 5, '2024-05-02', 8, 'Thin-film 200W', '321 Eco Blvd, Sunville', 'Carport system'),
(5, 2, '2024-05-07', 16, 'Monocrystalline 350W', '654 Windy Way, Greentown', 'High-efficiency system');
SELECT * FROM SolarInstallations
SHOW TABLES

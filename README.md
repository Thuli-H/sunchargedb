# SunChargeDB

## Description

SunChargeDB is a database made using MySQL to help manage a solar energy company. It keeps track of important information like customers, the services the company offers, staff members, suppliers, inventory, equipment, sales transactions, maintenance jobs, and solar panel installations.

This database helps the company organize all its data in one place so that it is easy to find and use. It saves time when looking for information about customers or services and helps the company keep everything running smoothly.

The database has many tables that store different types of information. These tables are connected to each other using relationships. For example:

- The **Customers** table stores information about people who buy services or products.
- The **Services** table lists all the solar-related services that the company offers.
- The **Staff** table holds details about employees who work for the company.
- The **Employees** table is linked to the Staff table and gives more specific information about each staff member’s role and skills.
- The **Suppliers** table has information about companies that provide parts and equipment.
- The **Inventory** table tracks the items supplied and their quantities.
- The **Equipment** table records tools and machines used by the company.
- The **Transactions** table connects customers, services, and employees to record each sale or job done.
- The **MaintenanceLogs** table keeps track of maintenance work done on equipment by employees.
- The **SolarInstallations** table records details about solar panel installations done for customers by employees.

These tables relate to each other through keys. For example, the **CustomerID** in the Customers table is used in the Transactions and SolarInstallations tables to show which customer bought a service or had an installation. Similarly, **EmployeeID** links staff to the work they do in transactions, maintenance, and installations.

By organizing data with these connections, the database makes it easier to manage the business. It helps the company see who did what work, what services were sold, what equipment needs maintenance, and who supplied the parts.

Overall, SunChargeDB is designed to keep all important information connected and easy to access, helping the solar energy company work better and serve customers more efficiently.
HOW TO SETUP: 
1. First, create the database and select it in your MySQL system: sql
   CREATE DATABASE SunChargeDB;
   USE SunChargeDB;
Then, run the full SQL script that creates all the tables and inserts sample data.
After running the script, you can check if everything is set up correctly by running queries

Screenshot or link to your ERD
lINK: https://drive.google.com/file/d/1XU9N-Glq3ggvulqsns356Wfq_PGPIqtF/view?usp=sharinG 
![Screenshot 2025-05-09 090144](https://github.com/user-attachments/assets/96fc9d5b-b300-47e4-a314-8355bcd762c6)
![image](https://github.com/user-attachments/assets/a67d2281-1098-4e17-8659-84a0b201dd61)


# Programming-in-SQL
Programs created for the class Programming in SQL

## Lesson 1: Introduction to Relational Database Concepts and SQL Server Management Studio
**Objectives:**
* Introduction to SQL Server 2012 DBMS
* Summary of SQL Server 2012 tools

**Scripts:**
* SqlCh2ex8
 * SELECT statement that returns the column ProductName
* SqlCh2ex10
 * SELECT statement that returns the count of the number of products

## Lesson 2: Retrieving Data from a Single Tables and Multiple Tables
**Objectives:**
* Code and run SELECT statements that use any of the language elements presented in this chapter
* Use the explicit syntax to code an inner join that returns data from a single table or multiple tables
* Code a union that combines data from a single table or multiple tables.

**Scripts:**
* SqlCh3ex1
 * SELECT statement that returns four columns from the Products table
* SqlCh3ex2
 * SELECT statement that returns one column from the Customers table that joins the LastName and FirstName columns
 * Returns only contacts whose last name begins with letters from M to Z
* SqlCh3ex3
  * SELECT statement that returns only the rows with a list price that's greater than 500 and less than 2000
* SqlCh3ex4
 * SELECT statement that returns three columns from the Products table and two calculated columns
* SqlCh3ex5
 * SELECT statement that returns four columns from the OrderItems table and three calculated columns
* SqlCh3ex6
 * SELECT statement that returns three columns from the Orders table where the ShipDate column contains a null value
* SqlCh3ex7
 * SELECT statement that creates four columns without a FROM clause
* SqlCh4ex1
 *  SELECT statement that joins the Categories table to the Products table and returns three columns
* SqlCh4ex2
 *  SELECT statement that joins the Customers table to the Addresses table and returns six columns
 *  Returns one row for each address for the customer with an email address of allan.sherwood@yahoo.com
* SqlCh4ex3
 *  SELECT statement that joins the Customers table to the Addresses table and returns six columns
 *  Returns one row for each customer, but only returns addresses that are the shipping address for a customer
* SqlCh4ex4
 *  SELECT statement that joins the Customers, Orders, OrderItems, and Products tables
* SqlCh4ex5
 *  SELECT statement that returns the ProductName and ListPrice columns from the Products table
 *  Returns one row for each product that has the same list price as another product
* SqlCh4ex6
 *  SELECT statement that returns two columns from the Categories and Products tables
 *  Returns one row for each category that has never been used
* SqlCh4ex7
 * Uses the UNION operator to generate a result set consisting of three columns from the Orders table
 * If the order has a value in the ShipDate column, the ShipStatus column should contain a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED
 
## Lesson 3: Summary Queries and Sub-Queries
**Objectives:**
* Code SELECT statements that require any of the language elements presented in this chapter
* Code SELECT statements that use common table expressions (CTEs) to define the subqueries

**Scripts:**
* SqlCh2ex8
 * SELECT statement that returns the column ProductName
* SqlCh2ex10
 * SELECT statement that returns the count of the number of products

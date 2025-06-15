## 1. PostgresSQL
PostgreSQL is a modern, open-source, powerful, object-relational database system. Postgers is popular for its scalability, relianility and feature-rich SQL compliance amongst the developer community.

## 2. Primary Key and Foreign Key

**Primary Key:**  A primary key is a unique key in a table that identifies each row of the database table. Its values must be unique and not null.
**Foreign Key:** A foreign key is a column in a table that refers to the primary key of another table. It serves as a medium of interconnection between the two tables. However, a foreign key does not have to be the primary key in its own table.

## 3. VARCHAR and CHAR

**VARCHAR** is a variable-length data type that stores only the actual characters entered. **VARCHAR** is more space-efficient and ideal for storing data with variying lengths.
  -Exaxmple: 
  ```
    VARCHAR(12) PostgrSQL --> 'PostgreSQL'
  ```

**CHAR** is a fixed-length data type that always stores a set number of characters, and if the input is shorter than the specified length, it automatically pads the remaining space with blank spaces.
  -Exaxmple: 
  ```
    CHAR(12) -> PostgrSQL --> 'PostgreSQL  '
  ```

## 4. The purpose of the WHERE clause in a SELECT statement
The **WHERE** clause in a **SELECT** statement is used to filter records from a table on specified-conditions. It helps retrieve only the rows that meet the given citeria, instead of returning all the rows in the table.
  -Exaxmple: 
  ```
    SELECT * FROM employees
    WHERE department = 'HR';
  ```

## 5. The purpose of the LIMIT and OFFSET clause
The **LIMIT** clause is used to specify the maximum number of the ouputs to return in query.
The **OFFSET** cluase is used to skip a specified number of rows before starting to return the results.
These **LIMIT** and **OFFSET** cluase usually used to bullt the pagination logic from backend.
  ```
    SELECT * FROM products
    LIMIT 10 OFFSET 10;
  ```

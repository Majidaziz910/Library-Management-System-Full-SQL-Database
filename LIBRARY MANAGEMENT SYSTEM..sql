-- LIBRARY MANAGEMENT SYSTEM PROJECT

CREATE DATABASE IF NOT EXISTS PROJECT_2;
USE PROJECT_2;

-- 2. Branch Table
CREATE TABLE BRANCH (
    branch_id VARCHAR(20) PRIMARY KEY,
    manager_id VARCHAR(20),
    branch_address VARCHAR(50),
    contact_no VARCHAR(20)
);

-- 3. Employees Table
CREATE TABLE EMPLOYEES ( 
    emp_id VARCHAR(20) PRIMARY KEY,
    emp_name VARCHAR(25),
    position VARCHAR(25),
    salary FLOAT,
    branch_id VARCHAR(20)
);

-- 4. Books Table
CREATE TABLE BOOKS (
    isbn VARCHAR(25) PRIMARY KEY,
    book_title VARCHAR(75),
    category VARCHAR(30),
    rental_price FLOAT,
    status VARCHAR(15),
    author VARCHAR(35),
    publisher VARCHAR(55)
);

-- 5. 
CREATE TABLE MEMEBER (
    member_id VARCHAR(25) PRIMARY KEY, -- Size match karne ke liye barha diya
    member_name VARCHAR(25),
    member_address VARCHAR(50),
    reg_date DATE
);

-- 6. Issued Status Table
CREATE TABLE ISSUED_STATUS (
    issued_id VARCHAR(20) PRIMARY KEY,
    issued_member_id VARCHAR(25), -- FK: Iska size Member table ke member_id jaisa hona chahiye
    issued_book_name VARCHAR(75),
    issued_date DATE,
    issued_book_isbn VARCHAR(25), -- FK: Iska size Books table ke isbn jaisa hona chahiye
    issued_emp_id VARCHAR(20)      -- FK: Iska size Employees table ke emp_id jaisa hona chahiye
);

-- 7. Return Status Table
CREATE TABLE RETURN_STATUS (
    return_id VARCHAR(20) PRIMARY KEY,
    issued_id VARCHAR(20),
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(25) -- Iska size bhi matching hona chahiye
);


-- Member link
ALTER TABLE ISSUED_STATUS
ADD CONSTRAINT fk_memeber
FOREIGN KEY (issued_member_id)
REFERENCES MEMEBER(member_id);

-- Books link
ALTER TABLE ISSUED_STATUS
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES BOOKS(isbn);

-- Employees link
ALTER TABLE ISSUED_STATUS
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES EMPLOYEES(emp_id);

ALTER TABLE EMPLOYEES
ADD CONSTRAINT fk_BRANCH
FOREIGN KEY (branch_id)
REFERENCES BRANCH(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);


USE PROJECT_2;
ALTER TABLE RETURN_STATUS 
MODIFY COLUMN return_book_name VARCHAR(100),
MODIFY COLUMN return_book_isbn VARCHAR(25);
TRUNCATE TABLE RETURN_STATUS;

USE PROJECT_2;
TRUNCATE TABLE RETURN_STATUS;
ALTER TABLE RETURN_STATUS 
MODIFY COLUMN return_book_name VARCHAR(255),
MODIFY COLUMN return_book_isbn VARCHAR(50),
MODIFY COLUMN issued_id VARCHAR(50);

USE PROJECT_2;
TRUNCATE TABLE RETURN_STATUS;
ALTER TABLE RETURN_STATUS 
MODIFY COLUMN return_book_name VARCHAR(100),
MODIFY COLUMN return_book_isbn VARCHAR(50);




-- ## INSER DATA RETURN STATUS

USE PROJECT_2;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO RETURN_STATUS (return_id, issued_id, return_book_name, return_date, return_book_isbn)
VALUES
('RS101','IS101',NULL,'2023-06-06',NULL),
('RS102','IS105',NULL,'2023-07-06',NULL),
('RS103','IS103',NULL,'2023-07-08',NULL),
('RS104','IS106',NULL,'2024-01-05',NULL),
('RS105','IS107',NULL,'2024-03-05',NULL),
('RS106','IS108',NULL,'2024-05-05',NULL),
('RS107','IS109',NULL,'2024-07-05',NULL),
('RS108','IS110',NULL,'2024-09-05',NULL),
('RS109','IS111',NULL,'2024-11-05',NULL),
('RS110','IS112',NULL,'2024-05-13',NULL),
('RS111','IS113',NULL,'2024-05-15',NULL),
('RS112','IS114',NULL,'2024-05-17',NULL),
('RS113','IS115',NULL,'2024-05-19',NULL),
('RS114','IS116',NULL,'2024-05-21',NULL),
('RS115','IS117',NULL,'2024-05-23',NULL),
('RS116','IS118',NULL,'2024-05-25',NULL),
('RS117','IS119',NULL,'2024-05-27',NULL),
('RS118','IS120',NULL,'2024-05-29',NULL);
SET FOREIGN_KEY_CHECKS = 1;




-- ## NSERT DATA ISSUED DATA

USE PROJECT_2;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO ISSUED_STATUS (issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
VALUES
('IS106','C106','Animal Farm','2024-03-10','978-0-330-25864-8','E104'),
('IS107','C107','One Hundred Years of Solitude','2024-03-11','978-0-14-118776-1','E104'),
('IS108','C108','The Great Gatsby','2024-03-12','978-0-525-47535-5','E104'),
('IS109','C109','Jane Eyre','2024-03-13','978-0-141-44171-6','E105'),
('IS110','C110','The Alchemist','2024-03-14','978-0-307-37840-1','E105'),
('IS111','C109','Harry Potter and the Sorcerers Stone','2024-03-15','978-0-679-76489-8','E105'),
('IS112','C109','A Game of Thrones','2024-03-16','978-0-09-957807-9','E106'),
('IS113','C109','A Peoples History of the United States','2024-03-17','978-0-393-05081-8','E106'),
('IS114','C109','The Guns of August','2024-03-18','978-0-19-280551-1','E106'),
('IS115','C109','The Histories','2024-03-19','978-0-14-044930-3','E107'),
('IS116','C110','Guns, Germs, and Steel: The Fates of Human Societies','2024-03-20','978-0-393-91257-8','E107'),
('IS117','C110','1984','2024-03-21','978-0-679-64115-3','E107'),
('IS118','C101','Pride and Prejudice','2024-03-22','978-0-14-143951-8','E108'),
('IS119','C110','Brave New World','2024-03-23','978-0-452-28240-7','E108'),
('IS120','C110','The Road','2024-03-24','978-0-670-81302-4','E108'),
('IS121','C102','The Shining','2024-03-25','978-0-385-33312-0','E109'),
('IS122','C102','Fahrenheit 451','2024-03-26','978-0-451-52993-5','E109'),
('IS123','C103','Dune','2024-03-27','978-0-345-39180-3','E109'),
('IS124','C104','Where the Wild Things Are','2024-03-28','978-0-06-025492-6','E110'),
('IS125','C105','The Kite Runner','2024-03-29','978-0-06-112241-5','E110'),
('IS126','C105','Charlottes Web','2024-03-30','978-0-06-440055-8','E110'),
('IS127','C105','Beloved','2024-03-31','978-0-679-77644-3','E110'),
('IS128','C105','A Tale of Two Cities','2024-04-01','978-0-14-027526-3','E110'),
('IS129','C105','The Stand','2024-04-02','978-0-7434-7679-3','E110'),
('IS130','C106','Moby Dick','2024-04-03','978-0-451-52994-2','E101'),
('IS131','C106','To Kill a Mockingbird','2024-04-04','978-0-06-112008-4','E101'),
('IS132','C106','The Hobbit','2024-04-05','978-0-7432-7356-4','E106'),
('IS133','C107','Angels & Demons','2024-04-06','978-0-7432-4722-5','E106'),
('IS134','C107','The Diary of a Young Girl','2024-04-07','978-0-375-41398-8','E106'),
('IS135','C107','Sapiens: A Brief History of Humankind','2024-04-08','978-0-307-58837-1','E108'),
('IS136','C107','1491: New Revelations of the Americas Before Columbus','2024-04-09','978-0-7432-7357-1','E102'),
('IS137','C107','The Catcher in the Rye','2024-04-10','978-0-553-29698-2','E103'),
('IS138','C108','The Great Gatsby','2024-04-11','978-0-525-47535-5','E104'),
('IS139','C109','Harry Potter and the Sorcerers Stone','2024-04-12','978-0-679-76489-8','E105'),
('IS140','C110','Animal Farm','2024-04-13','978-0-330-25864-8','E102');
SET FOREIGN_KEY_CHECKS = 1;


-- CHECK THE TABLE COLUMN
SELECT * FROM RETURN_STATUS LIMIT 10;
SELECT * FROM BOOKS LIMIT 10;
SELECT * FROM MEMEBER LIMIT 10;
SELECT * FROM BRANCH LIMIT 10;
SELECT * FROM EMPLOYEES LIMIT 10;
SELECT * FROM ISSUED_STATUS LIMIT 10;


-- Task 1-3: CRUD Operations (Basic)
-- TASK 2 ADD NEW BOOK
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');


-- Task 2: Update an Existing Member's Address
UPDATE memeber 
SET member_address = '123 New Street, NY' 
WHERE member_id = 'C101';


-- Task 3: Delete a Record from the Issued Status Table
DELETE FROM issued_status 
WHERE issued_id = 'IS104';


-- Task 4: Retrieve All Books Issued by a Specific Employee
SELECT * FROM issued_status 
WHERE issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book
SELECT issued_member_id, COUNT(*) as total_books_issued
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(*) > 1;


-- 2. CTAS (Create Table As Select)
-- Task 6: Create Summary Table of Book Issue Counts
CREATE TABLE book_issue_summary AS
SELECT b.book_title, COUNT(ist.issued_id) as total_issue_count
FROM books b
LEFT JOIN issued_status ist ON b.isbn = ist.issued_book_isbn
GROUP BY b.book_title;

-- 3. Data Analysis & Findings
-- Task 7: Retrieve All Books in a Specific Category (e.g., 'Classic')
SELECT * FROM books 
WHERE category = 'Classic';


-- Task 8: Find Total Rental Income by Category
SELECT b.category, SUM(b.rental_price) as total_income
FROM books b
JOIN issued_status ist ON b.isbn = ist.issued_book_isbn
GROUP BY b.category;


-- Task 9: List Members Who Registered in the Last 180 Days
SELECT * FROM memeber
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;


-- Task 10: List Employees with Their Branch Manager's Name
SELECT e1.emp_name as employee_name, b.branch_id, e2.emp_name as manager_name
FROM employees e1
JOIN branch b ON e1.branch_id = b.branch_id
JOIN employees e2 ON b.manager_id = e2.emp_id;


-- Task 11: Create a Table of Books with Rental Price Above $7.00
CREATE TABLE expensive_books AS
SELECT * FROM books 
WHERE rental_price > 7.00;


-- Task 12: Retrieve the List of Books Not Yet Returned
SELECT ist.* FROM issued_status ist
LEFT JOIN return_status rs ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL;


-- 4. Advanced SQL Operations
-- Task 13: Identify Members with Overdue Books (30-day limit)

SELECT m.member_name, b.book_title, ist.issued_date,
       DATEDIFF(CURRENT_DATE, ist.issued_date) - 30 as days_overdue
FROM issued_status ist
JOIN memeber m ON ist.issued_member_id = m.member_id
JOIN books b ON ist.issued_book_isbn = b.isbn
LEFT JOIN return_status rs ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL AND DATEDIFF(CURRENT_DATE, ist.issued_date) > 30;


-- Task 14: Update Book Status to "yes" on Return
UPDATE books 
SET status = 'yes'
WHERE isbn IN (SELECT return_book_isbn FROM return_status);


-- Task 15: Branch Performance Report
SELECT br.branch_id, 
       COUNT(ist.issued_id) as books_issued, 
       COUNT(rs.return_id) as books_returned,
       SUM(bk.rental_price) as total_revenue
FROM branch br
JOIN employees e ON br.branch_id = e.branch_id
JOIN issued_status ist ON e.emp_id = ist.issued_emp_id
JOIN books bk ON ist.issued_book_isbn = bk.isbn
LEFT JOIN return_status rs ON ist.issued_id = rs.issued_id
GROUP BY br.branch_id;


-- Task 19: Stored Procedure for Status Update
DELIMITER //
CREATE PROCEDURE Update_Book_Status(IN p_isbn VARCHAR(25), IN p_action VARCHAR(10))
BEGIN
    IF p_action = 'ISSUE' THEN
        UPDATE books SET status = 'no' WHERE isbn = p_isbn;
    ELSEIF p_action = 'RETURN' THEN
        UPDATE books SET status = 'yes' WHERE isbn = p_isbn;
    END IF;
END //
DELIMITER ;


-- Task 20: Overdue Summary and Fine Calculation ($0.50 per day)
CREATE TABLE member_fines_summary AS
SELECT m.member_id, 
       COUNT(ist.issued_id) as overdue_count,
       SUM(DATEDIFF(CURRENT_DATE, ist.issued_date + INTERVAL 30 DAY) * 0.50) as total_fine
FROM issued_status ist
JOIN memeber m ON ist.issued_member_id = m.member_id
LEFT JOIN return_status rs ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL AND DATEDIFF(CURRENT_DATE, ist.issued_date) > 30
GROUP BY m.member_id;

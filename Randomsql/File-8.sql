SELECT employee_name, department_name FROM employees NATURAL JOIN departments;
----
SELECT order_id, customer_name FROM orders NATURAL JOIN customers;
----
SELECT student_name, course_title FROM students NATURAL JOIN enrollments;
----
SELECT project_name, employee_name FROM projects NATURAL JOIN project_assignments;
----
SELECT invoice_id, product_name FROM invoices NATURAL JOIN products;
----
SELECT book_title, author_name FROM books NATURAL JOIN authors;
----
SELECT class_time, instructor_name FROM class_schedules NATURAL JOIN instructors;
----
SELECT supplier_name, product_name FROM suppliers NATURAL JOIN products;
----
SELECT order_id, shipping_address FROM orders NATURAL JOIN shipping;
----
SELECT employee_name, job_title FROM employees NATURAL JOIN jobs;
----
SELECT employee_name, department_name FROM employees JOIN departments USING(department_id);
----
SELECT order_id, customer_name FROM orders JOIN customers USING(customer_id);
----
SELECT product_name, supplier_name FROM products JOIN suppliers USING(supplier_id);
----
SELECT student_name, course_title FROM students JOIN enrollments USING(student_id);
----
SELECT invoice_id, product_name FROM invoices JOIN products USING(product_id);
----
SELECT project_name, employee_name FROM projects JOIN project_assignments USING(project_id);
----
SELECT author_name, book_title FROM authors JOIN books USING(author_id);
----
SELECT order_id, employee_name FROM sales_orders JOIN employees USING(employee_id);
----
SELECT schedule_time, instructor_name FROM course_schedules JOIN instructors USING(instructor_id);
----
SELECT transaction_id, account_holder_name FROM transactions JOIN accounts USING(account_id);
----
SELECT e.employee_name, m.employee_name AS manager_name FROM employees e JOIN employees m ON e.manager_id = m.employee_id;
----
SELECT c.name AS customer_name, e.name AS salesperson_name FROM customers c JOIN employees e ON c.salesperson_id = e.employee_id;
----
SELECT o.order_id, od.product_id FROM orders o JOIN order_details od USING(order_id);
----
SELECT s.name AS student_name, i.name AS instructor_name FROM students s JOIN instructors i ON s.instructor_id = i.instructor_id;
----
SELECT e.salary, d.budget FROM employees e JOIN departments d ON e.department_id = d.department_id;
----
SELECT p.name AS project_name, t.name AS task_name FROM projects p JOIN tasks t ON p.project_id = t.project_id;
----
SELECT c.exam_date AS course_exam_date, e.exam_date AS exam_date FROM courses c JOIN exams e ON c.course_id = e.course_id;
----
SELECT p.name AS product_name, c.name AS category_name FROM products p JOIN categories c ON p.category_id = c.category_id;
----
SELECT b.title AS book_title, p.name AS publisher_name FROM books b JOIN publishers p ON b.publisher_id = p.publisher_id;
----
SELECT e.employee_name, d.location AS department_location FROM employees e JOIN departments d ON e.department_id = d.department_id;


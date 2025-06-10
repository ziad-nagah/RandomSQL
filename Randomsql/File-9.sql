SELECT e.employee_name, d.department_name FROM employees e LEFT OUTER JOIN departments d ON e.department_id = d.department_id;
----
SELECT p.product_name, c.category_name FROM products p LEFT JOIN categories c ON p.category_id = c.category_id;
----
SELECT s.student_name, c.course_title FROM students s LEFT OUTER JOIN enrollments e ON s.student_id = e.student_id LEFT JOIN courses c ON e.course_id = c.course_id;
----
SELECT o.order_id, c.customer_name FROM orders o LEFT JOIN customers c ON o.customer_id = c.customer_id;
----
SELECT d.department_name, m.manager_name FROM departments d LEFT OUTER JOIN managers m ON d.manager_id = m.manager_id;
----
SELECT b.book_title, a.author_name FROM books b LEFT JOIN authors a ON b.author_id = a.author_id;
----
SELECT i.invoice_id, p.status FROM invoices i LEFT JOIN payments p ON i.payment_id = p.payment_id;
----
SELECT e.employee_name, p.project_name FROM employees e LEFT JOIN projects_assigned pa ON e.employee_id = pa.employee_id LEFT JOIN projects p ON pa.project_id = p.project_id;
----
SELECT e.employee_name, d.department_name FROM employees e RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;
----
SELECT o.order_id, c.customer_name FROM orders o RIGHT JOIN customers c ON o.customer_id = c.customer_id;
----
SELECT s.student_name, c.course_title FROM enrollments e RIGHT JOIN courses c ON e.course_id = c.course_id LEFT JOIN students s ON e.student_id = s.student_id;
----
SELECT e.employee_name, p.project_name FROM projects p RIGHT OUTER JOIN projects_assigned pa ON p.project_id = pa.project_id LEFT JOIN employees e ON pa.employee_id = e.employee_id;
----
SELECT pm.method_name, t.transaction_id FROM transactions t RIGHT JOIN payment_methods pm ON t.method_id = pm.method_id;
----
SELECT b.book_title, a.author_name FROM books b RIGHT OUTER JOIN authors a ON b.author_id = a.author_id;
----
SELECT p.product_name, c.category_name FROM products p RIGHT JOIN categories c ON p.category_id = c.category_id;
----
SELECT s.student_name, d.dorm_room FROM students s RIGHT OUTER JOIN dorms d ON s.dorm_id = d.dorm_id;
----
SELECT c.customer_name, o.order_id FROM customers c FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;
----
SELECT e.employee_name, p.project_name FROM employees e FULL OUTER JOIN projects_assigned pa ON e.employee_id = pa.employee_id FULL OUTER JOIN projects p ON pa.project_id = p.project_id;
----
SELECT p.product_name, s.supplier_name FROM products p FULL OUTER JOIN suppliers s ON p.supplier_id = s.supplier_id;
----
SELECT s.student_name, c.course_title FROM students s FULL OUTER JOIN enrollments e ON s.student_id = e.student_id FULL OUTER JOIN courses c ON e.course_id = c.course_id;
----
SELECT a.author_name, b.book_title FROM authors a FULL OUTER JOIN books b ON a.author_id = b.author_id;
----
SELECT e.employee_name, d.department_name FROM employees e FULL OUTER JOIN departments d ON e.department_id = d.department_id;
----
SELECT t.transaction_id, p.method_name FROM transactions t FULL OUTER JOIN payment_methods p ON t.method_id = p.method_id;
----
SELECT r1.customer_name, r2.customer_name FROM region1_customers r1 FULL OUTER JOIN region2_customers r2 ON r1.customer_id = r2.customer_id;
----
SELECT employee_name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
----
SELECT customer_name FROM customers WHERE customer_id = (SELECT customer_id FROM orders GROUP BY customer_id ORDER BY COUNT(*) DESC FETCH FIRST 1 ROWS ONLY);
----
SELECT product_name FROM products WHERE price > ANY (SELECT price FROM products WHERE category = 'Accessories');
----
SELECT employee_name FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE employee_name = 'John Smith');
----
SELECT order_id FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');
----
SELECT department_name FROM departments d WHERE NOT EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);
----
SELECT student_name FROM students s WHERE NOT EXISTS (SELECT 1 FROM enrollments e WHERE s.student_id = e.student_id);
----
SELECT MAX(salary) AS second_highest FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
----
SELECT product_name FROM products WHERE price > (SELECT AVG(price) FROM products);
----
SELECT customer_id FROM customers c WHERE NOT EXISTS (
  SELECT 1 FROM products p WHERE p.category = 'A' AND NOT EXISTS (
    SELECT 1 FROM orders o JOIN order_details od ON o.order_id = od.order_id 
    WHERE o.customer_id = c.customer_id AND od.product_id = p.product_id
  )
);
----
SELECT employee_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);
----
SELECT employee_name FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE employee_name = 'Alice');
----
SELECT * FROM products WHERE price = (SELECT MIN(price) FROM products);
----
SELECT department_name FROM departments WHERE department_id = (SELECT department_id FROM employees WHERE salary = (SELECT MAX(salary) FROM employees));
----
SELECT manager_name FROM employees WHERE employee_id = (SELECT manager_id FROM employees WHERE hire_date = (SELECT MAX(hire_date) FROM employees));
----
SELECT employee_name FROM employees WHERE salary = (SELECT AVG(salary) FROM employees);
----
SELECT * FROM orders WHERE order_date = (SELECT MIN(order_date) FROM orders);
----
SELECT employee_name, salary FROM employees WHERE salary > (SELECT salary FROM employees WHERE employee_id = 101);
----
SELECT student_name FROM students WHERE gpa = (SELECT gpa FROM students WHERE student_name = 'John Doe');
----
SELECT book_title FROM books WHERE price = (SELECT MAX(price) FROM books WHERE category = 'Science');
----
SELECT employee_name FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 10);
----
SELECT employee_name FROM employees WHERE salary < ALL (SELECT salary FROM employees WHERE department_id = 20);
----
SELECT product_name FROM products WHERE price IN (SELECT price FROM products WHERE category = 'Electronics');
----
SELECT customer_name FROM customers WHERE customer_id IN (
  SELECT o.customer_id FROM orders o 
  JOIN order_details od ON o.order_id = od.order_id 
  JOIN products p ON od.product_id = p.product_id 
  WHERE p.price > 1000
);
----
SELECT employee_name FROM employees WHERE job_title IN (
  SELECT job_title FROM employees GROUP BY job_title HAVING COUNT(*) > 1
);
----
SELECT department_name FROM departments WHERE department_id IN (
  SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 1
);
----
SELECT o.order_id FROM orders o WHERE EXISTS (
  SELECT 1 FROM customers c2 WHERE c2.city = (SELECT city FROM customers WHERE customers.customer_id = o.customer_id)
  AND c2.customer_id <> o.customer_id
);
----
SELECT book_title FROM books WHERE author_id IN (
  SELECT author_id FROM books GROUP BY author_id HAVING COUNT(*) > 1
);
----
SELECT student_name FROM students WHERE student_id IN (
  SELECT student_id FROM enrollments WHERE course_id IN (
    SELECT course_id FROM courses WHERE instructor = 'Dr. Smith'
  )
);
----
SELECT employee_name FROM employees WHERE salary IN (
  SELECT salary FROM employees WHERE department_id = 30
);

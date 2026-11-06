CREATE DATABASE IF NOT EXISTS library;
USE library;

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(8, 2) NOT NULL
);

INSERT INTO books (book_id, title, author, price) VALUES
    (1, 'Animal Farm', 'George Orwell', 450.00),
    (2, 'Pride and Prejudice', 'Jane Austen', 520.00),
    (3, 'The Hobbit', 'J. R. R. Tolkien', 750.00),
    (4, 'Frankenstein', 'Mary Shelley', 480.00),
    (5, 'Little Women', 'Louisa May Alcott', 500.00),
    (6, 'Jane Eyre', 'Charlotte Bronte', 620.00),
    (7, 'The Time Machine', 'H. G. Wells', 395.00),
    (8, 'Dracula', 'Bram Stoker', 680.00)
ON DUPLICATE KEY UPDATE book_id = books.book_id;

-- Find books priced strictly above 500.
SELECT book_id, title, author, price
FROM books
WHERE price > 500.00;

-- Sort from lowest to highest price.
SELECT book_id, title, author, price
FROM books
ORDER BY price ASC, book_id ASC;

SELECT COUNT(*) AS total_books
FROM books;

-- Change the price of one book using its primary key.
UPDATE books
SET price = 550.00
WHERE book_id = 2;

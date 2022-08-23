TRUNCATE TABLE books RESTART IDENTITY; 


INSERT INTO books (id, title, author_name) VALUES (1, 'Nineteen', 'Lorge');
INSERT INTO books (id, title, author_name) VALUES (2,'Go higher', 'Blake');

-- psql -h 127.0.0.1 book_store_test < book_store.sql   
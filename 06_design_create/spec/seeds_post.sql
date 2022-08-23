TRUNCATE TABLE accounts RESTART IDENTITY; 
TRUNCATE TABLE posts RESTART IDENTITY; 


INSERT INTO accounts (username, email_address) VALUES ('tyson', 'tyson10@gmail.com');
INSERT INTO posts (title, content, account_id) VALUES ('Fly','going there',1);
INSERT INTO posts (title, content, account_id) VALUES ('Slow', 'running here',2);
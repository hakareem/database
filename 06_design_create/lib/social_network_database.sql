DROP TABLE IF EXISTS "public"."posts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "title" text,
    "content" text,
    "account_id" int,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."accounts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS accounts_id_seq;

-- Table Definition
CREATE TABLE "public"."accounts" (
    "id" SERIAL,
    "username" text,
    "email_address" VARCHAR,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."accounts" (username, email_address) VALUES 
('Fury', 'fury99@gmail.com'),
('Surfer Rosa', 'rosa@gmail.com'),
('Waterloo', 'loo99@gmail.com');

INSERT INTO "public"."posts" (title, content, account_id) VALUES
('Wind', 'way too loud', 1),
('Rain', 'way too wet', 2),
('Sunny', 'way too hot', 3),
('Cloud', 'way too dull', 4);


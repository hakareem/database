# Two Tables Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.

```

```
Nouns:

account => username, email_address, 
posts => title, content, views
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| accounts               | username, email_address
| posts                 | title, content, views

1. Name of the first table (always plural): `accounts` 

    Column names: `username`, `email_address`

2. Name of the second table (always plural): `posts` 

    Column names: `title`, `content`, `views` 

## 3. Decide the column types.

```
# EXAMPLE:

Table: accounts
id: SERIAL
username: text
email_address: VARCHAR

Table: posts
id: SERIAL
title: text,
content: text,
views: int

```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [accounts] have many [posts]? (YES)
2. Can one [posts] have many [accounts]? (NO)

{posts forign key}



```
# EXAMPLE

-> An account HAS MANY posts
-> A post BELONGS TO an account

-> Therefore, the foreign key is on the post table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE


DROP TABLE IF EXISTS "public"."posts";

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "title" text,
    "content" text,
    "account_id" int,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."accounts";

CREATE SEQUENCE IF NOT EXISTS accounts_id_seq;

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


```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```


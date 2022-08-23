# Two Tables Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:

posts => title, content 
comments => name, content
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| posts                 | title, content
| comments              | name, content

1. Name of the first table (always plural): `posts` 

    Column names: `title`, `content`

2. Name of the second table (always plural): `comments` 

    Column names: `name`, `content`

## 3. Decide the column types.

```
# EXAMPLE:

Table: posts
id: SERIAL
title: text,
content: text

Table: comments
id: SERIAL
name: text,
content: text

```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [posts] have many [comments]? (Yes)
2. Can one [comments] have many [posts]? (No)

{comments forign key}



```
# EXAMPLE

-> A posts HAS MANY comments
-> A comment BELONGS TO a post

-> Therefore, the foreign key is on the comment table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE


CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
   name text,
   content text,
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
);
```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql

```


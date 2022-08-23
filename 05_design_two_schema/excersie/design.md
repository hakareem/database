# Two Tables Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.
```

```
Nouns:

students => name, 
cohorts => name, starting_date
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| students              | name
| cohorts               | name, starting_date

1. Name of the first table (always plural): `students` 

    Column names: `name`

2. Name of the second table (always plural): `cohorts` 

    Column names: `name`, `starting_date`

## 3. Decide the column types.

```
# EXAMPLE:

Table: students
id: SERIAL
name: text

Table: cohorts
id: SERIAL
name: text,
starting_date: int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [students] have many [cohorts]? (No)
2. Can one [cohorts] have many [students]? (Yes)

{students forign key}



```
# EXAMPLE

-> A cohort HAS MANY students
-> An student BELONGS TO a cohort

-> Therefore, the foreign key is on the student table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE


CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date date
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
   name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
);
```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```


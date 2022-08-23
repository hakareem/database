
DROP TABLE IF EXISTS "public"."cohorts";

CREATE SEQUENCE IF NOT EXISTS cohorts_id_seq;

CREATE TABLE "public"."cohorts" (
    "id" SERIAL,
    "title" text,
    "starting_date" int,
    PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS "public"."students";

CREATE SEQUENCE IF NOT EXISTS students_id_seq;

CREATE TABLE "public"."students" (
    "id" SERIAL,
    "name" text,
    "cohort_id" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."cohorts" ("title", "starting_date") VALUES
('Doolittle', "1992"),
('Surfer Rosa', "1888"),
('Waterloo', "1200")

INSERT INTO "public"."students" ("name", "cohort_id") VALUES
('Pixies', 1),
('ABBA', 2),
('Taylor Swift', 3)


INSERT INTO cohorts (title, starting_date) VALUES('Morar', 2022);

INSERT INTO students (name, cohort_id) VALUES('leo', 1);

SELECT * FROM students WHERE cohort_id = 1;
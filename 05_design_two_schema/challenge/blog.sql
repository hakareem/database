
DROP TABLE IF EXISTS "public"."posts";

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "title" text,
    "content" text,
    PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS "public"."comments";

CREATE SEQUENCE IF NOT EXISTS comments_id_seq;

CREATE TABLE "public"."comments" (
    "id" SERIAL,
    "name" text,
    "content" text,
    "post_id" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."posts" ("title", "content") VALUES
('Doolittle', "Ran away"),
('Surfer Rosa', "Is Blue"),
('Waterloo', "Not water")

INSERT INTO "public"."comments" ("name", "content", "post_id") VALUES
('Pixies', 'Rock', 1),
('ABBA', 'Pop', 2),
('Taylor Swift', 'Pop', 3)


INSERT INTO posts (title, content) VALUES('trip', 'sun is out');

INSERT INTO comments (name, content, post_id) VALUES('leo', 'why you lyin?', 1);

SELECT * FROM comments WHERE post_id = 1;
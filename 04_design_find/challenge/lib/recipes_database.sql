DROP TABLE IF EXISTS "public"."recipes";

CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "cooking_time" int,
    "rating" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("name", "cooking_time", "rating") VALUES
('Chicken', 5, 1),
('Pasta', 10, 3)

-- Database: "FinalProject"

-- DROP DATABASE "FinalProject";

CREATE DATABASE "FinalProject"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;

-- Drop Tables and Views

DROP VIEW IF EXISTS unbid_link;
DROP VIEW IF EXISTS unis_link;
DROP VIEW IF EXISTS unai_link;
DROP VIEW IF EXISTS book_island_link;
DROP VIEW IF EXISTS island_userid;
DROP TABLE IF EXISTS island_access_link;
DROP TABLE IF EXISTS user_access_link;
DROP TABLE IF EXISTS books_access_link;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS hawaii_libraries;

-- Table: hawaii_libraries

CREATE TABLE hawaii_libraries
(
  island character varying,
  library character varying PRIMARY KEY,
  no_checkout character varying,
  book character varying,
  cd character varying,
  dvd character varying,
  video character varying,
  phonotape character varying,
  phonodisc character varying,
  microform character varying,
  cd_rom character varying,
  software character varying,
  av_misc character varying,
  language_learning character varying,
  uncataloged character varying,
  total character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hawaii_libraries
  OWNER TO postgres;

COPY hawaii_libraries(island, library, no_checkout, book, cd, dvd, video, phonotape, phonodisc, microform, cd_rom, software, av_misc, language_learning, uncataloged, total)
	FROM 'C:/Users/Public/Libraries_Collection_Statistics_2011_2.csv' DELIMITERS ',' HEADER CSV;

SELECT * FROM hawaii_libraries;

-- create users table

CREATE TABLE users
(
  user_id SERIAL PRIMARY KEY NOT NULL,
  user_name character varying,
  library character varying
 )
  WITH (
  OIDS=FALSE
);
ALTER TABLE users
  OWNER TO postgres;


-- create books table

CREATE TABLE books
(
  book_id SERIAL PRIMARY KEY NOT NULL,
  book_title character varying,
  book_author character varying,
  library character varying
 )
  WITH (
  OIDS=FALSE
);
ALTER TABLE books
  OWNER TO postgres;

-- create table user_access_link

CREATE TABLE user_access_link
(
  user_id integer PRIMARY KEY NOT NULL,
  access_id integer
  )
  WITH (
  OIDS=FALSE
);
ALTER TABLE user_access_link
  OWNER TO postgres;

-- create table island_access_link

CREATE TABLE island_access_link
(
  access_id integer PRIMARY KEY NOT NULL,
  island character varying 
 )
  WITH (
  OIDS=FALSE
);
ALTER TABLE island_access_link
  OWNER TO postgres;

CREATE TABLE books_access_link
(
  access_id integer,
  book_id integer 
 )
  WITH (
  OIDS=FALSE
);
ALTER TABLE books_access_link
  OWNER TO postgres;

-- Add data to island_access_link

INSERT INTO island_access_link VALUES (1, 'Oahu');
INSERT INTO island_access_link VALUES (2, 'Hawaii');
INSERT INTO island_access_link VALUES (3, 'Kauai');
INSERT INTO island_access_link VALUES (4, 'Maui');

-- Add data to users

INSERT INTO users (user_name, library) VALUES ('Teri Massey', 'Ewa Beach');
INSERT INTO users (user_name, library) VALUES ('Karen Weigandt', 'Waimea');
INSERT INTO users (user_name, library) VALUES ('Mohan', 'Ewa Beach');
INSERT INTO users (user_name, library) VALUES ('Cindy Young', 'Waipahu');
INSERT INTO users (user_name, library) VALUES ('Robert Godfrey', 'Hilo');
INSERT INTO users (user_name, library) VALUES ('Yadu', 'Hilo');
INSERT INTO users (user_name, library) VALUES ('Joy Payton', 'Mountain View');
INSERT INTO users (user_name, library) VALUES ('Andy Catlin', 'Koloa');

-- Add data to user_access_link

INSERT INTO user_access_link (user_id, access_id) VALUES (1, 1);
INSERT INTO user_access_link (user_id, access_id) VALUES (2, 3);
INSERT INTO user_access_link (user_id, access_id) VALUES (3, 1);
INSERT INTO user_access_link (user_id, access_id) VALUES (4, 1);
INSERT INTO user_access_link (user_id, access_id) VALUES (5, 2);
INSERT INTO user_access_link (user_id, access_id) VALUES (6, 2);
INSERT INTO user_access_link (user_id, access_id) VALUES (7, 2);
INSERT INTO user_access_link (user_id, access_id) VALUES (8, 3);


-- Add data to books

INSERT INTO books (book_title, book_author, library) VALUES ('The Wright Brothers', 'David McCullough', 'Ewa Beach');
INSERT INTO books (book_title, book_author, library) VALUES ('The Wright Brothers', 'David McCullough', 'Hilo');
INSERT INTO books (book_title, book_author, library) VALUES ('The Road to Character', 'David Brooks', 'Ewa Beach');
INSERT INTO books (book_title, book_author, library) VALUES ('Adios, America', 'Ann Coulter', 'Waimea');
INSERT INTO books (book_title, book_author, library) VALUES ('H is for Hawk', 'Helen Macdonald', 'Ewa Beach');
INSERT INTO books (book_title, book_author, library) VALUES ('Getting Real', 'Gretchen Carlson', 'Hilo');
INSERT INTO books (book_title, book_author, library) VALUES ('Zoo', 'James Patterson', 'Ewa Beach');
INSERT INTO books (book_title, book_author, library) VALUES ('Zoo', 'James Patterson', 'Hilo');
INSERT INTO books (book_title, book_author, library) VALUES ('Zoo', 'James Patterson', 'Mountain View');
INSERT INTO books (book_title, book_author, library) VALUES ('Zoo', 'James Patterson', 'Waimea');
INSERT INTO books (book_title, book_author, library) VALUES ('Zoo', 'James Patterson', 'Hana');
INSERT INTO books (book_title, book_author, library) VALUES ('Fast Track', 'Julie Garwood', 'Ewa Beach');
INSERT INTO books (book_title, book_author, library) VALUES ('NYPD Red 2', 'James Patterson', NULL);
INSERT INTO books (book_title, book_author, library) VALUES ('Blue Labyrinth', 'Douglas Preston', NULL);

-- Add data to books_access_link

INSERT INTO books_access_link (book_id, access_id) VALUES (1, 1);
INSERT INTO books_access_link (book_id, access_id) VALUES (2, 2);
INSERT INTO books_access_link (book_id, access_id) VALUES (3, 1);
INSERT INTO books_access_link (book_id, access_id) VALUES (4, 3);
INSERT INTO books_access_link (book_id, access_id) VALUES (5, 1);
INSERT INTO books_access_link (book_id, access_id) VALUES (6, 1);
INSERT INTO books_access_link (book_id, access_id) VALUES (7, 1);
INSERT INTO books_access_link (book_id, access_id) VALUES (8, 2);
INSERT INTO books_access_link (book_id, access_id) VALUES (9, 2);
INSERT INTO books_access_link (book_id, access_id) VALUES (10, 3);
INSERT INTO books_access_link (book_id, access_id) VALUES (11, 4);
INSERT INTO books_access_link (book_id, access_id) VALUES (12, 1);
INSERT INTO books_access_link (book_id, access_id) VALUES (13, NULL);
INSERT INTO books_access_link (book_id, access_id) VALUES (14, NULL);


--Write select statements that provide the following information:

--1. All groups, and the users in each group.
--   A group should appear even if there are no users assigned to the group.
--   In our case, the group is the island where the library patron resides

DROP VIEW IF EXISTS island_userid;

CREATE VIEW island_userid AS
SELECT 
  ial.island,
  ual.user_id
  FROM island_access_link AS ial
    LEFT OUTER JOIN user_access_link AS ual
      ON ial.access_id = ual.access_id;

SELECT 
  iud.island,
  users.user_name
  FROM island_userid AS iud
  LEFT OUTER JOIN users
  ON iud.user_id = users.user_id
  ORDER BY iud.island, users.user_name ASC;



--2. All "rooms" and the "groups" assigned to each room.
--   The "rooms" should appear even if no "groups" have been assigned to them.
--   In our case "rooms" = books and "groups" are islands, he library that has the book will also be shown.



CREATE VIEW book_island_link AS
SELECT
  b.book_title,
  b.library,
  bal.access_id
  FROM books AS b
    LEFT OUTER JOIN books_access_link as bal
      ON b.book_id = bal.book_id;

--Check view
--SELECT * FROM book_island_link;

SELECT
  bil.book_title,
  bil.library,
  ial.island
  FROM book_island_link AS bil
    LEFT OUTER JOIN island_access_link as ial
      ON bil.access_id = ial.access_id;




--3. A list of users, and the "groups" that they belong to and the "rooms" to which they are assigned.
--   This should be sorted alphabetically by user, then by "group", then by "room".
--   In our case, it will be a list of users, the island for which their library affiliation 
--   gives them access, and the list of books they can borrow.


CREATE VIEW unai_link AS
SELECT
  u.user_name,
  u.library,
  ual.access_id
  FROM users AS u
    LEFT OUTER JOIN user_access_link as ual
      ON u.user_id = ual.user_id;

--Check view
--SELECT * FROM unai_link;

CREATE VIEW unis_link AS
SELECT
  unai.user_name,
  unai.library,
  ial.island,
  ial.access_id
  FROM unai_link AS unai
    LEFT OUTER JOIN island_access_link AS ial
      ON unai.access_id = ial.access_id;

--Check view
--SELECT * FROM unis_link; 

CREATE VIEW unbid_link AS
SELECT 
  unis.user_name,
  unis.library,
  unis.island,
  unis.access_id,
  bal.book_id
  FROM unis_link AS unis
    LEFT OUTER JOIN books_access_link AS bal    
      ON unis.access_id = bal.access_id;

--Check view
--SELECT * FROM unbid_link;

SELECT 
  unbid.user_name,
  unbid.island,
  b.book_title
  FROM unbid_link AS unbid
    LEFT OUTER JOIN books AS b
      ON unbid.book_id = b.book_id
      ORDER BY unbid.user_name, unbid.island, b.book_title;

      
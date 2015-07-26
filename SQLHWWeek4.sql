-- Execute as Step 1
-- Drop Database

DROP DATABASE IF EXISTS justice_league_corporation;

-- Execute as Step 2
-- Database: justice_league_corporation

CREATE DATABASE justice_league_corporation
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;

-- Execute as Step 3

-- Drop views and tables

DROP VIEW IF EXISTS managers_directreports;

DROP TABLE IF EXISTS jl_org_chart;

-- Table: jl_org_chart

CREATE TABLE jl_org_chart
(
  employee_id integer PRIMARY KEY NOT NULL,
  employee_name character varying,
  job_title character varying,
  manager_id integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE jl_org_chart
  OWNER TO postgres;

-- Fill table with data

INSERT INTO jl_org_chart VALUES (1, 'Batman', 'CEO', NULL);
INSERT INTO jl_org_chart VALUES (2, 'Robin', 'Executive Assistant', 1);
INSERT INTO jl_org_chart VALUES (3, 'Superman', 'VP Marketing', 1);
INSERT INTO jl_org_chart VALUES (4, 'Aquaman', 'VP Communications', 1);
INSERT INTO jl_org_chart VALUES (5, 'Wonder Woman', 'Manager of Truth and Justice', 3);
INSERT INTO jl_org_chart VALUES (6, 'Martian Manhunter', 'Manager Contract Negotiations', 3);
INSERT INTO jl_org_chart VALUES (7, 'Green Lantern', 'Manager Interplanetary Relations', 4);
INSERT INTO jl_org_chart VALUES (8, 'Hawkgirl', 'Manager Earth Affairs', 4);
INSERT INTO jl_org_chart VALUES (9, 'Zan', 'Monkey Wrangler', 5);
INSERT INTO jl_org_chart VALUES (10, 'Jayna', 'Jr Justice Associate', 5);


-- Create view

CREATE VIEW managers_directreports AS
SELECT
  employees.employee_name AS "employee",
  employees.job_title AS "title",
  managers.employee_name AS "manager"
  FROM
    jl_org_chart AS employees
    LEFT JOIN 
      jl_org_chart AS managers
    ON 
      employees.manager_id = managers.employee_id;

-- view the view

SELECT * FROM managers_directreports
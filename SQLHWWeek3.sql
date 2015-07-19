-- drop existing tables, child then parent

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS vidlist;

-- Table: vidlist

CREATE TABLE vidlist
(
  "videoID" character(1) NOT NULL,
  "videoName" character(80),
  "videoLength" character(100),
  "videoURL" character(100),
  CONSTRAINT "pk_videoID" PRIMARY KEY ("videoID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE vidlist
  OWNER TO postgres;

  
-- Table: reviews

CREATE TABLE reviews
(
  "reviewID" integer NOT NULL,
  "videoID" character(1) NOT NULL,
  "reviewerName" character(30),
  "reviewRating" integer,
  "reviewText" character(300),
  CONSTRAINT "pk_reviewID" PRIMARY KEY ("reviewID")
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE reviews
  OWNER TO postgres;

--Add data to tables
  
  INSERT INTO vidlist
  VALUES
  ('a', 'Scraping Table Data from Web Pages Using R', '11 minutes and 27 seconds', 'https://www.youtube.com/watch?v=lAyE0qEXc6w'),
  ('b', 'C# - C sharp html data collecting', '15 minutes 14 seconds', 'https://www.youtube.com/watch?v=rru3G7PLVjw'),
  ('c', 'Web data tutorial: Retrieving and displaying XML data | lynda.com', '13 minutes 24 seconds', 'https://www.youtube.com/watch?v=ppzYGd0wi_c');
 

  INSERT INTO reviews
  VALUES
  (1, 'a', 'Captain America', 0, 'Computer? Web Pages? R? I have no idea what you are talking about.'),
  (2, 'a', 'Iron Man', 5, 'R is awesome!  I love the web. Jarvis and I love this video!'),
  (3, 'b', 'Hawkeye', 4, 'C# , I see, Excellent video!'),
  (4, 'b', 'Black Widow', 3, 'Interesting video, i thought you killed it!'),
  (5, 'c', 'Thor', 2, 'I do not know much about web data, but I would like to meet this Lynda'),
  (6, 'c', 'Hulk', NULL, 'HULK SMASH!!!');

-- Join tables 

SELECT v."videoName", r."reviewRating", r."reviewText", r."reviewerName", v."videoURL", v."videoLength"
FROM vidlist v
LEFT OUTER JOIN reviews r
ON v."videoID" = r."videoID";


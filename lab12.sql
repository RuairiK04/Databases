-- Drop existing tables
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS follow;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
  userid VARCHAR(30) PRIMARY KEY,   -- 2. Primary key for entity integrity 
  username VARCHAR(20) UNIQUE NOT NULL,  -- . Unique and not null for domain integrity 
  signupdate DATE,
  CHECK (signupdate <= CURRENT_DATE)  -- 4. CHECK constraint for domain integrity 
);

-- Insert data into users table
INSERT INTO users VALUES ('abc12', 'john kilgallon', '2005-01-01');
INSERT INTO users VALUES ('def34', 'paul', '2006-06-15');
INSERT INTO users VALUES ('ghi08', 'mark', '2007-07-20');
INSERT INTO users VALUES ('jkl78', 'lauren', '2008-12-01');
INSERT INTO users VALUES ('mno90', 'matt', '2009-03-11');
INSERT INTO users VALUES ('pqr21', 'jane', '2010-04-15');
INSERT INTO users VALUES ('stu45', 'alice', '2012-10-10');
INSERT INTO users VALUES ('vwx67', 'bob', '2015-09-12');
INSERT INTO users VALUES ('xyz12', 'charlie', '2017-07-23');
INSERT INTO users VALUES ('klm56', 'dave', '2020-02-22');
INSERT INTO users VALUES ('opq33', 'rachel', '2020-12-12');
INSERT INTO users VALUES ('rst54', 'mike', NULL); -- NULL signupdate (valid case for NULL)
INSERT INTO users VALUES ('uvw89', 'sara', '2018-05-22');
INSERT INTO users VALUES ('xyz11', 'jessica', '2019-01-01');
INSERT INTO users VALUES ('abc99', 'tom', '2021-11-11');
INSERT INTO users VALUES ('lmn32', 'sophie', '2016-07-07');
INSERT INTO users VALUES ('ghk87', 'kevin', NULL); -- NULL signupdate (valid case for NULL)
INSERT INTO users VALUES ('tuv21', 'leo', '2022-03-03');
INSERT INTO users VALUES ('rst22', 'frank', '2020-02-22');
INSERT INTO users VALUES ('stu77', 'oliver', '2022-06-06');

-- Create follow table
CREATE TABLE follow (
  followerid VARCHAR(30),   -- 3. Foreign key for referential integrity 
  followeeid VARCHAR(30),   -- 3. Foreign key for referential integrity
  followdate DATE,
  PRIMARY KEY (followerid, followeeid), 
  FOREIGN KEY (followerid) REFERENCES users(userid),  -- Referential integrity constraint
  FOREIGN KEY (followeeid) REFERENCES users(userid)   -- Referential integrity constraint
);

-- Insert data into follow table 
INSERT INTO follow VALUES ('abc12', 'def34', '2010-01-23');
INSERT INTO follow VALUES ('jkl78', 'abc12', '2011-08-28');
INSERT INTO follow VALUES ('def34', 'ghi08', '2020-01-23');  
INSERT INTO follow VALUES ('mno90', 'ghi08', '2009-09-09'); 
INSERT INTO follow VALUES ('abc12', 'jkl78', '2015-05-10');
INSERT INTO follow VALUES ('stu45', 'mno90', '2018-01-13');
INSERT INTO follow VALUES ('ghi08', 'pqr21', '2019-03-21');
INSERT INTO follow VALUES ('vwx67', 'stu45', '2021-05-05');
INSERT INTO follow VALUES ('klm56', 'stu45', '2022-02-02');
INSERT INTO follow VALUES ('pqr21', 'abc12', '2017-07-07');

-- Create photos table
CREATE TABLE photos (
  photoid VARCHAR(30) PRIMARY KEY,   -- 2. Primary key for entity integrity 
  userid VARCHAR(30), 
  url VARCHAR(255),
  publish_date DATE,
  FOREIGN KEY (userid) REFERENCES users(userid),  -- Referential integrity constraint
  CHECK (publish_date <= CURRENT_DATE)  -- 4. CHECK constraint for domain integrity 
);

-- Insert data into photos table 
INSERT INTO photos VALUES ('pht01', 'abc12', 'pic1url', '2010-05-05');
INSERT INTO photos VALUES ('pht02', 'def34', 'pic2url', '2011-08-08');
INSERT INTO photos VALUES ('pht03', 'ghi08', 'pic3url', '2012-11-11');  
INSERT INTO photos VALUES ('pht04', 'jkl78', 'pic4url', '2013-02-14');
INSERT INTO photos VALUES ('pht05', 'mno90', 'pic5url', '2014-04-18');
INSERT INTO photos VALUES ('pht06', 'pqr21', 'pic6url', '2015-06-15');
INSERT INTO photos VALUES ('pht07', 'stu45', 'pic7url', '2016-07-17');
INSERT INTO photos VALUES ('pht08', 'vwx67', 'pic8url', '2017-08-18');
INSERT INTO photos VALUES ('pht09', 'stu45', 'pic9url', '2018-09-19');
INSERT INTO photos VALUES ('pht10', 'klm56', 'pic10url', '2019-10-20');
INSERT INTO photos VALUES ('pht11', 'opq33', 'pic11url', '2021-01-15');
INSERT INTO photos VALUES ('pht12', 'rst54', NULL, '2021-03-01');  -- NULL URL (valid case)
INSERT INTO photos VALUES ('pht13', 'uvw89', 'pic13url', '2021-05-05');
INSERT INTO photos VALUES ('pht14', 'xyz11', 'pic14url', '2021-07-07');
INSERT INTO photos VALUES ('pht15', 'abc99', 'pic15url', '2021-09-09');
INSERT INTO photos VALUES ('pht16', 'lmn32', 'pic16url', NULL);  -- NULL publish_date (valid case)
INSERT INTO photos VALUES ('pht17', 'ghk87', 'pic17url', '2021-12-12');
INSERT INTO photos VALUES ('pht18', 'tuv21', 'pic18url', '2022-02-22');
INSERT INTO photos VALUES ('pht19', 'rst22', 'pic19url', '2022-03-03');
INSERT INTO photos VALUES ('pht20', 'stu77', 'pic20url', '2022-05-05');

-- Create likes table
CREATE TABLE likes (
  userid VARCHAR(30), 
  photoid VARCHAR(30), 
  likedate DATE,  
  PRIMARY KEY (userid, photoid),   -- 8. Compound primary key for entity integrity
  FOREIGN KEY (userid) REFERENCES users(userid),   -- Referential integrity constraint
  FOREIGN KEY (photoid) REFERENCES photos(photoid)  -- Referential integrity constraint
);

-- Insert data into likes table 
INSERT INTO likes VALUES ('abc12', 'pht01', '2015-05-15');
INSERT INTO likes VALUES ('def34', 'pht02', '2016-06-16');
INSERT INTO likes VALUES ('ghi08', 'pht03', '2017-07-17');  
INSERT INTO likes VALUES ('mno90', 'pht05', '2019-09-19');
INSERT INTO likes VALUES ('jkl78', 'pht04', '2018-10-20');
INSERT INTO likes VALUES ('stu45', 'pht07', '2019-12-21');
INSERT INTO likes VALUES ('vwx67', 'pht08', '2020-11-11');
INSERT INTO likes VALUES ('stu45', 'pht09', '2021-09-22');
INSERT INTO likes VALUES ('klm56', 'pht10', '2022-03-23');
INSERT INTO likes VALUES ('pqr21', 'pht06', '2021-01-05');

-- Select data
SELECT * FROM follow;
SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM likes;

-- trigger
DROP TRIGGER IF EXISTS auto_follow_trigger ON likes;

CREATE OR REPLACE FUNCTION auto_follow()
RETURNS TRIGGER AS $$
BEGIN
  -- make sure person doesnt follow themselves through if statement
  IF NEW.userid != (SELECT userid FROM photos WHERE photoid = NEW.photoid) THEN
    INSERT INTO follow (followerid, followeeid, followdate)
    VALUES (NEW.userid, (SELECT userid FROM photos WHERE photoid = NEW.photoid), NOW());
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER auto_follow_trigger
AFTER INSERT ON likes
FOR EACH ROW
EXECUTE FUNCTION auto_follow();

-- 5 Select statement with JOIN 
SELECT u.username, p.url
FROM users u
JOIN photos p ON u.userid = p.userid;

-- 6 Select statement with aggregate function 
SELECT userid, COUNT(photoid) AS photo_count
FROM photos
GROUP BY userid;

-- table before new likes
SELECT * FROM follow;

-- table with new likes
INSERT INTO likes (userid, photoid, likedate) 
VALUES 
  ('abc12', 'pht03', '2023-12-01'),  -- abc12 likes ghi08's photo 
  ('def34', 'pht07', '2023-12-02'),  -- def34 likes stu45's photo
  ('mno90', 'pht10', '2023-12-03');  -- mno90 likes klm56's photo 

-- output the new table
SELECT * FROM follow;

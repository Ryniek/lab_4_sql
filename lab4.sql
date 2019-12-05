CREATE TABLE Cars (
    car_id long,
    mark varchar(255),
    model varchar(255),
    color varchar(255),
    production_year datetime
);

CREATE TABLE Trucks (
    truck_id long,
    mark varchar(255),
    model varchar(255),
    color varchar(255),
    production_year datetime
);

INSERT INTO cars (car_id, mark, model, color, production_year)
VALUES (1, 'Fiat', 'Panda', 'Red', '2012-12-11 10:10:20');
INSERT INTO cars (car_id, mark, model, color, production_year)
VALUES (2, 'Skoda', 'Octavia', 'Silver', '2002-12-11 10:02:20');
INSERT INTO cars (car_id, mark, model, color, production_year)
VALUES (3, 'Ford', 'Focus', 'Blue', '1999-10-22 20:00:00');

INSERT INTO trucks (truck_id, mark, model, color, production_year)
VALUES (1, 'Solaris', '12L', 'White', '2002-12-11 10:10:20');
INSERT INTO trucks (truck_id, mark, model, color, production_year)
VALUES (2, 'MAN', 'P', 'Silver', '2011-01-11 10:02:20');
INSERT INTO trucks (truck_id, mark, model, color, production_year)
VALUES (3, 'Scania', 'CR', 'Blue', '1999-10-22 20:00:00');


INSERT INTO blog_post (content, time_post, title, category_id)
VALUES ('Tescik', '2012-12-11 10:10:20', 'Elosss', 1);
INSERT INTO blog_post (content, time_post, title, category_id)
VALUES ('Sportowa tresc', '2014-12-12', 'Sportowa kategoria tytul', 1);
INSERT INTO blog_post (content, time_post, title, category_id)
VALUES ('Technology tresc', '2015-12-12', 'Technologiczna kategoria tytul', 2);
INSERT INTO blog_post (content, time_post, title, category_id)
VALUES ('Sztuka tresc', '1996-12-12', 'Sztuka kategoria tytul', 3);
INSERT INTO blog_post (id, content, time_post, title, category_id)
VALUES (12, 'Sztuka tresc', '1996-12-12', 'Sztuka kategoria tytul', 3);
INSERT INTO blog_post (id, content, time_post, title, category_id)
VALUES (13, 'Sztuka tresc', '1998-03-11', 'Sztuuka Tytul', 3);

SELECT * FROM cars;

SELECT * FROM trucks;

SELECT * FROM blog_post;

SELECT * FROM category_of_post;

SELECT DISTINCT content
FROM blog_post;

SELECT * FROM blog_post
WHERE title='Elosss';

SELECT * FROM category_of_post
WHERE name='Sport' OR name='Music';

SELECT * FROM blog_post
ORDER BY time_post;

SELECT category_id
FROM blog_post
WHERE category_id IS NOT NULL;

UPDATE blog_post
SET content = 'upddateee', title= 'titleee update'
WHERE id = 3;

DELETE FROM blog_post WHERE id='1';
INSERT INTO blog_post (id, content, time_post, title, category_id)
VALUES (1, 'Tescik', '1990-02-04 10:10:20', 'Elosss', 1);

SELECT *
FROM blog_post
WHERE id>1
LIMIT 2;

SELECT MIN(time_post)
FROM blog_post;

SELECT AVG(time_post)
FROM blog_post;

SELECT * FROM cars
WHERE model LIKE '%da';

SELECT * FROM cars
WHERE mark LIKE '___da';

SELECT * FROM blog_post
WHERE content NOT IN ('Tescik', 'maslo', 'chomik');

SELECT * FROM blog_post
WHERE time_post BETWEEN '2010-10-10' AND '2014-10-10';

SELECT mark AS Marka, model AS Model
FROM cars;

SELECT blog_post.id, blog_post.category_id AS 'Category id' ,category_of_post.name AS 'Category name', blog_post.content
FROM blog_post
INNER JOIN category_of_post ON blog_post.category_id=category_of_post.id;

SELECT blog_post.id, blog_post.category_id AS 'Category id' ,category_of_post.name AS 'Category name', blog_post.content
FROM blog_post
LEFT JOIN category_of_post ON blog_post.category_id=category_of_post.id
ORDER BY blog_post.id;

SELECT blog_post.id AS 'Blog id', blog_post.category_id AS 'Category id' ,category_of_post.name AS 'Category name'
FROM blog_post
RIGHT JOIN category_of_post ON blog_post.category_id=category_of_post.id;

SELECT blog_post.title AS 'Blog title', category_of_post.name AS 'Category name' FROM blog_post
LEFT JOIN category_of_post ON blog_post.category_id=category_of_post.id
UNION
SELECT blog_post.title AS 'Blog title', category_of_post.name AS 'Category name' FROM blog_post
RIGHT JOIN category_of_post ON blog_post.category_id=category_of_post.id;

SELECT model FROM cars
UNION
SELECT model FROM trucks;

SELECT COUNT(id), title, content
FROM blog_post
GROUP BY content;

SELECT blog_post.content, COUNT(blog_post.id) AS 'ilosc', category_of_post.name
FROM blog_post
RIGHT JOIN category_of_post ON blog_post.category_id=category_of_post.id
GROUP BY blog_post.content;

SELECT COUNT(blog_post.id) AS 'ilosc', blog_post.title, blog_post.content
FROM blog_post
GROUP BY blog_post.content
HAVING COUNT(blog_post.id) >= 2;

SELECT blog_post.id, blog_post.content
FROM blog_post
WHERE EXISTS (SELECT category_of_post.name FROM category_of_post WHERE blog_post.category_id=category_of_post.id AND category_of_post.name LIKE '%t');

SELECT blog_post.title, blog_post.time_post
FROM blog_post
WHERE blog_post.time_post = ANY (SELECT blog_post.time_post FROM blog_post WHERE blog_post.time_post > '2015-00-00 00:00:01');

INSERT INTO cars_copy
SELECT cars.car_id, cars.mark, cars.model FROM cars;

SELECT * FROM cars_copy;


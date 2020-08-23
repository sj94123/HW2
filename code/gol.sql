CREATE TABLE grid
(
    x         int,
    y         int,
    is_living boolean
);

INSERT INTO grid
VALUES (0, 0, False),
       (0, 1, True),
       (0, 2, False),
       (1, 0, True),
       (1, 1, True),
       (1, 2, False),
       (2, 0, False),
       (2, 1, False),
       (2, 2, False);

CREATE TABLE neighbors
(
    x int,
    y int,
    n int
);

CREATE UNIQUE INDEX neighbors_idx on neighbors (x, y);

INSERT INTO neighbors
SELECT x - 1, y, 1
FROM grid
WHERE is_living is True
ON CONFLICT (x, y)
    DO UPDATE SET n = neighbors.n + 1;

INSERT INTO neighbors
SELECT x, y - 1, 1
FROM grid
WHERE is_living is True
ON CONFLICT (x, y)
    DO UPDATE SET n = neighbors.n + 1;

INSERT INTO neighbors
SELECT x + 1, y, 1
FROM grid
WHERE is_living is True
ON CONFLICT (x, y)
    DO UPDATE SET n = neighbors.n + 1;

INSERT INTO neighbors
SELECT x, y + 1, 1
FROM grid
WHERE is_living is True
ON CONFLICT (x, y)
    DO UPDATE SET n = neighbors.n + 1;

DELETE
FROM neighbors
WHERE x < 0
   OR y < 0
   OR x > 2
   OR y > 2;

UPDATE grid g
SET is_living = False
WHERE ((g.x, g.y) NOT IN (SELECT x, y FROM neighbors))
   OR ((SELECT c.n FROM neighbors c WHERE g.x = c.x AND g.y = c.y) IN
       (1, 4, 5, 6, 7, 8));

UPDATE grid g
SET is_living = True
WHERE (SELECT c.n FROM neighbors c WHERE g.x = c.x AND g.y = c.y) = 3
  AND g.is_living = False;

CREATE TABLE output
(
    id int unique,
    y0 varchar,
    y1 varchar,
    y2 varchar
);

INSERT INTO output (id, y0)
SELECT g.y,
       CASE
           WHEN g.is_living is true THEN '*'
           ELSE ' '
           END
FROM grid g
WHERE g.x = 0;

UPDATE output o
SET y1 = CASE
             WHEN g.is_living is true THEN '*'
             ELSE ' '
    END
FROM grid g
WHERE o.id = g.x
  and g.y = 1;

UPDATE output o
SET y2 = CASE
             WHEN g.is_living is true THEN '*'
             ELSE ' '
    END
FROM grid g
WHERE o.id = g.x
  and g.y = 2;

SELECT *
FROM output;
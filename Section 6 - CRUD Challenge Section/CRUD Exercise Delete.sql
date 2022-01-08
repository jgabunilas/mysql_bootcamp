## Delete all old shirts (shirts worn 200 days ago)

DELETE FROM shirts
WHERE last_worn = 200;

## Delete all tank tops

DELETE FROM shirts
WHERE article = 'tank top';

## Delete all shirts in the table (leaving an empty table)!!

DELETE FROM shirts;

## Delete the entire shirts table

DROP TABLE shirts;
## Change Jackson's name to "Jack"

# SELECT * FROM cats WHERE name = "Jackson";

UPDATE cats SET name = 'Jack' WHERE name = "Jackson";

## Change Ringo's breed to "British Shorthair"

UPDATE cats SET breed = 'British Shorthair' WHERE name = "Ringo";

## Update both Maine Coons' ages to be 12
UPDATE cats SET age = 12 WHERE breed = "Maine Coon";

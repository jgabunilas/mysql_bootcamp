## Update all polo shirts to size L

UPDATE shirts
SET shirt_size = "L"
WHERE article = "polo shirt";

## Update the shirt that was last worn 15 days ago to last_worn = 0

UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15;

## Update all white shirts by changing size the "XS" and color to "off white"

UPDATE shirts
SET shirt_size = "XS", color = 'off white'
WHERE color = 'white';
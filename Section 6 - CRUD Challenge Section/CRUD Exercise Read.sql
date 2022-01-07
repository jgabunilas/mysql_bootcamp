## Select all shirts, but only print out article and color

SELECT article, color FROM shirts;

## Select all medium shirts. Print everything except the shirt_id

SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size = "M";
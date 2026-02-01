use assignmentmysql; 
SHOW TABLES;
DESCRIBE zepto_v2;
SELECT * FROM zepto_v2;

SELECT name,mrp  FROM zepto_v2;

DESCRIBE zepto_v2;
ALTER TABLE zepto_v2
RENAME COLUMN `ï»¿Category`TO category;
SELECT *
FROM zepto_v2
WHERE category = 'Fruits & Vegetables';

SELECT *
FROM zepto_v2
WHERE mrp >= 3000;

SELECT *
FROM zepto_v2
WHERE discountPercent = 15;

SELECT *
FROM zepto_v2
WHERE outOfStock = 'FALSE';

SELECT *
FROM zepto_v2
WHERE weightInGms > 500;

SELECT *
FROM zepto_v2
WHERE availableQuantity < 5;

SELECT DISTINCT category FROM zepto_v2;

SELECT COUNT(*) AS total_products FROM zepto_v2;

SELECT * FROM zepto_v2 ORDER BY mrp ASC;

SELECT * FROM zepto_v2 ORDER BY discountPercent DESC;

SELECT * FROM zepto_v2 ORDER BY mrp DESC LIMIT 10;

SELECT * FROM zepto_v2 WHERE name LIKE 'T%';

SELECT COUNT(outOfStock) FROM zepto_v2;

SELECT *
FROM zepto_v2
WHERE quantity > 50 ;

SELECT *
FROM zepto_v2
WHERE mrp BETWEEN 2000 and 4000 ;

SELECT *
FROM zepto_v2
WHERE discountedSellingPrice < 1500 ;

SELECT *
FROM zepto_v2
WHERE  weightInGms = 1000 ;

SELECT *
FROM zepto_v2
WHERE  category LIKE '%Vegetables%' ;

SELECT category, MAX(mrp) FROM zepto_v2 GROUP BY category;

SELECT category, MIN(discountedSellingPrice) FROM zepto_v2 GROUP BY category;

SELECT category, COUNT(*) FROM zepto_v2 GROUP BY category;

SELECT AVG(mrp)
FROM zepto_v2;

SELECT category, SUM(availablequantity ) 
FROM zepto_v2 
GROUP BY category;

SELECT *
FROM zepto_v2
WHERE  (mrp - discountedSellingPrice) > 1000 ;

SELECT *
FROM zepto_v2
WHERE  discountPercent > (SELECT AVG(discountPercent) FROM zepto_v2);

SELECT category 
FROM zepto_v2
GROUP BY category
HAVING COUNT(*) > 50 ;

SELECT discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 5 ;

SELECT name ,(weightInGms * availableQuantity) AS inventoryweight 
FROM zepto_v2;

SELECT *
FROM zepto_v2
WHERE discountPercent < (mrp * 0.5 );

SELECT * FROM zepto_v2
WHERE name LIKE '%Coconut%';

SELECT name, (discountedSellingPrice * availableQuantity) AS totalstockvalue FROM zepto_v2;

SELECT Category 
FROM zepto_v2
GROUP BY Category
ORDER BY AVG(discountPercent) DESC LIMIT 1;

SELECT * FROM zepto_v2
WHERE availableQuantity = 0 AND outOfStock = FALSE;

SELECT *,RANK() OVER (PARTITION BY Category ORDER BY mrp DESC) AS rank_mrp
FROM zepto_v2;

 SELECT * FROM (
        SELECT *,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY mrp DESC) AS rnk
        FROM zepto_v2
    ) t WHERE rnk = 2;

SELECT *,SUM(availableQuantity) OVER(PARTITION BY category ORDER BY name) AS cumulative_qty
FROM zepto_v2;

SELECT * FROM zepto_v2  
    WHERE mrp > (
        SELECT AVG(mrp) FROM zepto
        WHERE Category = Category
    );
SELECT * FROM zepto_v2
WHERE mrp > (SELECT AVG(mrp) FROM zepto_v2 );

SELECT *
FROM zepto_v2 z
WHERE discountPercent >
      (SELECT AVG(discountPercent)
       FROM zepto_v2
       WHERE category = z.category);

CREATE VIEW high_discount_instock AS
SELECT *
FROM zepto_v2
WHERE outOfStock = FALSE
  AND discountPercent > 20;

UPDATE zepto_v2
SET outOfStock = TRUE
WHERE availableQuantity = 0;

DELIMITER //
CREATE PROCEDURE get_products_by_category(IN cat_name VARCHAR(100))
BEGIN
    SELECT *
    FROM zepto_v2
    WHERE category = cat_name;
END //
DELIMITER ;
CALL get_products_by_category('Fruits & Vegetables');

DELIMITER //
CREATE FUNCTION discount_amount(mrp INT, selling_price INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN mrp - selling_price;
END //
DELIMITER ;
SELECT name, discount_amount(mrp, discountedSellingPrice) AS discount
FROM zepto_v2;

SELECT name, COUNT(*) AS count
FROM zepto_v2
GROUP BY name
HAVING COUNT(*) > 1;

SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY category
                        ORDER BY discountedSellingPrice ASC) AS price_rank
    FROM zepto_v2
) t
WHERE price_rank <= 3;

SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_stock_value
FROM zepto_v2
GROUP BY category
HAVING total_stock_value > 100000;

DELIMITER //
CREATE TRIGGER set_out_of_stock
BEFORE UPDATE ON zepto_v2
FOR EACH ROW
BEGIN
    IF NEW.availableQuantity = 0 THEN
        SET NEW.outOfStock = TRUE;
    END IF;
END //
DELIMITER ;

SELECT category,
       COUNT(*) AS total_products,
       AVG(mrp) AS avg_mrp,
       AVG(discountPercent) AS avg_discount
FROM zepto_v2
GROUP BY category;

SELECT *
FROM zepto_v2
WHERE mrp >
      (SELECT AVG(mrp) FROM zepto_v2);

quantity
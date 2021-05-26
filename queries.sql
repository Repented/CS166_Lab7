--query 1
SELECT COUNT(*) FROM part_nyc WHERE part_nyc.on_hand > 70;
--query 2
SELECT SUM(p.on_hand)+SUM(s.on_hand) AS total_parts 
	FROM part_nyc p CROSS JOIN part_sfo s, color c 
	WHERE p.color = c.color_id AND s.color = c.color_id AND c.color_name = 'Red';
--query 3
SELECT supplier.supplier_name 
	FROM (supplier INNER JOIN part_nyc ON supplier.supplier_id = part_nyc.supplier) 
	INNER JOIN part_sfo ON supplier.supplier_id = part_sfo.supplier
	GROUP BY supplier.supplier_name
    HAVING SUM(part_nyc.on_hand) > SUM(part_sfo.on_hand);
--query 4
SELECT DISTINCT supplier.supplier_name 
	FROM (SELECT n.part_number, n.supplier 
			FROM part_nyc n 
			WHERE n.part_number NOT IN (SELECT s.part_number 
				FROM part_sfo s)) as temp 
	INNER JOIN supplier ON supplier.supplier_id = temp.supplier;
--query 5
UPDATE part_nyc SET on_hand = on_hand - 10;
--query 6
DELETE FROM part_nyc WHERE on_hand < 30;
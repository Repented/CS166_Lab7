DROP INDEX IF EXISTS part_nyc_index;
DROP INDEX IF EXISTS part_sfo_index;
DROP INDEX IF EXISTS supplier_index;
DROP INDEX IF EXISTS color_index;

--create indexes
CREATE INDEX part_nyc_index
ON part_nyc (part_number, supplier);
CREATE INDEX part_sfo_index 
ON part_sfo (part_number, supplier);
CREATE INDEX supplier_index
ON supplier (supplier_id);
CREATE INDEX color_index
ON color (color_id);
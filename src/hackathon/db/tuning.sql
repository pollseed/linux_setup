-- Add Schema
CREATE SCHEMA `test_tuning` DEFAULT CHARACTER SET utf8 ;

-- Set As Default Schema to test_tuning

-- 1.
-- item テーブル
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pref_code` int(11) NOT NULL,
  `items_code` int(11) NOT NULL,
  `classify_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- items テーブル
CREATE TABLE `items` (
  `items_code` int(11) NOT NULL AUTO_INCREMENT,
  `items_name` varchar(128) NOT NULL,
  PRIMARY KEY (`items_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

-- 2.
-- NON Tuning
EXPLAIN 
SELECT *
FROM item i 
INNER JOIN pref p ON i.pref_code = p.pref_code 
WHERE p.pref_code = 1

-- Add Index
ALTER TABLE `item` 
ADD INDEX `idx_item1` USING BTREE (`pref_code` ASC);

-- Add FK
ALTER TABLE `item` 
ADD CONSTRAINT `fk_item1`
  FOREIGN KEY (`pref_code`)
  REFERENCES `test`.`pref` (`pref_code`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
-- Select Count
SELECT 
    COUNT(*), COUNT(IF(pref_code = 1, 1, NULL))
FROM
    test.item;

SELECT * FROM item WHERE pref_code <> 1;

-- Tuning
EXPLAIN 
SELECT *
FROM item i 
INNER JOIN pref p ON i.pref_code = p.pref_code
WHERE p.pref_code = 3;

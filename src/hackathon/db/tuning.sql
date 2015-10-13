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

-- DML
-- pref
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('北海道', '1 ', '札幌');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('青森県', '2 ', '青森');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('岩手県', '3 ', '盛岡');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('宮城県', '4 ', '仙台');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('秋田県', '5 ', '秋田');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('山形県', '6 ', '山形');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('福島県', '7 ', '福島');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('茨城県', '8 ', '水戸');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('栃木県', '9 ', '宇都宮');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('群馬県', '10 ', '前橋');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('埼玉県', '11 ', 'さいたま');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('千葉県', '12 ', '千葉');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('東京都', '13 ', '東京');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('神奈川県', '14 ', '横浜');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('新潟県', '15 ', '新潟');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('富山県', '16 ', '富山');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('石川県', '17 ', '金沢');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('福井県', '18 ', '福井');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('山梨県', '19 ', '甲府');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('長野県', '20 ', '長野');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('岐阜県', '21 ', '岐阜');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('静岡県', '22 ', '静岡');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('愛知県', '23 ', '名古屋');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('三重県', '24 ', '津');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('滋賀県', '25 ', '大津');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('京都府', '26 ', '京都');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('大阪府', '27 ', '大阪');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('兵庫県', '28 ', '神戸');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('奈良県', '29 ', '奈良');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('和歌山県', '30 ', '和歌山');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('鳥取県', '31 ', '鳥取');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('島根県', '32 ', '松江');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('岡山県', '33 ', '岡山');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('広島県', '34 ', '広島');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('山口県', '35 ', '山口');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('徳島県', '36 ', '徳島');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('香川県', '37 ', '高松');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('愛媛県', '38 ', '松山');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('高知県', '39 ', '高知');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('福岡県', '40 ', '福岡');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('佐賀県', '41 ', '佐賀');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('長崎県', '42 ', '長崎');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('熊本県', '43 ', '熊本');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('大分県', '44 ', '大分');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('宮崎県', '45 ', '宮崎');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('鹿児島県', '46 ', '鹿児島');
INSERT INTO PREF (pref_name, pref_code, pref_capital) VALUES ('沖縄県', '47 ', '那覇');

-- items
INSERT INTO `test`.`items` (`item_name`) VALUES ('石鹸');
INSERT INTO `test`.`items` (`item_name`) VALUES ('タオル');
INSERT INTO `test`.`items` (`item_name`) VALUES ('ハブラシ');
INSERT INTO `test`.`items` (`item_name`) VALUES ('コップ');
INSERT INTO `test`.`items` (`item_name`) VALUES ('箸');
INSERT INTO `test`.`items` (`item_name`) VALUES ('スプーン');
INSERT INTO `test`.`items` (`item_name`) VALUES ('雑誌');
INSERT INTO `test`.`items` (`item_name`) VALUES ('爪切り');

-- classify
INSERT INTO `test`.`classify` (`classify_name`) VALUES ('水洗用品');
INSERT INTO `test`.`classify` (`classify_name`) VALUES ('食器');
INSERT INTO `test`.`classify` (`classify_name`) VALUES ('書籍');
INSERT INTO `test`.`classify` (`classify_name`) VALUES ('日用雑貨');

-- item
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '1', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '2', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '3', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '4', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '5', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '6', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '7', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '8', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '1', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '2', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '3', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '4', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '5', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '6', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '7', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('1', '8', '2');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('2', '1', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('2', '2', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('2', '3', '1');
INSERT INTO `test`.`item` (`pref_code`, `items_code`, `classify_code`) VALUES ('2', '4', '1');

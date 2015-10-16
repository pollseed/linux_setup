-- ハンズオン用テーブル

-- Q1 以下のテーブルに対して、NULLが発生しないように正規化をして下さい

CREATE TABLE `item` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `item_type_name` varchar(128) NOT NULL,
   `name` varchar(128) NOT NULL,
   `buy_date` datetime NOT NULL,
   `sold_date` datetime,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

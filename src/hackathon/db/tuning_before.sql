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

-- Q2 データを投入後、全テーブルを結合し、`sold_date`を条件に含めて検索してそのパフォーマンスの悪さを説明して下さい

-- Q3 Q2で作ったテーブルに対して、インデクスを貼り、パフォーマンスを改善して下さい
-- ※ インデクスタイプは「BTREE」コレーションは昇順にして下さい

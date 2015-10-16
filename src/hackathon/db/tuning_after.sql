-- 正規化の例

-- item
CREATE TABLE `item` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(128) NOT NULL,
   `buy_date` datetime NOT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 
-- item_type
CREATE TABLE `item_type` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(128) NOT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- item_item_type
CREATE TABLE `item_item_type` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `item_id` int(10) unsigned NOT NULL,
   `item_type_id` int(10) unsigned NOT NULL,
   PRIMARY KEY (`id`),
   KEY `idx_item_item_type1` (`item_id`,`item_type_id`),
   KEY `fk_item_item_type2_idx` (`item_type_id`),
   CONSTRAINT `fk_item_item_type1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_item_item_type2` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 
-- item_sold
CREATE TABLE `item_sold` (
   `item_item_type_id` int(11) unsigned NOT NULL,
   `sold_date` datetime NOT NULL,
   PRIMARY KEY (`item_item_type_id`),
   CONSTRAINT `fk_item_sold1` FOREIGN KEY (`item_item_type_id`) REFERENCES `item_item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

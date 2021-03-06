## 正規化の例

### sql
```.sql
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
```

/*
以下SQLに対してチューニングをしていく
*/
```.sql
SELECT * FROM item i,item_type it,item_item_type iit,item_sold iss
where i.id = iit.item_id and it.id = iit.item_type_id and iit.id = iss.item_item_type_id
and iss.sold_date <= now();
```

/* Q3 */
## indexes
|Table|Non_unique|Key_name|Seq_in_index|Column_name|Collation|Cardinality|Sub_part|Packed|Null|Index_type|Comment|Index_comment|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|item|0|PRIMARY|1|id|A|21||||BTREE|||
|  item_type|0|PRIMARY|1|id|A|20||||BTREE|||
|item_sold|0|PRIMARY|1|item_item_type_id|A|14||||BTREE|||
|item_item_type|0|PRIMARY|1|id|A|14||||BTREE|||
|item_item_type|1|idx_item_item_type1|1|item_id|A|7||||BTREE|||
|item_item_type|1|idx_item_item_type1|2|item_type_id|A|14||||BTREE|||
|item_item_type|1|fk_item_item_type2_idx|1|item_type_id|A|14||||BTREE|||

## explain
```.sql
SELECT 
    *
FROM
    item i,
    item_type it,
    item_item_type iit,
    item_sold iss
WHERE
    i.id = iit.item_id
        AND it.id = iit.item_type_id
        AND iit.id = iss.item_item_type_id
        AND iss.sold_date <= NOW()
;

```
|id|select_type|table|type|possible_keys|key|key_len|ref|rows|Extra|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|SIMPLE|iit|index|PRIMARY,idx_item_item_type1,fk_item_item_type2_idx|idx_item_item_type1|8||14|Using index|
|1|SIMPLE|iss|eq_ref|PRIMARY|PRIMARY|4|test.iit.id|1|Using where|
|1|SIMPLE|it|eq_ref|PRIMARY|PRIMARY|4|test.iit.item_type_id|1||
|1|SIMPLE|i|eq_ref|PRIMARY|PRIMARY|4|test.iit.item_id|1||

DROP DATABASE IF EXISTS exam_homework;
CREATE DATABASE exam_homework;
USE exam_homework;
DROP TABLE IF EXISTS fruits;
CREATE TABLE fruits
(
    f_id    char(10)      NOT NULL,
    f_name  char(255)     NOT NULL,
    f_price decimal(8, 2) NOT NULL,
    PRIMARY KEY (f_id)
);

INSERT INTO fruits (f_id, f_name, f_price)
VALUES ('a1', 'apple', 5.2),
       ('b1', 'blackberry', 10.2),
       ('bs1', 'orange', 11.2),
       ('bs2', 'melon', 8.2),
       ('t2', 'grape', 5.3),
       ('o2', 'coconut', 9.2),
       ('c0', 'cherry', 3.2),
       ('a2', 'apricot', 2.2),
       ('l2', 'lemon', 6.4),
       ('b2', 'berry', 7.6),
       ('m1', 'mango', 15.6);
DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
    c_id      int       NOT NULL,
    c_name    char(50)  NOT NULL,
    c_city    char(50)  NULL,
    c_contact char(50)  NULL,
    c_email   char(255) NULL,
    PRIMARY KEY (c_id)
);

INSERT INTO customers(c_id, c_name, c_city,
                      c_contact, c_email)
VALUES (10001, 'LiMing', 'Tianjin',
        '13312345432', 'LMing@163.com'),
       (10002, 'Zhangbo',
        'Dalian', '13912345678', 'Jerry@hotmail.com'),
       (10003, 'LuoCong', 'Qingdao', '13888888888',
        NULL),
       (10004, 'YangShan', 'Haikou',
        '13777777777', 'sam@hotmail.com');
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
    o_id     int      NOT NULL AUTO_INCREMENT,
    c_id     int      NOT NULL,
    f_id     char(10) NOT NULL,
    quantity int      NOT NULL,
    PRIMARY KEY (o_id)
);

INSERT INTO orders(o_id, c_id, f_id, quantity)
VALUES (1, 10001, 'a1', 10),
       (2, 10002, 'b2', 3),
       (3, 10003, 'bs1', 5),
       (4, 10004, 'bs2', 15),
       (6, 10001, 'c0', 100),
       (7, 10001, 'o2', 50),
       (8, 10001, 'c0', 5),
       (9, 10002, 'b1', 10),
       (10, 10003, 'a2', 10),
       (11, 10004, 'm1', 5);

SELECT *
FROM customers;
SELECT *
FROM fruits;
SELECT *
FROM orders;

-- fruits表新增一条数据 ('t1', 'banana', 10.3)
INSERT INTO fruits
VALUES ('t1', 'banana', 10.3);

-- fruits表删除一条数据，('l2','lemon', 6.40)
DELETE
FROM fruits
WHERE f_id = 'l2';

-- 将fruits表中grape的单价调整为 6.3
UPDATE fruits
SET f_price = 6.3
WHERE f_id = 't2';

-- 查询哪些顾客没有留email
SELECT *
FROM customers
WHERE c_email IS NULL;

-- 查询所有水果信息，按照价格降序排列
SELECT *
FROM fruits
ORDER BY f_price DESC;

-- 查询订单一共有多少行
SELECT count(*)
FROM orders;

-- 分页查询水果信息，按照水果价格降序，每页数量是3，当前是第3页
SELECT *
FROM fruits
ORDER BY f_price DESC
LIMIT 6,3;

-- 查询订单表中每种水果的订单数量(仅显示f_id,和数量即可)
SELECT f_id, count(*)
FROM orders
GROUP BY f_id;

-- 查询city在Tianjin或Dalian的客户信息
SELECT *
FROM customers
WHERE c_city = 'Tianjin'
   OR c_city = 'Dalian';

-- 查询所有订单中，最大的销售金额是多少
SELECT MAX(orders.quantity * fruits.f_price)
FROM fruits,
     orders
WHERE fruits.f_id = orders.f_id;

-- 查询订单表中,每种水果的销售总金额大于100的水果id
SELECT fruits.f_id, MAX(orders.quantity * fruits.f_price) total
FROM fruits,
     orders
WHERE fruits.f_id = orders.f_id
GROUP BY fruits.f_id
HAVING total > 100;

-- 查询客户Zhangbo 购买了哪些水果
SELECT fruits.*
FROM fruits,
     customers,
     orders
WHERE orders.f_id = fruits.f_id
  AND customers.c_id = orders.c_id
  AND customers.c_name = 'zhangbo';

-- 在orders表中查询客户id=10001的水果总量
SELECT sum(quantity)
FROM orders
WHERE c_id = 10001;

-- 查询还有哪些水果没有订单
SELECT *
FROM fruits
         LEFT JOIN orders ON fruits.f_id = orders.f_id
WHERE orders.o_id IS NULL;

-- 查询所有客户名以li开头(不分大小写)的客户信息
SELECT *
FROM customers
WHERE c_name LIKE 'li%';

-- 查询单价5~10之间的水果信息
SELECT *
FROM fruits
WHERE fruits.f_price BETWEEN 5 AND 10;



--创建person表	
create database crashcourse;
--切换到crashcourse数据库
--number(主键int)，name（varchar 50），sex（char 1），addr（varchar 50）
use crashcourse;
	> create table person_base_info( 
    -> number int(11)primary key,
    -> name varchar(50),
    -> sex char(1),
    -> addr varchar(50)
    -> );
 	--修改字段number改名为id，类型改为bigint
	> alter table person_base_info change number id bigint;
	--添加birth字段，类型为date
	alter table person_base_info add column birth date;
	--移除id的主键约束，将name修改为主键,前提是先把 auto_increment属性去了
	alter table person_base_info modify column  id bigint not null;
	alter table person_base_info drop primary key;
	--将sex的默认值改为1
	alter table person_base_info alter column sex set default 1;
	--将name的长度改为30
	alter table person_base_info modify name varchar(30);
	--删除addr列
	alter table person_base_info drop addr;



	use crashcourse;
	create table  product(
	> pro_id varchar(255) primary key,
    -> vend_id int(255),
    -> prod_name varchar(255),
    -> prod_price decimal(4,2),
    -> prod_desc varchar(255)
    -> );
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('ANV01',1001,'.5 ton anvil',5.99,'.5 ton anvil, black, complete with handy hook');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('ANV02',1001,'1 ton anvil',9.99,'1 ton anvil, black, complete with handy hook and carrying case');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('ANV03',1001,'2 ton anvil',14.99,'2 ton anvil, black, complete with handy hook and carrying case');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('DTNTR',1003,'Detonator',13.00,'Detonator (plunger powered), fuses not included');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('FB',1003,'Bird seed',10.00,'Large bag (suitable for road runners)');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('FC',1003,'Carrots',2.50,'Carrots (rabbit hunting season only)');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('FU1',1002,'Fuses',3.42,'1 dozen, extra long');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('JP1000',1005,'JetPack 1000',35.00,'JetPack 1000, intended for single use');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('JP2000',1005,'JetPack 2000',55.00,'JetPack 2000, multi-use');
    insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('OL1',1002,'Oil can',8.99,'Oil can, red');
	insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('SAFE',1003,'Safe',50.00,'Safe with combination lock');
	insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('SLING',1003,'Sling',4.49,'Sling, one size fits all');
	insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('TNT1',1003,'TNT (1 stick)',2.50,'TNT, red, single stick');
	insert into product(prod_id,vend_id,prod_name,prod_price,prod_desc) values('TNT2',1003,'TNT (5 sticks)',10.00,'TNT, red, pack of 10 sticks');


use crashcourse;
create table vendors(
    -> vend_id int(255) primary key,
    -> vend_name varchar(255),
    -> vend_address varchar(255),
    -> vend_city varchar(255),
    -> vend_state varchar(255),
    -> vend_zip varchar(255),
    -> vend_country varchar(255)
    -> );
insert into vendors(vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) 
	values(1001,'Anvils R Us','123 Main Street','Southfield','MI',48075,'USA');
insert into vendors(vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) 
	values(1002,'LT Supplies','500 Park Street','Anytown','OH',44333,'USA');
insert into vendors(vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) 
	values(1003,'ACME','555 High Street','Los Angeles','CA',90046,'USA');
insert into vendors(vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) 
	values(1004,'Furball Inc.','1000 5th Avenue','New York','NY',11111,'USA');
insert into vendors(vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) 
	values(1005,'Jet Set.','42 Galaxy Road','London',null,'N16 6PS','England');
insert into vendors(vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) 
	values(1006,'Jouets Et Ours','1 Rue Amusement','Paris',null,45678,'France');




use crashcourse;
 create table customers(
    -> cust_id int(255) primary key,
    -> cust_name varchar(255),
    -> cust_address varchar(255),
    -> cust_city varchar(255),
    -> cust_state varchar(255),
    -> cust_zip varchar(255),
    -> cust_country varchar(255),
    -> cust_contact varchar(255),
    -> cust_email varchar(255)
    -> );
insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10001,'Coyote','200','Detroit','MI','44444','USA','Y','ylee@coyote.com');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10002,'Mouse','333','Columbus','OH','43333','USA','Jerry','NULL');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10003,'Wascals','1','Muncie','IN','42222','USA','Jim','rabbit@wascally.com');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10004,'Yosemite','829','Phoenix','AZ','88888','USA','Y','sam@yosemite.com');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10005,'E','4545','Chicago','IL','54545','USA','E','NULL');
--查询customers中，cust_name为Wascals的所有信息
select * from customers where cust_name='Wascals';
--查询proucts中prod_price为9.99的所有信息
select * from product where prod_price=9.99;
--查询venders中，vend_name为ACME的vend_address
select vend_address from vendors where vend_name='ACME';


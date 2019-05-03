SET NAMES UTF8;
DROP DATABASE IF EXISTS d_easybuy;
CREATE DATABASE d_easybuy CHARSET=UTF8;
USE d_easybuy;

##客户表
CREATE TABLE  t_khb(
	uid INT PRIMARY KEY AUTO_INCREMENT,  
	username VARCHAR(32),    				
	tel      VARCHAR(11),                 
	password VARCHAR(64),                  
	passwordAgain varchar(16),
	sex INT,
	registerTime DATETIME

);

INSERT INTO t_khb VALUES(1,'Feild','18186228854','123456','123456',null,null);
INSERT INTO t_khb VALUES(2,'Tom','18186228854','123456','123456',null,null);

##商品表
CREATE TABLE t_spb(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(16),
	snum VARCHAR(8),#商品库存
	sprice DECIMAL(6,2),#商品价格
	sdesc VARCHAR(120),
	simage VARCHAR(32),
	type INT
);  

#向商品表中插入信息
INSERT INTO t_spb VALUES(NULL,'apple','12.00','1',"苹果","/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'lizi','8.00','2',"梨子","/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'xiangjiao','6.00','3',"香蕉","/storage/goods/03.png",2);
INSERT INTO t_spb VALUES(NULL,'xigua','10.00','4',null,"/storage/goods/04.png",2);
INSERT INTO t_spb VALUES(NULL,'kele','4.00',null,'1',"/storage/goods/05.png",2);
INSERT INTO t_spb VALUES(NULL,'xuebi','3.00',null,'2',"/storage/goods/06.png",3);
INSERT INTO t_spb VALUES(NULL,'xuebi','3.00',null,'2',"/storage/goods/06.png",3);

##购物车表
CREATE TABLE t_khdgb(
	kid INT  PRIMARY KEY AUTO_INCREMENT,
	sid INT,
	tel      VARCHAR(11),
	goodname VARCHAR(32),
	number   VARCHAR(32),
	price    DECIMAL(6,2),
	sum      DECIMAL(6,2)	
);